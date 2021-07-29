unit Sn_Unit4b;

{Latest changes (May 2012): Made some cosmetic changes
Inhibitory connections can now extinguish;
Inhibitory units can now have spontaneous activation;
Inhibition is not subtracted from decayed activations anymore.
Hune 2013: Trying a single discrepancy signal: hippocampal amplified by
dopaminergic.
09-18-2020: Added second D reinforcement signal}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dlgs, Dialogs, Menus, StdCtrls, ExtCtrls,
  Buttons, ToolWin, ComCtrls, Math;

Const
     Max_NPEs = 275;  { Maximum number of units (including inputs) }
     Max_Inputs = 25; { maximum number of input elements }
     Max_ITI = 1;
     Max_Elements = 300;
     Max_d_NPEs = 30; { Maximum number of discrepancy units }
     Max_Out_NPEs = 30; { Maximum number of output units }
     Max_Pre_Inps = 25;   { maximum number of presynaptic inputs per NPE }
     Max_Time_Steps = 100; { maximum number of time steps per trial }
     Max_Tot_ts = 100000; { max num of ts }
     Max_Obs_NPEs = 50;  { maximum number of observed NPEs }
     Max_Sim_Types = 15; { maximum number of simulation types }
     Max_Tot_Sims  = 1000; { maximum number of simulations per type }
     Max_Trial_Types = 50;  { maximum number of trial types }
     Max_Duration = 1000; { maximum number of ts per trial }
     Max_Op_Targets = 25; { maximum number of operant output NPEs }
     Max_Tot_Trials = 10000;
     Nr = 1;  { Maximum weight possible on j }
     LogisMu = 0.5;   { mean of the logistic distribution }
     d_thr = 0.001; {discrepancy threshold}

type
  TForm4b = class(TForm)
    Image1: TImage;
    SaveFigureDialog: TSaveDialog;
    MainMenu1: TMainMenu;
    Save1: TMenuItem;
    BitMap1: TMenuItem;
    Sr: TMenuItem;
    Assigned1: TMenuItem;
    Computed1: TMenuItem;
    procedure OpenExpFile(Sender: TObject);
    procedure CreateMainDataDirs(Sender: TObject);
    procedure ReadExpFile(Sender: TObject);
    procedure OpenNetFile(Sender: TObject);
    procedure ReadNetFile (Sender: TObject);
    procedure OpenSchFile(Sender: TObject);
    procedure ReadSchFile(Sender: TObject);
    procedure OpenDataFiles(Sender: TObject);
    procedure DrawLegend (Sender : TObject);
    procedure DrawConditionLabels (Sender : TObject);
    procedure DrawRectangles (Sender : TObject);
    procedure DrawNPELabels (Sender : TObject);
    procedure PlotAct (Sender : TObject; X : Integer;
                       Y : Extended; SY : Integer);
    Procedure Graph_Activations (Sender : TObject; Sr : Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitMap1Click(Sender: TObject);
    procedure RunExperiment(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    Flags = -3..10;  { for probe, Pavlovian/operant, input-type,
                      net-type, npe-type, and reset-weights}

    Byte_Set = Set of Byte;

    PreInputType = Record
                         PreInp_Num: integer;
                         Weight: extended;

                         NumStr,
                         WgtStr : String;
                   end;

  { Neural-Processing-Element type }
    NPEType = Record
                    NPE_Num {NPE number} : Byte;
                    PreInpWgts, PreInpNPEs : integer;

                    Net_Kind {  1 = Polysensory; 2 = Motor },
                    NPE_Kind { -1 = hidden inhibitory;
                                0 = hidden excitatory;

                                1 = SC1;
                                2 = SC2;

                                3 = CA1;
                                4 = VTA1;

                                5 = R;
                                6 = CR/UR1
                                7 = CR/UR2 (09-18-2020)
                                8 = VTA2  (09-18-2020)}  :  Flags;

                  { Free parameters }
                    ThrMu, { 08/10/07: mean of the threshold function }
                    ThrSigma, { 08/10/07: S.D. of threshold function }

                    LogisSigma, {temperature of logistic function}
                    Tau,        { temporal summation }
                    Kappa,      { activation decay parameter }
                    Alpha,      { acquisition rate }
                    Beta       { extinction rate } : Extended;

                    SigmaStr,
                    TauStr,
                    KappaStr,
                    AlphaStr,
                    BetaStr: String;

                    p_epsp_t {EPSP} , p_ipsp_t {IPSP} ,
                    Act_t_1, Act_t, PlotAct_t {activations} : Extended;

                  { Presynaptic inputs to NPE }
                    PreInput : Array [1..Max_Pre_Inps] of PreInputType;
              end;

var
    Form4b: TForm4b;

    NPE: Array[1..Max_Elements] of NPEType;
    D_NPE : Array[1..Max_Elements] of Integer;
    ca1_NPE, vta_NPE, vta2_NPE : Array[1..Max_d_NPEs] of NPEType;
    R_NPE, CR_UR_NPE, CR_UR2_NPE : Array[1..Max_Out_NPEs] of NPEType;

  Trial_Type: Array [1..Max_Trial_Types] of
                Record
                  tt_Num,
                  Duration,
                  cur_ts,
                  Tot_Trials: integer;

                  Color : LongInt;
                  Lab : String;

                  Mode, Cue {0 = phasic, 1 = tonic; 12/07/01} : 0..1;

                  ts: Array [1..Max_Duration] of
                        Record
                          cur_input : Integer;

                         {RDependent: Sensory feedback (01/21/05}
                          RDependent, InpActMode : Array[1..Max_Inputs] of 0..1;

                          Const_Inp_Act,
                          Min_Rand_Inp_Act,
                          Max_Rand_Inp_Act,
                          Cur_Inp_Act : Array [1..Max_Inputs] of
                                               extended;

                          Const_Inp_Act_Str,
                          Min_Rand_Inp_Act_Str,
                          Max_Rand_Inp_Act_Str : Array[1..Max_Inputs] of
                                                 String;

                          USActMode : 0..3; (* for US1 and US2 *)

                          Const_US_Act,
                          Min_Rand_US_Act,
                          Max_Rand_US_Act, Cur_US_Act,
                          Const_US2_Act,
                          Min_Rand_US2_Act,
                          Max_Rand_US2_Act, Cur_US2_Act : extended;

                          Const_US_Act_Str,
                          Min_Rand_US_Act_Str,
                          Max_Rand_US_Act_Str,
                          Const_US2_Act_Str,
                          Min_Rand_US2_Act_Str,
                          Max_Rand_US2_Act_Str : String;

                          Contingency : 0..2; (*Pavlovian, operant, omision*)

                          cur_op_target,
                          Tot_Op_Targets : Integer;

                          Op_Target : Array [1..Max_Op_Targets] of
                                        Record
                                          op_npe : integer;
                                          min_op_act, max_op_act: extended;
                                          min_op_act_str,
                                          max_op_act_str : String;
                                        end;
                        end;
                end;

    Tot_Sim_Types, Tot_Sims,
    Tot_Net_Inputs, Tot_NPEs, Tot_Elements,
    Exc_NPEs, Inh_NPEs,
    Cur_PreNPE, Cur_PostNPE,
    Tot_CA1_NPEs,
    Tot_VTA_NPEs, Tot_VTA2_NPEs,
    SA_NPEs, MA_NPEs,
    Tot_R_NPEs,
    Tot_CR_UR_NPEs, Tot_CR_UR2_NPEs,
    sim, st, ovrl_tr, Inp_Patt, t, obs_npes, ob_ts, tst,
    TimeSteps, tot1, Largest,
    TotOverallTrials, Tot_Sch_Inputs, lrd, lri, tot_tr : integer;

    tr : Array[1..Max_Trial_Types] of Integer;

    Tot_ca1_d_t, tot_vta_d_t, tot_vta2_d_t,
    avg_ca1_d_t, avg_vta_d_t, avg_vta2_d_t : Extended;

    prev_num_txt, prev_wgt_txt,
    cur_num_txt, cur_wgt_txt : String;

    tr_txt, ts_txt, sim_txt : String;

    Tot_Obs_NPEs, Tot_Obs_TimeSteps : Array[1..Max_Obs_NPEs] of Integer;

    Obs_NPE : Array[1..Max_Sim_Types,1..Max_NPEs] of integer;
    Obs_ts :  Array[1..Max_Sim_Types,1..Max_Time_Steps] of integer;

    Rst_Wgts: Array[1..Max_Tot_Sims] of -1..1;

    CR_Crit, CR2_Crit, R_Crit,
    StoreActsOnSimType,
    StoreWgtsOnSimType : Array[1..Max_Tot_Sims] of Boolean;

  { Filenames }
    Exp_FileName, DataMainDir, lrm_filename,
    ca1_d_filename, vta_d_filename, vta2_d_filename : String;

    Mess,
    Net_FileName,
    Net_FileName_I,
    Net_FileName_F1, Net_FileName_F2,
    Sch_FileName : Array[1..Max_Sim_Types] of String;

    Acts_FileName : Array[1..Max_Trial_Types,
                          1..Max_Obs_NPEs] of String;

    Wgts_FileName : Array[1..Max_Trial_Types,
                          1..Max_Obs_NPEs,1..Max_Pre_Inps] of String;

    R_FileName, CR_FileName, CR2_FileName : Array[1..Max_Trial_Types,
                                                  1..Max_Out_NPEs] of String;

  { File buffers }
    Ef, Nf1, Nf2, Nf3, Sf, lrmf, ca1_d_f, vta_d_f, vta2_d_f : TextFile;
    Af : Array[1..Max_Trial_Types,1..Max_Obs_NPEs] of TextFile;
    Rf, CRf, CR2f : Array[1..Max_Trial_Types,1..Max_Out_NPEs] of TextFile;
    Wf : Array[1..Max_Trial_Types,1..Max_Obs_NPEs,
               1..Max_Pre_Inps] of TextFile;

  { added Sat. 1/23/99 at Los Chaguaramos }
    Rst_Wgts_Chkd_Bttn : Array[1..Max_Sim_Types] of 1..3;

    Tot_Trial_Types, cur_trial_type : Integer;

    ResetActs : 0..1; { added on 05/14/2003; 0 = do not reset acts at trial onset;
                                             1 = reset acts at trial onset }

    NPE_Set, Update_Set : Byte_Set;

    tsReinforced : Boolean;

    ScreenBitMap : TBitMap;
    ScreenBitMapFree : Boolean;

    largerthan : Boolean;

    Key : Word;
    Shift: TShiftState;

    R, CR, CR2 : Array[1..Max_Tot_Sims] of Extended;

    ca1_d_str, vta_d_str, vta2_d_str : String;

    Form4bOpen, ExperimentDone : Boolean;

    StoreActs, StoreWgts, StoreOps, StoreCRs, StoreCR2s : Boolean;

    Min_Rand_Init_Wgts,
    Max_Rand_Init_Wgts,
    Const_Init_Wgts : Array[1..Max_Sim_Types] of Extended;

    Ran3Inext, Ran3Inextp : Integer;
    Ran3Ma : Array[1..55] of Extended;
    Ran0Y : Extended;
    Ran0V : Array[1..97] of Extended;

    str1 : String;

    Tot_Op_Targets, Tot_Disc_NPEs, Tot_Outputs : Integer;

    R_Exc : Extended;
    Spontaneous_R_Acts : Array[1..Max_Out_NPEs] of Integer;

    vta_d, vta2_d, ca1_d : Array[1..Max_Tot_ts] of Extended;

    UpProc: String[10];

implementation

uses Sn_Unit0, ShellApi;

{$R *.DFM}

 { <========================  FUNCTIONS =======================> }

Function File_DirOperations_Datail(
         Action : String; //COPY, DELETE, MOVE, RENAME
         RenameOnCollision : Boolean; //Renames if directory exists
         NoConfirmation : Boolean; //Responds "Yes to All" to any dialogs
         Silent : Boolean; //No progress dialog is shown
         ShowProgress : Boolean; //displays progress dialog but no file names
         FromDir : String; //From directory
         ToDir : String //To directory
         ): Boolean;
var
   SHFileOpStruct : TSHFileOpStruct;
   FromBuf, ToBuf: Array [0..255] of Char;
begin
  Try
     If Not DirectoryExists(FromDir) Then
        Begin
             Result := False;
             Exit;
        End;

     Fillchar(SHFileOpStruct, Sizeof(SHFileOpStruct), 0 );
     FillChar(FromBuf, Sizeof(FromBuf), 0 );
     FillChar(ToBuf, Sizeof(ToBuf), 0 );
     StrPCopy(FromBuf, FromDir);
     StrPCopy(ToBuf, ToDir);

     With SHFileOpStruct Do
       Begin
         Wnd := 0;

         If UpperCase(Action) = 'COPY' Then wFunc := FO_COPY;
         If UpperCase(Action) = 'DELETE' Then wFunc := FO_DELETE;
         If UpperCase(Action) = 'MOVE' Then wFunc := FO_MOVE;
         If UpperCase(Action) = 'RENAME' Then wFunc := FO_RENAME;

         pFrom := @FromBuf;
         pTo := @ToBuf;
         fFlags := FOF_ALLOWUNDO;

         If RenameOnCollision Then fFlags := fFlags or FOF_RENAMEONCOLLISION;
         If NoConfirmation Then fFlags := fFlags or FOF_NOCONFIRMATION;
         If Silent Then fFlags := fFlags or FOF_SILENT;
         If ShowProgress Then fFlags := fFlags or FOF_SIMPLEPROGRESS;
       End;

       Result := (SHFileOperation(SHFileOpStruct) = 0);
  Except
        Result := False;
End;
end;


Function DelTree(DirectoryName: String): Boolean;
begin
     Result := File_DirOperations_Datail(
    'DELETE', //Action : String; //COPY, DELETE, MOVE, RENAME
     False, //RenameOnCollision : Boolean; //Renames if directory exists
     True, //NoConfirmation : Boolean; //Responds "Yes to All" to any dialogs
     True, //Silent : Boolean; //No progress dialog is shown
     False, //ShowProgress : Boolean; //displays progress dialog but no file names
     DirectoryName,//FromDir : String; //From directory
     '' //ToDir : String //To directory
);
end;


Function RandNum (idum: Integer) : Extended;
{Copied from Press, Flannery, Teukolsky, & Vetterling (1996pp. 221-222)}
const
     mbig = 4.0e6;
     mseed = 1618033.0;
     mz = 0.0;
     fac = 2.5e-7;
var
   i,ii,k : Integer;
   mj,mk : real;
begin
     if idum < 0 then
       begin
          mj := mseed + idum;

          if mj >= 0 then
            mj := mj - mbig*trunc(mj/mbig)
          else
            mj := mbig-abs(mj)+mbig*trunc(abs(mj)/mbig);

          Ran3Ma[55] := mj;
          mk := 1;

          for i := 1 to 54 do
            begin
              ii := 21*i mod 55;
              Ran3Ma[ii] := mk;
              mk := mj-mk;

              if mk < mz then
                mk := mk + mbig;

              mj := Ran3Ma[ii];
            end;

          for k := 1 to 4 do
            for i := 1 to 55 do
              begin
                Ran3Ma[i] := Ran3Ma[i] - Ran3Ma[1+((i+30) mod 55)];

                if Ran3Ma[i] < mz then
                  Ran3Ma[i] := Ran3Ma[i] + mbig;
              end;

          Ran3Inext := 0;
          Ran3Inextp := 31;
          idum := 1;
       end;

       Ran3Inext := Ran3Inext + 1;

       if Ran3Inext = 56 then
         Ran3Inext := 1;

       Ran3Inextp := Ran3Inextp + 1;

       if Ran3Inextp = 56 then
         Ran3Inextp := 1;

       mj := Ran3Ma[Ran3Inext] - Ran3Ma[Ran3Inextp];

       if mj < mz then
         mj := mj + mbig;

       Ran3Ma[Ran3Inext] := mj;
       RandNum := mj * fac;
end;


{Function Gauss_Rnd: Extended;
Const
     Num = 100;
Var
   sum, rnd: Extended;
   i: Byte;
Begin
     sum := 0;

     for i:=1 to num do
       case Rand of
         Rand1 : sum := sum + Random;
         Rand2 : sum := sum + RandNum(Random(5000) * -1);
       end;

     rnd := ThrSigma*(sum-num/2)*sqrt(12/num) + ThrMu;

     Gauss_Rnd := rnd;
End;}


Function Gauss_Rnd (Cur_NPE : Integer): Extended;
Begin
     Gauss_Rnd := randg(NPE[Cur_NPE].ThrMu,NPE[Cur_NPE].ThrSigma);
End;


Function Sum_Exc_Wgts (Cur_NPE : Integer): Extended;
{ computes the sum of the weights corresponding to the
  excitatory inputs of the current NPE }
Var
   Tot: Extended;
   p_i: Byte;
Begin
     Tot:=0;

     For p_i:=1 to NPE[Cur_NPE].PreInpNPEs do
         case NPE[NPE[Cur_NPE].PreInput[p_i].PreInp_Num].NPE_Kind of
              0,1,3,
              4,5,6: Tot:=Tot + NPE[Cur_NPE].PreInput[p_i].Weight;
         end;

     Sum_Exc_Wgts:=Tot;
End;


Function Sum_Inh_Wgts (Cur_NPE : Integer): Extended;
{ computes the sum of the weights corresponding to the
  inhibitory inputs synapsing on a given NPE (Cur_Node) }
Var
   Tot: Extended;
   p_i: Byte;
Begin
     Tot:=0;

     For p_i:=1 to NPE[Cur_NPE].PreInpNPEs do
         case NPE[NPE[Cur_NPE].PreInput[p_i].PreInp_Num].NPE_Kind of
              -1: Tot:=Tot + NPE[Cur_NPE].PreInput[p_i].Weight;
         end;

     Sum_Inh_Wgts:=Tot;
End;


Function Sum_Exc_ActWgt (Cur_NPE : Integer): Extended;
{ computes p(epsp) for an individual NPE }
Var
   Tot: Extended;
   p_i: Byte;
Begin
     Tot:=0;

     For p_i:=1 to NPE[Cur_NPE].PreInpNPEs do
       case NPE[NPE[Cur_NPE].PreInput[p_i].PreInp_Num].NPE_Kind of
          0,1,3,
          4,5,6: Tot := Tot + (NPE[Cur_NPE].PreInput[p_i].Weight *
                        NPE[NPE[Cur_NPE].Preinput[p_i].PreInp_Num].Act_t);
       end{case};

     Sum_Exc_ActWgt:=Tot;
End;


Function Sum_Inh_ActWgt (Cur_NPE: Integer): Extended;
{ computes p(ipsp) for an individual NPE }
Var
   Tot: Extended;
   p_i: Byte;
Begin
     Tot:=0;

     For p_i:=1 to NPE[Cur_NPE].PreInpNPEs do
         case NPE[NPE[Cur_NPE].PreInput[p_i].PreInp_Num].NPE_Kind of
              -1: Tot:=Tot + (NPE[Cur_NPE].PreInput[p_i].Weight *
                              NPE[NPE[Cur_NPE].PreInput[p_i].PreInp_Num].Act_t);
         end;

     Sum_Inh_ActWgt:=Tot;
End;


Function Logistic (x: Extended; Cur_NPE: Integer): Extended;
Begin
     Logistic := 1 / (1 + exp((-x+LogisMu)/NPE[Cur_NPE].LogisSigma))
End;


Function R_Criterion: Boolean;
Var
   n : Byte;
   r_c : Boolean;
Begin
  r_c := true;
  n:=0;

  with Trial_Type[inp_patt] do
    with ts[t] do
      for n := 1 to Tot_Op_Targets do
        with Op_Target[n] do
           with NPE[Op_NPE] do
               r_c := (r_c) and
               (Act_t > min_op_act) and (Act_t < max_op_act);

     R_Criterion := r_c;
end;


Function Activation(Cur_NPE: Integer): Extended;
Var
   thr, p_epsp_t_1, exc, inh: Extended;
   Act_Case : 1..3;
Begin
   Activation := 0;

   p_epsp_t_1 := NPE[Cur_NPE].p_epsp_t;

 { net amount of excitation on current NPE }
   exc := Sum_Exc_ActWgt(Cur_NPE);

   NPE[Cur_NPE].p_epsp_t := Logistic(exc,Cur_NPE);

   If (NPE[Cur_NPE].NPE_Kind = 5) then
      R_Exc := exc;

 { net amount of inhibition on current NPE (05-02-2014}
   if inh_NPEs = 0 then inh := 0 else inh := Sum_Inh_ActWgt(Cur_NPE);

 {No spontaneous level of inhibition allowed
    without inhibitory units (05-02-2014)}
  if inh_NPEs = 0 then
      NPE[Cur_NPE].p_ipsp_t := 0
   else
      NPE[Cur_NPE].p_ipsp_t := Logistic(inh,Cur_NPE);

   thr := Gauss_Rnd (Cur_NPE);  { Gaussian threshold }

   With NPE[Cur_NPE] do
       begin
        if (p_epsp_t > p_ipsp_t) and (p_epsp_t >= thr) then
            Act_Case := 1;

        if (p_epsp_t > p_ipsp_t) and (p_epsp_t < thr) then
              Act_Case := 2;

        if (p_epsp_t <= p_ipsp_t) then
              Act_Case := 3;

        Case Act_Case of
          1: Activation := (p_epsp_t + tau*p_epsp_t_1*(1-p_epsp_t)) - p_ipsp_t;

       { Inhibition is not subtracted from decayed activations
        anymore (04-02-2008);
        now decay is of p_epsp_t, instead of act_t_1 (05-02-2014)}

          2: Activation := p_epsp_t_1-(kappa*p_epsp_t_1);
          {2: Activation := act_t_1-(kappa*act_t_1*(1-act_t_1)); OLD VERSION!}

          3: Activation := 0;
        end{case};
     end;
End;


Function Activation2 (Cur_NPE : Integer): Extended;
Var
   thr, p_epsp_t_1, exc, inh: Extended;
   Act_Case : 1..3;
Begin
   p_epsp_t_1 := NPE[Cur_NPE].p_epsp_t;

 { net amount of excitation on current NPE }
   exc := Sum_Exc_ActWgt(Cur_NPE);

   NPE[Cur_NPE].p_epsp_t := Logistic(exc,Cur_NPE);

   If (NPE[Cur_NPE].NPE_Kind = 5) then
      R_Exc := exc;

 { net amount of excitation on current NPE }
   inh := Sum_Inh_ActWgt(Cur_NPE);

 { Spontaneous level of inhibition now allowed (03-31-2008)
   EVEN IF THERE ARE NO INHIBITORY UNITS!! (09-29-2009)}
   NPE[Cur_NPE].p_ipsp_t := Logistic(inh,Cur_NPE);

   thr := Gauss_Rnd (Cur_NPE);  { Gaussian threshold }

   With NPE[Cur_NPE] do
       begin
          if (p_epsp_t > p_ipsp_t) and (p_epsp_t >= thr) then
            Act_Case := 1;

          if (p_epsp_t > p_ipsp_t) and (p_epsp_t < thr) then
              Act_Case := 2;

          if (p_epsp_t <= p_ipsp_t) or (p_epsp_t_1*(1-p_epsp_t) < 0) then
              Act_Case := 3;

          Case Act_Case of
              1: Activation2 := (p_epsp_t + tau*p_epsp_t_1*(1-p_epsp_t)) - p_ipsp_t;

          { Inhibition is not subtracted from decayed activations
            anymore (04-02-2008)}
              2: Activation2 := (Act_t_1-(kappa*Act_t_1));

              3: Activation2 := 0;
          end{case};
     end;
End;


Function Avg_CA1_d: Extended; { Reinforcing signal for polysensory NPEs}
Begin
     if Tot_CA1_NPEs>0 then
        Avg_CA1_d:=Tot_CA1_d_t/Tot_CA1_NPEs
     else
         Avg_CA1_d:=0;
End;


Function Avg_VTA_d: Extended; { VTA1 signal for motor NPEs }
Begin
     if (Tot_VTA_d_t>0) and (Tot_VTA_NPEs>0) then
        Avg_VTA_d:=Tot_VTA_d_t/Tot_VTA_NPEs
     else
         Avg_VTA_d:=0;
End;


Function Avg_VTA2_d: Extended; { VTA2 signal for motor NPEs: 09-29-2020 }
Begin
     if (Tot_VTA2_d_t>0) and (Tot_VTA2_NPEs>0) then
        Avg_VTA2_d:=Tot_VTA2_d_t/Tot_VTA2_NPEs
     else
         Avg_VTA2_d:=0;
End;


Function Reinforcement : Boolean;
Var
   rnd : Extended;
Begin
   with Trial_Type[Inp_Patt] do
     with ts[t] do
       begin
         rnd := 0;

         case USActMode {deterministic or random activation} of
           0: Cur_US_Act := Const_US_Act;
           1: begin
                repeat
                   case rand of
                     rand1: rnd := Random;
                     rand2: rnd := RandNum(Random(5000) * -1);
                   end{case};
                until (rnd >= Min_Rand_US_Act) and
                      (rnd <= Max_Rand_US_Act);

                cur_US_Act := rnd;
              end;
           2: Cur_US2_Act := Const_US2_Act;
           3: begin
                repeat
                   case rand of
                     rand1: rnd := Random;
                     rand2: rnd := RandNum(Random(5000) * -1);
                   end{case};
                until (rnd >= Min_Rand_US2_Act) and
                      (rnd <= Max_Rand_US2_Act);

                cur_US2_Act := rnd;
              end;
         end{case};

         case contingency of
            0: Reinforcement := (Cur_US_Act > 0); {Pavlovian}
            1: Reinforcement := (Cur_US_Act > 0) and (R_Criterion);
            2: if R_Criterion then  { omission training: 01/21/05 }
                 Reinforcement := False
               else
                  Reinforcement := (Cur_US_Act > 0);
         end{case};
       end;
end;

 { <========================  PROCEDURES =======================> }

procedure DelaySim(ms : LongInt);
var
   i : LongInt;
begin
     for i := 1 to ms do begin end;
end;


procedure TForm4b.OpenExpFile(Sender: TObject);
begin
     Form4bOpen := False;
     ExperimentDone := False;
     Exp_FileName := Form0.OpenDialog1.FileName;
     AssignFile(Ef,Exp_FileName);

     {$I-}
     ReSet(Ef);
     {$I+}

     if IOResult = 0 then
        ReadExpFile(sender)
     else
         Form0.Run1.Enabled := True;
end;


Procedure TForm4b.ReadExpFile (Sender: TObject); (*reads sim file *)
var
   i, s, code, st : integer;
   CR_c, CR2_c, R_c, s_a, s_w : 0..2;
begin
   StoreActs := False;
   StoreWgts := False;
   StoreOps := False;
   StoreCRs := False;
   StoreCR2s := False;

   Form0.Run1.Enabled := False;

  {$I-}
   Readln(Ef, Tot_Sim_Types);
  {$I+}

   if IOResult <> 0 then
     begin
       MessageDlg('Invalid number of conditions.',mtError,[mbCancel],0);
       CloseFile(Ef);
       Form0.Caption := 'SelNet';
       Form0.Run1.Enabled := True;
       Exit;
     end;

   if tot_sim_types > Max_sim_types then
     begin
       MessageDlg('Too many conditions.',mtError,[mbCancel],0);
       CloseFile(Ef);
       Form0.Caption := 'SelNet';
       Form0.Run1.Enabled := True;
       Exit;
     end;

  {$I-}
   Readln(Ef, Tot_Sims);
  {$I+}

   if IOResult <> 0 then
     begin
       MessageDlg('Invalid number of replications.',mtError,[mbCancel],0);
       CloseFile(Ef);
       Form0.Caption := 'SelNet';
       Form0.Run1.Enabled := True;
       Exit;
     end;

   if tot_sims > Max_tot_sims then
     begin
       MessageDlg('Too many replications.',mtError,[mbCancel],0);
       CloseFile(Ef);
       Form0.Caption := 'SelNet';
       Form0.Run1.Enabled := True;
       Exit;
     end;

   Readln(Ef, UpProc);

   For st := 1 to Tot_Sim_Types do
     begin
       Net_FileName_I[st] := '';
       Net_FileName_F1[st] := '';
       Net_FileName_F2[st] := '';
       Sch_FileName[st] := '';

       Readln(Ef, Mess[st]);
       Readln(Ef, Net_FileName[st]);
       Readln(Ef, Sch_FileName[st]);

      {$I-}
       Readln(Ef, Rst_Wgts[st]);
      {$I+}

       if (IOResult <> 0) or
          (Rst_Wgts[st] > 1) or
          (Rst_Wgts[st] < -1) then
         begin
           MessageDlg('Invalid flag for reseting weights.',mtError,[mbCancel],0);
           Form0.Caption := 'SelNet';
           Form0.Run1.Enabled := True;
           CloseFile(Ef);
           Exit;
         end;

       Case Rst_Wgts[st] of
          -1: begin
               {$I-}
                Readln(Ef, Min_Rand_Init_Wgts[st]);
               {$I+}

               if (IOResult <> 0) or
                  (Min_Rand_Init_Wgts[st] < 0) or
                  (Min_Rand_Init_Wgts[st] > 1) then
                  begin
                     MessageDlg('Invalid minimum random initial weight.',
                                 mtError,[mbCancel],0);
                     CloseFile(Ef);
                     Form0.Caption := 'SelNet';
                     Form0.Run1.Enabled := True;
                     Exit;
                  end;

               {$I-}
                Readln(Ef, Max_Rand_Init_Wgts[st]);
               {$I+}

               if (IOResult <> 0) or
                  (Max_Rand_Init_Wgts[st] < 0) or
                  (Max_Rand_Init_Wgts[st] > 1) then
                  begin
                     MessageDlg('Invalid maximum random initial weight.',
                                 mtError,[mbCancel],0);
                     CloseFile(Ef);
                     Form0.Caption := 'SelNet';
                     Form0.Run1.Enabled := True;
                     Exit;
                  end;
              end;

           0: Readln(Ef);

           1: begin
               {$I-}
                Readln(Ef, Const_Init_Wgts[st]);
               {$I+}

               if (IOResult <> 0) or
                  (Const_Init_Wgts[st] < 0) or
                  (Const_Init_Wgts[st] > 1) then
                  begin
                     MessageDlg('Invalid constant initial weight.',
                                 mtError,[mbCancel],0);
                     CloseFile(Ef);
                     Form0.Caption := 'SelNet';
                     Form0.Run1.Enabled := True;
                     Exit;
                  end;
              end;
       end{case};

     {$I-}
      Readln(Ef, Tot_Obs_NPEs[st]);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid number of NPEs.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          Exit;
        end;

      if tot_obs_npes[st] > Max_NPEs then
        begin
          MessageDlg('Too many observed NPEs.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          Exit;
        end;

      if Tot_Obs_NPEs[st] > 0 then
        begin
          For i := 1 to Tot_Obs_NPEs[st] do
             begin
              {$I-}
               Read(Ef, Obs_NPE[st,i]);
              {$I+}

               if IOResult <> 0 then
                 begin
                   MessageDlg('Invalid value for an NPE.',mtError,[mbCancel],0);
                   Form0.Caption := 'SelNet';
                   Form0.Run1.Enabled := True;
                   CloseFile(Ef);
                   Exit;
                 end;

               if Obs_NPE[st,i] > Max_NPEs then
                 begin
                   MessageDlg('NPE number too large.',mtError,[mbCancel],0);
                   CloseFile(Ef);
                   Form0.Caption := 'SelNet';
                   Form0.Run1.Enabled := True;
                   Exit;
                 end;
             end;

          Readln(Ef);
        end else
          Readln(Ef);

     {$I-}
      Readln(Ef, Tot_Obs_TimeSteps[st]);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid number of time-steps.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          Exit;
        end;

      if tot_obs_TimeSteps[st] > Max_time_steps then
        begin
          MessageDlg('Too many time_steps.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          Exit;
        end;

      if Tot_Obs_TimeSteps[st] > 0 then
        begin
          for i := 1 to Tot_Obs_TimeSteps[st] do
            begin
             {$I-}
              Read(Ef, Obs_ts[st,i]);
             {$I+}

              if IOResult <> 0 then
                begin
                  MessageDlg('Invalid value for a time-step.',mtError,[mbCancel],0);
                  CloseFile(Ef);
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  Exit;
                end;

              if Obs_ts[st,i] > Max_time_steps then
                begin
                  MessageDlg('Time_step too large.',mtError,[mbCancel],0);
                  CloseFile(Ef);
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  Exit;
                end;
            end;

           readln(Ef);
        end else
          readln(Ef);

     {$I-}
      Readln(Ef, s_a);
     {$I+}

      if (IOResult <> 0) or
         (s_a < 0) or
         (s_a > 1) then
        begin
          MessageDlg('Invalid flag for storing activations.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          Exit;
        end;

      case s_a of
         0: StoreActsOnSimType[st] := False;
         1: StoreActsOnSimType[st] := True;
      end{case};

      StoreActs := (StoreActs) or (StoreActsOnSimType[st]);

     {$I-}
      Readln(Ef, s_w);
     {$I+}

      if (IOResult <> 0) or
         (s_w < 0) or
         (s_w > 1) then
        begin
          MessageDlg('Invalid flag for storing weights.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          Exit;
        end;

      case s_w of
         0: StoreWgtsOnSimType[st] := False;
         1: StoreWgtsOnSimType[st] := True;
      end{case};

      StoreWgts := (StoreWgts) or (StoreWgtsOnSimType[st]);

     {$I-}
      Readln(Ef, R_c);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid flag for operant criterion.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          Exit;
        end;

      Case R_c of
         0: begin
              R_Crit[st] := False;
              readln(Ef);
            end;

         1: begin
              R_Crit[st] := True;

             {$I-}
              Readln(Ef,R[st]);
             {$I+}

              if (IOResult <> 0) or
                 (R[st] < 0) or
                 (R[st] > 1) then
                begin
                   MessageDlg('Invalid operant criterion.',
                               mtError,[mbCancel],0);
                   CloseFile(Ef);
                   Form0.Caption := 'SelNet';
                   Form0.Run1.Enabled := True;
                   Exit;
                end;
            end;
      end{case};

     {$I-}
      Readln(Ef, CR_c);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid flag for CR1 criterion.',mtError,[mbCancel],0);
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          CloseFile(Ef);
          Exit;
        end;

      Case CR_c of
         0: begin
              readln(Ef);
              CR_crit[st] := False;
            end;

         1: begin
              CR_Crit[st] := True;
             {$I-}
              Readln(Ef,CR[st]);
             {$I+}

              if (IOResult <> 0) or
                 (CR[st] < 0) or
                 (CR[st] > 1) then
                begin
                   MessageDlg('Invalid CR1 criterion.',
                               mtError,[mbCancel],0);
                   CloseFile(Ef);
                   Form0.Caption := 'SelNet';
                   Form0.Run1.Enabled := True;
                   Exit;
                end;
            end;
       end{case};

     {$I-}
      Readln(Ef, CR2_c);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid flag for CR2 criterion.',mtError,[mbCancel],0);
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          CloseFile(Ef);
          Exit;
        end;

      Case CR2_c of
         0: begin
              readln(Ef);
              CR2_crit[st] := False;
            end;

         1: begin
              CR2_Crit[st] := True;
             {$I-}
              Readln(Ef,CR2[st]);
             {$I+}

              if (IOResult <> 0) or
                 (CR2[st] < 0) or
                 (CR2[st] > 1) then
                begin
                   MessageDlg('Invalid CR2 criterion.',
                               mtError,[mbCancel],0);
                   CloseFile(Ef);
                   Form0.Caption := 'SelNet';
                   Form0.Run1.Enabled := True;
                   Exit;
                end;
            end;
      end{case};

      StoreCRs := (StoreCRs) or (CR_Crit[st]);
      StoreCR2s := (StoreCR2s) or (CR2_Crit[st]);
      StoreOps := (StoreOps) or (R_Crit[st]);
     end;

   CloseFile(Ef);
   CreateMainDataDirs(Sender);
end;


Procedure TForm4b.CreateMainDataDirs (Sender: TObject);
Var
   st : Integer;
   txt, efn, dirname : String;
Begin
  efn := Exp_FileName;

  Delete(efn,Length(Exp_FileName)-3,4);

  DataMainDir := efn + ' data';

  if (not(DirectoryExists(DataMainDir))) then
    begin
      if ((StoreActs) or (StoreWgts) or
          (StoreCRs) or (StoreOps)) then
        begin
          MkDir(DataMainDir);

          for st := 1 to Tot_Sim_Types do
            begin
              Str(st,txt);

              if (not(DirectoryExists(DataMainDir +
                     '\' + Mess[st]))) and
                     ((StoreActsOnSimType[st]) or
                      (StoreWgtsOnSimType[st]) or
                      (CR_Crit[st]) or
                      (R_Crit[st])) then
                       begin
                          dirname := DataMainDir + '\' + Mess[st];

                          MkDir(dirname);
                       end;
            end;
        end;

        Form4bOpen := True;
        Application.CreateForm(TForm4b, Form4b);
        Form4b.RunExperiment(Sender);
    end else
        if MessageDlg('An experiment with the same name has ' +
                      'been run.  ' +
                      'Previous data will be ' +
                      'removed. Proceed?',
                       mtWarning,[mbYes, mbNo],0) = mrYes then
          begin
            Form0.Cursor := crHourGlass;
            DelTree(DataMainDir);
            MkDir(DataMainDir);
            Form0.Cursor := crDefault;

            if ((StoreActs) or (StoreWgts) or
                (StoreCRs) or (StoreOps)) then
              for st := 1 to Tot_Sim_Types do
                begin
                  Str(st,txt);

                  if not(DirectoryExists(DataMainDir +
                                        '\' +
                                         Mess[st])) and
                                       ((StoreActsOnSimType[st]) or
                                        (StoreWgtsOnSimType[st]) or
                                        (CR_Crit[st]) or
                                        (R_Crit[st])) then
                    MkDir(DataMainDir + '\' +
                          Mess[st]);
                end;

            Form4bOpen := True;
            Application.CreateForm(TForm4b, Form4b);
            Form4b.RunExperiment(Sender);
          end else
              Form0.Run1.Enabled := True;
End;


Procedure TForm4b.OpenNetFile (Sender: TObject) { in };
var
   txt : String;
   Action: TCloseAction;
   temp_net_filename : String;
Begin
     temp_net_filename := net_filename[st];

     if st > 1 then
        if net_filename[st] = Net_FileName[st-1] then
           begin
                delete(temp_net_filename,length(temp_net_filename)-3,4);
                str(st-1,txt);
                Net_FileName_I[st] := temp_net_filename +
                                      '[' + txt + '].ntw';
           end else
               Net_FileName_I[st] := net_filename[st]
     else
         Net_FileName_I[st] := net_filename[st];

     AssignFile(Nf1,Net_FileName_I[st]);

    {$I-}
     Reset(Nf1);
    {$I+}

     If IOResult = 0 then
       ReadNetFile(Sender)
     else
         begin
            MessageDlg('"' + Net_FileName_I[st] +
                       '" does not exist.', mtError, [mbCancel], 0);

            CloseFile(Nf1);
            ExperimentDone := True;
            FormClose(sender,action);
            Form0.Run1.Enabled := True;
         end;
End;


procedure TForm4b.ReadNetFile (Sender: TObject);
var
   cnpe, pi, code, inp : integer;
   txt :String;
begin
   Exc_NPEs := 0;
   Inh_NPEs := 0;
   Tot_CA1_NPEs := 0;
   Tot_VTA_NPEs := 0;
   Tot_VTA2_NPEs := 0;
   SA_NPEs := 0;
   MA_NPEs := 0;
   Tot_R_NPEs := 0;
   Tot_CR_UR_NPEs := 0;
   Tot_CR_UR2_NPEs := 0;

  {$I-}
   Readln(Nf1, Tot_Net_Inputs);
  {$I+}

   if (IOResult <> 0) or (Tot_Net_Inputs < 1) then
     begin
       MessageDlg('Invalid number of S units.',mtError,[mbCancel],0);
       CloseFile(Nf1);
       Exit;
     end;

   if (Tot_Net_Inputs > Max_Inputs) then
     begin
       MessageDlg('Too many S units.',mtError,[mbCancel],0);
       CloseFile(Nf1);
       Exit;
     end;

  {$I-}
   Readln(Nf1, Tot_NPEs);
  {$I+}

   if (IOResult <> 0) or (Tot_NPEs < 1) then
     begin
       MessageDlg('Invalid number of NCUs.',mtError,[mbCancel],0);
       CloseFile(Nf1);
       Exit;
     end;

   if (Tot_NPEs > Max_NPEs) then
     begin
       MessageDlg('Too many NCUs.',mtError,[mbCancel],0);
       CloseFile(Nf1);
       Exit;
     end;

   Tot_Elements := Tot_Net_Inputs + Tot_NPEs;

   if (Tot_Elements > Max_Elements) then
     begin
       MessageDlg('Too many total units.',mtError,[mbCancel],0);
       CloseFile(Nf1);
       Exit;
     end;

   For inp := 1 to Tot_Net_Inputs do
     begin
       NPE[inp].NPE_Num := inp;
       NPE[inp].Net_Kind := 1; { Input-element net type ? }
       NPE[inp].NPE_Kind := 1; { Input-element npe type ? }
     end;

   NPE_Set := [];

   For cnpe := Tot_Net_Inputs + 1 to Tot_Elements do
     with NPE[cnpe] do
       begin
         {$I-}
          Readln(Nf1, NPE_Num);
         {$I+}

          if (IOResult <> 0) then
            begin
              MessageDlg('Invalid unit number.',mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

          Str(NPE_Num,txt);

          if (NPE_Num < 2) or (NPE_Num > Max_NPEs) then
            begin
              MessageDlg('Unit number out of range.',mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

          if NPE_num <= 254 then
            NPE_Set := NPE_Set + [NPE_Num]
          else
            begin
              MessageDlg('Network size too large.',mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

         {$I-}
          Readln(Nf1, Net_Kind);
         {$I+}

          if (IOResult <> 0) or (Net_Kind < 1) or (Net_Kind > 2) then
            begin
              MessageDlg('Invalid network type for unit ' + txt + '.',
                          mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

         {$I-}
          Readln(Nf1, NPE_Kind);
         {$I+}

          if (IOResult <> 0) or (NPE_Kind < -1) or (NPE_Kind > 6) then
            begin
              MessageDlg('Invalid type for unit ' + txt + '.',
                          mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

          {If NPE_Kind = 4 then ThrMu := 0.2 else ThrMu := 0.3; {08/10/07}
          ThrMu := 0.2;
          ThrSigma := 0.15;
          Readln(Nf1, SigmaStr);
          Readln(Nf1, TauStr);
          Readln(Nf1, KappaStr);
          Readln(Nf1, AlphaStr);
          Readln(Nf1, BetaStr);

          val(SigmaStr,LogisSigma,code);
          if (code <> 0) or (LogisSigma <= 0) or (LogisSigma > 1) then
            begin
              MessageDlg('Invalid logistic standard deviation for unit '
                          + txt + '.',mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

          val(TauStr,Tau,code);
          if (code <> 0) or (tau <= 0) or (tau > 1) then
            begin
              MessageDlg('Invalid temporal summation for unit ' + txt + '.',
                          mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

          val(KappaStr,Kappa,code);
          if (code <> 0) or (kappa <= 0) or (kappa > 1) then
            begin
              MessageDlg('Invalid decay parameter for unit ' + txt + '.',
                          mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

          val(AlphaStr,Alpha,code);
          if (code <> 0) or (alpha < 0) or (alpha > 1) then
            begin
              MessageDlg('Invalid weight-increase parameter for unit ' + txt + '.',
                          mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

          val(BetaStr,Beta,code);
          if (code <> 0) or (beta < 0) or (beta > 1) then
            begin
              MessageDlg('Invalid weight-decrease parameter for unit ' + txt + '.',
                          mtError,[mbCancel],0);
              CloseFile(Nf1);
              Exit;
            end;

       {$I-}
        Readln(Nf1, PreInpNPEs);
       {$I+}

        if (IOResult <> 0) or
           (PreInpNPEs < 1) or (PreInpNPEs > Max_Pre_Inps) then
          begin
            MessageDlg('Invalid number of presynaptic inputs for unit ' + txt + '.',
                        mtError,[mbCancel],0);

            CloseFile(Nf1);
            Exit;
          end;

        PreInpWgts := PreInpNPEs;

        for pi := 1 to PreInpNPEs do
          with PreInput[pi] do
            begin
              Readln(Nf1, NumStr);
              val(NumStr,PreInp_Num,code);
              if (code <> 0) or (PreInp_Num < 1) or
                 (PreInp_Num > Tot_Net_Inputs + Tot_NPEs) then
                begin
                  MessageDlg('Invalid presynaptic input for unit ' + txt + '.',
                              mtError,[mbCancel],0);
                  CloseFile(Nf1);
                  Exit;
                end;

              Readln(Nf1,PreInput[pi].WgtStr);
              val(WgtStr,Weight,code);
              if (code <> 0) {or (Weight < 0) or (Weight > 1)} then
                begin
                  MessageDlg('Invalid weight for presynaptic unit ' +
                             NumStr + ' of unit ' + txt + '.',
                             mtError,[mbCancel],0);
                  CloseFile(Nf1);
                  Exit;
                end;
            end;

        Case Net_Kind of
           1: SA_NPEs:=SA_NPEs+1;
           2: MA_NPEs:=MA_NPEs+1;
        end{case};

        Case NPE_Kind of
          -1: Inh_NPEs := Inh_NPEs + 1;
           0: Exc_NPEs := Exc_NPEs + 1;
           3: begin
                Tot_ca1_NPEs := Tot_ca1_NPEs + 1;
                ca1_NPE[Tot_ca1_NPEs].NPE_Num := NPE_Num;
                ca1_NPE[Tot_ca1_NPEs].Net_Kind := Net_Kind;
                ca1_NPE[Tot_ca1_NPEs].NPE_Kind := NPE_Kind;
                ca1_NPE[Tot_ca1_NPEs].PreInpNPEs := PreInpNPEs;

                for pi := 1 to PreInpNPEs do
                  begin
                    ca1_NPE[Tot_ca1_NPEs].
                             PreInput[pi].PreInp_Num :=
                             PreInput[pi].PreInp_Num;

                    ca1_NPE[Tot_ca1_NPEs].
                             PreInput[pi].
                             Weight := PreInput[pi].Weight;
                  end;

                ca1_NPE[Tot_ca1_NPEs].LogisSigma := LogisSigma;
                ca1_NPE[Tot_ca1_NPEs].Tau := Tau;
                ca1_NPE[Tot_ca1_NPEs].Kappa := Kappa;
                ca1_NPE[Tot_ca1_NPEs].Alpha := Alpha;
                ca1_NPE[Tot_ca1_NPEs].Beta := Beta;
              end;

           4: begin
                Tot_vta_NPEs := Tot_vta_NPEs + 1;
                vta_NPE[Tot_vta_NPEs].NPE_Num := NPE_Num;
                vta_NPE[Tot_vta_NPEs].Net_Kind := Net_Kind;
                vta_NPE[Tot_vta_NPEs].NPE_Kind := NPE_Kind;
                vta_NPE[Tot_vta_NPEs].PreInpNPEs := PreInpNPEs;

                for pi := 1 to PreInpNPEs do
                  begin
                    vta_NPE[Tot_vta_NPEs].
                             PreInput[pi].
                             PreInp_Num := PreInput[pi].PreInp_Num;

                    vta_NPE[Tot_vta_NPEs].
                             PreInput[pi].
                             Weight := PreInput[pi].Weight;
                  end;

                vta_NPE[Tot_vta_NPEs].LogisSigma := LogisSigma;
                vta_NPE[Tot_vta_NPEs].Tau := Tau;
                vta_NPE[Tot_vta_NPEs].Kappa := Kappa;
                vta_NPE[Tot_vta_NPEs].Alpha := Alpha;
                vta_NPE[Tot_vta_NPEs].Beta := Beta;
              end;

           5: begin
                Tot_R_NPEs := Tot_R_NPEs + 1;
                R_NPE[Tot_R_NPEs].NPE_Num := NPE_Num;
                R_NPE[Tot_R_NPEs].Net_Kind := Net_Kind;
                R_NPE[Tot_R_NPEs].NPE_Kind := NPE_Kind;
                R_NPE[Tot_R_NPEs].PreInpNPEs := PreInpNPEs;

                for pi := 1 to PreInpNPEs do
                   begin
                     R_NPE[Tot_R_NPEs].
                          PreInput[pi].
                          PreInp_Num := PreInput[pi].PreInp_Num;

                     R_NPE[Tot_R_NPEs].
                          PreInput[pi].
                          Weight := PreInput[pi].Weight;
                   end;

                R_NPE[Tot_R_NPEs].LogisSigma := LogisSigma;
                R_NPE[Tot_R_NPEs].Tau := Tau;
                R_NPE[Tot_R_NPEs].Kappa := Kappa;
                R_NPE[Tot_R_NPEs].Alpha := Alpha;
                R_NPE[Tot_R_NPEs].Beta := Beta;
              end;

           6: begin
                Tot_CR_UR_NPEs := Tot_CR_UR_NPEs + 1;
                CR_UR_NPE[Tot_CR_UR_NPEs].NPE_Num := NPE_Num;
                CR_UR_NPE[Tot_CR_UR_NPEs].Net_Kind := Net_Kind;
                CR_UR_NPE[Tot_CR_UR_NPEs].NPE_Kind := NPE_Kind;
                CR_UR_NPE[Tot_CR_UR_NPEs].PreInpNPEs := PreInpNPEs;

                for pi := 1 to PreInpNPEs do
                  begin
                    CR_UR_NPE[Tot_CR_UR_NPEs].
                                 PreInput[pi].
                                 PreInp_Num := PreInput[pi].PreInp_Num;

                    CR_UR_NPE[Tot_CR_UR_NPEs].
                                 PreInput[pi].
                                 Weight := PreInput[pi].Weight;
                  end;

                CR_UR_NPE[Tot_CR_UR_NPEs].LogisSigma := LogisSigma;
                CR_UR_NPE[Tot_CR_UR_NPEs].Tau := Tau;
                CR_UR_NPE[Tot_CR_UR_NPEs].Kappa := Kappa;
                CR_UR_NPE[Tot_CR_UR_NPEs].Alpha := Alpha;
                CR_UR_NPE[Tot_CR_UR_NPEs].Beta := Beta;
              end;

           7: begin
                Tot_CR_UR2_NPEs := Tot_CR_UR2_NPEs + 1;
                CR_UR2_NPE[Tot_CR_UR2_NPEs].NPE_Num := NPE_Num;
                CR_UR2_NPE[Tot_CR_UR2_NPEs].Net_Kind := Net_Kind;
                CR_UR2_NPE[Tot_CR_UR2_NPEs].NPE_Kind := NPE_Kind;
                CR_UR2_NPE[Tot_CR_UR2_NPEs].PreInpNPEs := PreInpNPEs;

                for pi := 1 to PreInpNPEs do
                  begin
                    CR_UR2_NPE[Tot_CR_UR2_NPEs].
                                 PreInput[pi].
                                 PreInp_Num := PreInput[pi].PreInp_Num;

                    CR_UR2_NPE[Tot_CR_UR2_NPEs].
                                 PreInput[pi].
                                 Weight := PreInput[pi].Weight;
                  end;

                CR_UR2_NPE[Tot_CR_UR2_NPEs].LogisSigma := LogisSigma;
                CR_UR2_NPE[Tot_CR_UR2_NPEs].Tau := Tau;
                CR_UR2_NPE[Tot_CR_UR2_NPEs].Kappa := Kappa;
                CR_UR2_NPE[Tot_CR_UR2_NPEs].Alpha := Alpha;
                CR_UR2_NPE[Tot_CR_UR2_NPEs].Beta := Beta;
              end;

           8: begin
                Tot_vta2_NPEs := Tot_vta2_NPEs + 1;
                vta2_NPE[Tot_vta2_NPEs].NPE_Num := NPE_Num;
                vta2_NPE[Tot_vta2_NPEs].Net_Kind := Net_Kind;
                vta2_NPE[Tot_vta2_NPEs].NPE_Kind := NPE_Kind;
                vta2_NPE[Tot_vta2_NPEs].PreInpNPEs := PreInpNPEs;

                for pi := 1 to PreInpNPEs do
                  begin
                    vta2_NPE[Tot_vta2_NPEs].
                             PreInput[pi].
                             PreInp_Num := PreInput[pi].PreInp_Num;

                    vta2_NPE[Tot_vta2_NPEs].
                             PreInput[pi].
                             Weight := PreInput[pi].Weight;
                  end;

                vta2_NPE[Tot_vta2_NPEs].LogisSigma := LogisSigma;
                vta2_NPE[Tot_vta2_NPEs].Tau := Tau;
                vta2_NPE[Tot_vta2_NPEs].Kappa := Kappa;
                vta2_NPE[Tot_vta2_NPEs].Alpha := Alpha;
                vta2_NPE[Tot_vta2_NPEs].Beta := Beta;
              end;
        end{case};
     end;

   CloseFile(Nf1);
End;


Procedure TForm4b.OpenSchFile(Sender: TObject);    { in }
Var
   filename : String;
   Action: TCloseAction;
Begin
  fileName := Sch_FileName[st];
  AssignFile(Sf,fileName);

 {$I-}
  Reset(Sf);
 {$I+}

  If IOResult = 0 then
    ReadSchFile(Sender)
  else
    begin
      MessageDlg('"' + Sch_FileName[st] +
                 '" does not exist.', mtError, [mbCancel],0);

      CloseFile(Sf);
      ExperimentDone := True;
      FormClose(sender,action);
      Form0.Run1.Enabled := True;
    end;
End;


procedure TForm4b.ReadSchFile(Sender: TObject);
var
   ctt, ot, d, i, code : integer;
   txt1, txt2, str1 : String;
begin
   TotOverallTrials := 0;

  {$I-}
   Readln(Sf, Tot_Trial_Types);
  {$I+}

   if (IOResult <> 0) or (tot_trial_types < 1) then
     begin
       MessageDlg('Invalid number of input vector types.',mtError,[mbCancel],0);
       CloseFile(Sf);
       Exit;
     end;

   if (tot_trial_types > max_trial_types) then
     begin
       MessageDlg('Too many input vector types.',mtError,[mbCancel],0);
       CloseFile(Sf);
       Exit;
     end;

  {$I-}
   Readln(Sf, Tot_Sch_Inputs);
  {$I+}

   if (IOResult <> 0) or (tot_sch_inputs < 1) then
     begin
       MessageDlg('Invalid number of S units (must be equal to the number of S units in network)',
                   mtError,[mbCancel],0);

       CloseFile(Sf);
       Exit;
     end;

   if (tot_sch_inputs > max_inputs) then
     begin
       MessageDlg('Too many S units.',mtError,[mbCancel],0);
       CloseFile(Sf);
       Exit;
     end;

  {$I-}
   Readln(Sf, ResetActs);
  {$I+}

   if (IOResult <> 0) or (ResetActs < 0) or (ResetActs > 1) then
     begin
       MessageDlg('Invalid reset-activations option.',
                   mtError,[mbCancel],0);

       CloseFile(Sf);
       Exit;
     end;

   For ctt := 1 to Tot_Trial_Types do
     with Trial_Type[ctt] do
       begin
         str(ctt,txt1);

        {$I-}
         Readln(Sf, tt_Num);
        {$I+}

         if (IOResult <> 0) or (tt_num < 1) then
           begin
             str1 := 'Invalid S-unit number for input vector type ' + txt1 + '.';
                     MessageDlg(str1,mtError,[mbCancel],0);
             CloseFile(Sf);
             Exit;
           end;

        {$I-}
         Readln(Sf, Tot_Trials);
        {$I+}

         if (IOResult <> 0) or (Tot_Trials < 0) then
           begin
             str1 := 'Invalid number of trials for input vector type ' +
                     txt1 + '.';

             MessageDlg(str1,mtError,[mbCancel],0);
             CloseFile(Sf);
             Exit;
           end;

         TotOverallTrials := TotOverallTrials + Tot_Trials;

         if Tot_Trials > Max_Tot_Trials then
           begin
             str1 := 'Too many trials for input vector type ' + txt1 + '.';
             MessageDlg(str1,mtError,[mbCancel],0);
             CloseFile(Sf);
             Exit;
           end;

        {$I-}
         Readln(Sf, Color);
        {$I+}

         if (IOResult <> 0) or (color < 1) then
           begin
             str1 := 'Invalid color number for input vector type ' + txt1 + '.';
             MessageDlg(str1,mtError,[mbCancel],0);
             CloseFile(Sf);
             Exit;
           end;

         Readln(Sf, Lab);

        {$I-}
         Readln(Sf, Duration);
        {$I+}

         if (IOResult <> 0) or (Duration < 1) then
           begin
             str1 := 'Invalid duration for input vector type ' + txt1 + '.';
             MessageDlg(str1,mtError,[mbCancel],0);
             CloseFile(Sf);
             Exit;
           end;

         if Duration > Max_Duration then
           begin
             str1 := 'Too many moments for input vector type ' + txt1 + '.';
             MessageDlg(str1,mtError,[mbCancel],0);
             CloseFile(Sf);
             Exit;
           end;

        {$I-}
         Readln(Sf, Mode);
        {$I+}

         if (IOResult <> 0) or (mode < 0) or (mode > 1) then
           begin
             str1 := 'Invalid weight-change mode for input vector type ' + txt1 + '.';
             MessageDlg(str1,mtError,[mbCancel],0);
             CloseFile(Sf);
             Exit;
           end;

        {$I-}
         Readln(Sf, Cue);
        {$I+}

         if (IOResult <> 0) or (cue < 0) or (cue > 1) then
           begin
             str1 := 'Invalid cue type for trial type ' + txt1 + '.';
             MessageDlg(str1,mtError,[mbCancel],0);
             CloseFile(Sf);
             Exit;
           end;

         cur_ts := 1;

         for d := 1 to Duration do
           with ts[d] do
             begin
               cur_input := 1;

               for i := 1 to Tot_sch_Inputs do
                 begin
                  {$I-}
                   readln(Sf,RDependent[i]);
                  {$I+}

                   if (IOResult <> 0) or
                      (RDependent[i] < 0) or
                      (RDependent[i] > 1) then
                     begin
                       str1 := 'Invalid R-dependency parameter '
                               + txt2 + ' in trial type ' + txt1 + '.';

                       MessageDlg(str1,mtError,[mbCancel],0);
                       CloseFile(Sf);
                       Exit;
                     end;

                  {$I-}
                   readln(Sf,InpActMode[i]);
                  {$I+}

                   str(i,txt2);

                   if (IOResult <> 0) or
                      (InpActMode[i] < 0) or
                      (InpActMode[i] > 1) then
                      begin
                        str1 := 'Invalid activation mode for S unit '
                                + txt2 + ' in input vector type ' + txt1 + '.';

                        MessageDlg(str1,mtError,[mbCancel],0);
                        CloseFile(Sf);
                        Exit;
                      end;

                   case InpActMode[i] of
                     0: begin
                          Readln(Sf, const_Inp_Act_Str[i]);
                          val(const_Inp_Act_Str[i],const_Inp_Act[i],code);

                          if (code <> 0) or
                             (const_Inp_Act[i] < 0) or
                             (const_Inp_Act[i] > 1) then
                             begin
                               str1 := 'Invalid constant activation for S unit '
                                       + txt2 + ' in input vector type ' + txt1 + '.';
                               MessageDlg(str1,mtError,[mbCancel],0);
                               CloseFile(Sf);
                               Exit;
                             end;

                          Min_Rand_Inp_Act[i] := 0;
                          Max_Rand_Inp_Act[i] := 1;
                          Min_Rand_Inp_Act_str[i] := '0';
                          Max_Rand_Inp_Act_str[i] := '1';
                        end;

                     1: begin
                          const_inp_act[i] := 0;
                          const_inp_act_str[i] := '0';
                          Readln(Sf, min_rand_Inp_Act_Str[i]);
                          Readln(Sf, max_rand_Inp_Act_Str[i]);

                          val(min_rand_Inp_Act_Str[i],
                          min_rand_Inp_Act[i],code);

                            if (code <> 0) or
                               (min_rand_Inp_Act[i] < 0) or
                               (min_rand_Inp_Act[i] > 1) then
                                begin
                                  str1 := 'Invalid minimum random activation for S unit '
                                  + txt2 + ' in input vector type ' + txt1 + '.';
                                  MessageDlg(str1,mtError,[mbCancel],0);
                                  CloseFile(Sf);
                                  Exit;
                                end;

                            val(max_rand_Inp_Act_Str[i],
                                max_rand_Inp_Act[i],code);

                            if (code <> 0) or
                               (max_rand_Inp_Act[i] < 0) or
                               (max_rand_Inp_Act[i] > 1) then
                                begin
                                  str1 := 'Invalid maximum random activation for S unit '
                                  + txt2 + ' in input vector type ' + txt1 + '.';
                                  MessageDlg(str1,mtError,[mbCancel],0);
                                  CloseFile(Sf);
                                  Exit;
                                end;
                          end;
                     end{case};
                   end;

                {$I-}
                 readln(Sf,USActMode);
                {$I+}

                 if (IOResult <> 0) or (mode < 0) or (mode > 1) then
                   begin
                     str1 := 'Invalid S* activation mode for input vector type '
                             + txt1 + '.';

                     MessageDlg(str1,mtError,[mbCancel],0);
                     CloseFile(Sf);
                     Exit;
                   end;

                 case USActMode of
                   0: begin
                        Readln(Sf, const_US_Act_Str);
                        val(const_US_Act_Str,const_US_Act,code);

                        if (code <> 0) or
                           (const_US_Act < 0) or
                           (const_US_Act > 1) then
                            begin
                              str1 := 'Invalid constant S*1 activation for input vector type '
                                      + txt1 + '.';
                              MessageDlg(str1,mtError,[mbCancel],0);
                              CloseFile(Sf);
                              Exit;
                            end;

                        min_rand_US_Act := 0;
                        max_rand_US_Act := 1;
                        min_rand_US_Act_str := '0';
                        max_rand_US_Act_str := '1';
                      end;

                   1: begin
                        const_US_Act := 0;
                        const_US_Act_str := '0';
                        Readln(Sf, min_rand_US_Act_Str);
                        Readln(Sf, max_rand_US_Act_Str);
                        val(min_rand_US_Act_Str,min_rand_US_Act,code);

                        if (code <> 0) or
                           (min_rand_US_Act < 0) or
                           (min_rand_US_Act > 1) then
                            begin
                              str1 := 'Invalid minimum random S*1 activation for input vector type '
                                      + txt1 + '.';
                              MessageDlg(str1,mtError,[mbCancel],0);
                              CloseFile(Sf);
                              Exit;
                            end;

                        val(max_rand_US_Act_Str,max_rand_US_Act,code);

                        if (code <> 0) or
                           (max_rand_US_Act < 0) or
                           (max_rand_US_Act > 1) then
                            begin
                              str1 := 'Invalid maximum random S*1 activation for input vector type '
                                      + txt1 + '.';
                              MessageDlg(str1,mtError,[mbCancel],0);
                              CloseFile(Sf);
                              Exit;
                            end;
                      end;

                   2: begin
                        Readln(Sf, const_US2_Act_Str);
                        val(const_US2_Act_Str,const_US2_Act,code);

                        if (code <> 0) or
                           (const_US2_Act < 0) or
                           (const_US2_Act > 1) then
                            begin
                              str1 := 'Invalid constant S*2 activation for input vector type '
                                      + txt1 + '.';
                              MessageDlg(str1,mtError,[mbCancel],0);
                              CloseFile(Sf);
                              Exit;
                            end;

                        min_rand_US2_Act := 0;
                        max_rand_US2_Act := 1;
                        min_rand_US2_Act_str := '0';
                        max_rand_US2_Act_str := '1';
                      end;

                   3: begin
                        const_US2_Act := 0;
                        const_US2_Act_str := '0';
                        Readln(Sf, min_rand_US2_Act_Str);
                        Readln(Sf, max_rand_US2_Act_Str);
                        val(min_rand_US2_Act_Str,min_rand_US2_Act,code);

                        if (code <> 0) or
                           (min_rand_US2_Act < 0) or
                           (min_rand_US2_Act > 1) then
                            begin
                              str1 := 'Invalid minimum random S*2 activation for input vector type '
                                      + txt1 + '.';
                              MessageDlg(str1,mtError,[mbCancel],0);
                              CloseFile(Sf);
                              Exit;
                            end;

                        val(max_rand_US2_Act_Str,max_rand_US2_Act,code);

                        if (code <> 0) or
                           (max_rand_US2_Act < 0) or
                           (max_rand_US2_Act > 1) then
                            begin
                              str1 := 'Invalid maximum random S*2 activation for input vector type '
                                      + txt1 + '.';
                              MessageDlg(str1,mtError,[mbCancel],0);
                              CloseFile(Sf);
                              Exit;
                            end;
                      end;
                 end{case};

                {$I-}
                 Readln(Sf, Contingency);
                {$I+}

                if (IOResult <> 0) or
                   (Contingency < 0) or
                   (Contingency > 2) then
                    begin
                      str1 := 'Invalid reinforcement mode for input vector type '
                      + txt1 + '.';

                      MessageDlg(str1,mtError,[mbCancel],0);
                      CloseFile(Sf);
                      Exit;
                    end;

                {SI-}
                 Readln(Sf, Tot_Op_Targets);
                {$I+}

                 if (IOResult <> 0) or (Tot_Op_Targets < 0) then
                   begin
                     str1 := 'Invalid number of R target units for input vector type '
                     + txt1 + '.';

                     MessageDlg(str1,mtError,[mbCancel],0);
                     CloseFile(Sf);
                     Exit;
                   end;

                 if Tot_Op_Targets > Max_Op_Targets then
                   begin
                     str1 := 'Too many R target units for input vector type '
                             + txt1 + '.';

                     MessageDlg(str1,mtError,[mbCancel],0);
                     CloseFile(Sf);
                     Exit;
                   end;

                 cur_op_target := 1;

                 for ot := 1 to Tot_Op_Targets do
                   with Op_Target[ot] do
                     begin
                       str(ot,txt2);

                      {$I-}
                       Readln(Sf, op_npe);
                      {$I+}

                       if (IOResult <> 0) or (op_npe < 0) then
                         begin
                           str1 := 'Invalid unit number for R target ' +
                                   txt2 + ' in input vector type ' + txt1 + '.';

                           MessageDlg(str1,mtError,[mbCancel],0);
                           CloseFile(Sf);
                           Exit;
                         end;

                       Readln(Sf, Min_Op_Act_Str);
                       Readln(Sf, Max_Op_Act_Str);

                       val(Min_Op_Act_Str,Min_Op_Act,code);

                       if (code <> 0) or
                          (min_Op_Act < 0) or
                          (min_Op_Act > 1) then
                           begin
                             str1 := 'Invalid minimum activation for R target ' +
                                      txt2 + ' in input vector type ' + txt1 + '.';

                             MessageDlg(str1,mtError,[mbCancel],0);
                             CloseFile(Sf);
                             Exit;
                           end;

                       val(Max_Op_Act_Str,Max_Op_Act,code);

                       if (code <> 0) or
                          (min_Op_Act < 0) or
                          (min_Op_Act > 1) then
                           begin
                             str1 := 'Invalid maximum activation for R target ' +
                                      txt2 + ' in input vector type ' + txt1 + '.';

                             MessageDlg(str1,mtError,[mbCancel],0);
                             CloseFile(Sf);
                             Exit;
                           end;
                     end;
               end;
         end;

   CloseFile(Sf);
end;


Procedure TForm4b.OpenDataFiles (Sender: TObject);  { out }
Var
   txt1, txt2, txt4,
   Net_FileNameStr, dirname : String;

   Net_FileNameChar : ShortString;

   h, j : Integer;
Procedure odf;
Var
   n, obsnpe, ctt : Integer;
   ActPath, WgtPath, RPath, cr_npe_str, r_npe_str : String;
   crnpe, rnpe, pre_inp : Integer;
   net_type_str, npe_type_str,
   pi_str_1, pi_str_2, pi_str_3, pi_str_4 : String;
begin
   for ctt := 1 to Tot_Trial_Types do
      begin
         if not(DirectoryExists(DataMainDir +
                               '\' + Mess[st] +
                               '\' + Net_FileNameStr +
                               '-' + txt2 +
                               '\' + Trial_Type[ctt].Lab)) then
           MkDir(DataMainDir +
                '\' + Mess[st] +
                Net_FileNameStr +
                '-' + txt2 +
                '\' + Trial_Type[ctt].Lab);

         if StoreActsOnSimType[st] then
           begin
              ActPath := DataMainDir +
                        '\' + Mess[st] +
                        Net_FileNameStr +
                        '-' + txt2 +
                        '\' + Trial_Type[ctt].Lab +
                        '\Acts';

              if not(DirectoryExists(ActPath)) then
                 MkDir(ActPath);
           end;

         if StoreWgtsOnSimType[st] then
           begin
              WgtPath := DataMainDir +
                        '\' + Mess[st] +
                        Net_FileNameStr +
                        '-' + txt2 +
                        '\' + Trial_Type[ctt].Lab +
                        '\Wgts';

              if not(DirectoryExists(WgtPath)) then
                 MkDir(WgtPath);
           end;

       { Working on a new data filename code: 9-21-99 }
         if Tot_Obs_NPEs[st] > 0 then
           For obsnpe := 1 to Tot_Obs_NPEs[st] do
              begin
                 Str(Obs_NPE[st,obsnpe],txt4);  {observed NPE}

                 Case NPE[Obs_NPE[st,obsnpe]].Net_Kind of
                     1 : net_type_str := 'sen';
                     2 : net_type_str := 'mot';
                 end{case};

                 Case NPE[Obs_NPE[st,obsnpe]].NPE_Kind of
                    -1 : npe_type_str := 'i';
                     0 : npe_type_str := 'e';
                     1 : npe_type_str := 's';
                     3 : npe_type_str := 'H';
                     4 : npe_type_str := 'D';
                     5 : npe_type_str := 'r';
                     6 : npe_type_str := 'cr';
                 end{case};

                 if StoreActsOnSimType[st] then
                   begin
                     Acts_FileName[ctt,obsnpe] := ActPath + '\' +
                                                  txt4 + '(' +
                                                  net_type_str + ',' +
                                                  npe_type_str + ')';

                     AssignFile(Af[ctt,obsnpe],Acts_FileName[ctt,obsnpe]);
                     ReWrite(Af[ctt,obsnpe]);
                   end;

                 if StoreWgtsOnSimType[st] then
                   begin
                     if not(DirectoryExists(WgtPath + '\' +
                                            txt4 + '(' +
                                            net_type_str + ',' +
                                            npe_type_str + ')')) then
                       MkDir(WgtPath + '\' + txt4 + '(' +
                             net_type_str + ',' + npe_type_str + ')');

                      For pre_inp:=1 to NPE[Obs_NPE[st,obsnpe]].PreInpNPEs do
                        begin
                          Str(pre_inp,pi_str_1);

                          Str(NPE[Obs_NPE[st,obsnpe]].
                              PreInput[pre_inp].PreInp_Num,pi_str_2);

                          Case NPE[NPE[Obs_NPE[st,obsnpe]].
                                   PreInput[pre_inp].PreInp_Num].Net_Kind of
                              1 : pi_str_3 := 'sen';
                              2 : pi_str_3 := 'mot';
                          end{case};

                          Case NPE[NPE[Obs_NPE[st,obsnpe]].
                                   PreInput[pre_inp].PreInp_Num].NPE_Kind of
                             -1 : pi_str_4 := 'i';
                              0 : pi_str_4 := 'e';
                              1 : pi_str_4 := 's';
                              3 : pi_str_4 := 'H';
                              4 : pi_str_4 := 'D';
                              5 : pi_str_4 := 'r';
                              6 : pi_str_4 := 'cr';
                          end{case};

                          if not(DirectoryExists(WgtPath + '\' +
                                                 txt4 + '(' +
                                                 net_type_str + ',' +
                                                 npe_type_str + ')')) then
                            MkDir(WgtPath + '\' + txt4 + '(' +
                                  net_type_str + ',' + npe_type_str + ')');

                          Wgts_FileName[ctt,
                                        obsnpe,
                                        pre_inp] := WgtPath +
                                                   '\' + txt4 + '(' +
                                                    net_type_str + ',' +
                                                    npe_type_str + ')' +
                                                   '\Pre' +
                                                    pi_str_1 +
                                                   '(' + pi_str_2 +
                                                   ',' + pi_str_3 +
                                                   ',' + pi_str_4 + ')';

                          AssignFile(Wf[ctt,obsnpe,pre_inp],
                                     Wgts_FileName[ctt,obsnpe,pre_inp]);

                          ReWrite(Wf[ctt,obsnpe,pre_inp]);
                        end;
                   end;
              end;

         if (R_Crit[st]) or (CR_Crit[st]) then
           begin
              RPath := DataMainDir +
                      '\' + Mess[st] +
                      Net_FileNameStr +
                      '-' + txt2 +
                      '\' + Trial_Type[ctt].Lab +
                      '\Rs';

              if not(DirectoryExists(RPath)) then
                MkDir(RPath);

              If CR_Crit[st] then
                begin
                   if not(DirectoryExists(RPath + '\cr')) then
                     MkDir(RPath + '\cr');

                   for crnpe := 1 to Tot_CR_UR_NPEs do
                      begin
                         str(CR_UR_NPE[crnpe].NPE_Num,cr_npe_str);

                         CR_FileName[ctt,crnpe] := RPath + '\cr\' +
                                                   cr_npe_str;

                         AssignFile(CRf[ctt,crnpe],
                                    CR_FileName[ctt,crnpe]);

                         ReWrite(CRf[ctt,crnpe]);
                      end;
                end;

              If R_Crit[st] then
                begin
                   if not(DirectoryExists(RPath + '\r')) then
                     MkDir(RPath + '\r');

                   for rnpe := 1 to Tot_R_NPEs do
                      begin
                         str(R_NPE[rnpe].NPE_Num,r_npe_str);

                         R_FileName[ctt,rnpe] := RPath + '\r\' +
                                                 r_npe_str;

                         AssignFile(Rf[ctt,rnpe],
                                    R_FileName[ctt,rnpe]);

                         ReWrite(Rf[ctt,rnpe]);
                      end;
                end;
           end;
      end;
end;

Begin
   Str(st,txt1);
   Str(sim,txt2);

   h := 0;
   j := Length(Net_FileName[st]);

   repeat
     h := h + 1;
     Net_FileNameChar := Copy(Net_FileName[st],j,1);
     Net_FileNameStr := Copy(Net_FileName[st],j,h);
     j := j - 1;
   until (j = 0) or
         (Net_FileNameChar = '\') or (h > Length(Net_FileName[st]));

   Net_FileNameStr := copy(Net_FileNameStr,1,length(Net_FileNameStr)-4);

   if not(DirectoryExists(DataMainDir +
                         '\' + Mess[st] +
                         Net_FileNameStr +
                         '-' + txt2)) then
      begin
        dirname := DataMainDir +
                   '\' + Mess[st] + Net_FileNameStr +
                  '-' + txt2;

        MkDir(dirname);
      end;
   odf;
End;


Procedure Reset_Weights;
Var
   p_i: Byte;
   rnd : Extended;
   Cur_NPE : Integer;
Begin
  For Cur_NPE := Tot_Net_Inputs + 1 to Tot_Elements do
    with NPE[Cur_NPE] do
      for p_i:=1 to PreInpNPEs do
        with PreInput[p_i] do
          case Rst_Wgts[st] of
             1: Weight := Const_Init_Wgts[st];
            -1: begin
                   repeat
                      case Rand of
                         rand1: rnd := Random;
                         rand2: rnd := RandNum(Random(5000) * -1);
                      end{case};
                   until (rnd >= Min_Rand_Init_Wgts[st]) and
                         (rnd <= Max_Rand_Init_Wgts[st]);

                   Weight := rnd;
                end;
          end{case};
End;


Procedure Write_Initial_State;
var
   cnpe, pi, h, j : integer;
   Net_FileNameStr : String;
   Net_FileNameChar : ShortString;
Begin
     h := 0;
     j := Length(Net_FileName[st]);

     repeat
       h := h + 1;
       Net_FileNameChar := Copy(Net_FileName[st],j,1);
       Net_FileNameStr := Copy(Net_FileName[st],j,h);
       j := j - 1;
     until (j = 0) or
           (Net_FileNameChar = '\') or (h > Length(Net_FileName[st]));

     Net_FileName_I[st] := DataMainDir + '\' +
                           Net_FileNameStr +
                           ' (init).ntw';

     Assign(Nf1,Net_FileName_I[st]);
     Rewrite(Nf1);

     Writeln(Nf1, Tot_Net_Inputs);
     Writeln(Nf1, Tot_NPEs);

     For cnpe := Tot_Net_Inputs + 1 to Tot_Elements do
         with NPE[cnpe] do
              begin
                   Writeln(Nf1, cnpe);
                   Writeln(Nf1, Net_Kind);
                   Writeln(Nf1, NPE_Kind);
                   Writeln(Nf1, SigmaStr);
                   Writeln(Nf1, TauStr);
                   Writeln(Nf1, KappaStr);
                   Writeln(Nf1, AlphaStr);
                   Writeln(Nf1, BetaStr);
                   Writeln(Nf1, PreInpNPEs); PreInpWgts := PreInpNPEs;

              { the number of presynaptic elements has priority ! }
                   for pi := 1 to PreInpNPEs do
                       begin
                            Writeln(Nf1, PreInput[pi].NumStr);
                            Writeln(Nf1, PreInput[pi].WgtStr);
                       end;
              end;

     CloseFile(Nf1);
End;


Procedure Create_Input_Vector;
Var
   i : Byte;
   rnd : Extended;
Begin
  For i:=1 to Tot_Sch_Inputs do
     with Trial_Type[Inp_Patt] do
       with ts[t] do
          begin
            if RDependent[i] = 0 then
               case InpActMode[i] of
                   0: Cur_Inp_Act[i] := Const_Inp_Act[i];
                   1: begin
                        repeat
                           case rand of
                               rand1: rnd := Random;
                               rand2: rnd := RandNum(Random(5000) * -1);
                           end{case};
                        until (rnd >= Min_Rand_Inp_Act[i]) and
                              (rnd < Max_Rand_Inp_Act[i]);

                        cur_inp_act[i] := rnd;
                      end;
                end{case}
            else
      { R SENSORY FEEDBACK: 01/21/05. FOR THE MOMENT, IF NO R, NO FEEDBACK...}
               case InpActMode[i] of
                   0: if R_Criterion then
                        Cur_Inp_Act[i] := Const_Inp_Act[i]
                      else
                         Cur_Inp_Act[i] := 0;
                   1: if R_Criterion then
                        begin
                           repeat
                              case rand of
                                  rand1: rnd := Random;
                                  rand2: rnd := RandNum(Random(5000) * -1);
                              end{case};
                           until (rnd >= Min_Rand_Inp_Act[i]) and
                              (rnd < Max_Rand_Inp_Act[i]);

                           cur_inp_act[i] := rnd;
                        end else
                           cur_inp_act[i] := 0;
                end{case};

            NPE[i].Act_t := cur_inp_act[i];
          end;
End;


Procedure Init_Acts;
Var
   cnpe: Integer;
Begin
     for cnpe := Tot_Net_Inputs + 1 to Tot_Elements do
         With NPE[cnpe] do
              if PreInpNPEs > 0 then
              begin
                   p_epsp_t := Logistic(0,cnpe);
                   Act_t := p_epsp_t;
              end else
                  begin
                       p_epsp_t := 0;
                       Act_t := 0;
                  end;
End;


Procedure Reset_acts;
Var
   cnpe: Integer;
Begin
  for cnpe := Tot_Net_Inputs + 1 to Tot_Elements do
     With NPE[cnpe] do
           begin
                p_epsp_t := Logistic(0,cnpe);
                Act_t := p_epsp_t;
           end;
End;


Procedure Compute_ca1_Discrepancies;
Var
   cnpe : Byte;
begin
  Tot_ca1_d_t := 0;

  For cnpe := 1 to Tot_ca1_NPEs do
    with ca1_NPE[cnpe] do
       Tot_CA1_d_t := Tot_CA1_d_t + Abs(Act_t-Act_t_1);

  Avg_CA1_d_t := Avg_CA1_d; { CA1 diffuse signal: just the substraction!}

  ca1_d[TimeSteps] := Avg_CA1_d;
end;


Procedure Compute_vta_Discrepancies;
Var
   cnpe : Byte;
begin
  Tot_vta_d_t := 0;
  Tot_vta2_d_t := 0;

  For cnpe := 1 to Tot_vta_NPEs do
    with vta_NPE[cnpe] do
      Tot_VTA_d_t := Tot_VTA_d_t + (Act_t-Act_t_1);

  Avg_VTA_d_t := Avg_VTA_d; { VTA1 diffuse signal }
  vta_d[TimeSteps] := Avg_VTA_d;

  For cnpe := 1 to Tot_vta2_NPEs do
    with vta2_NPE[cnpe] do
      Tot_VTA2_d_t := Tot_VTA2_d_t + (Act_t-Act_t_1);

  Avg_VTA2_d_t := Avg_VTA2_d; { VTA2 diffuse signal }
  vta2_d[TimeSteps] := Avg_VTA2_d;

  if (Avg_VTA_d_t >= d_thr) and (ovrl_tr <= 50) then
        lri := lri + 1;
end;


Procedure Amplify_CA1_d;
Begin
     Avg_CA1_d_t := Avg_CA1_d_t + Avg_VTA_d_t*(1-Avg_CA1_d_t);
End;


{ Weight-gain mode }
Procedure Str_Wgts (d: Extended; Cur_NPE: Integer);
Var
   S_aw, Tot_Wgt, N_t, pi_t, dWij_t: Extended;
   rnd, b: Byte;
   Bit : Array[1..Max_Pre_Inps] of Boolean;

Function All_PreInputs_Sampled : Boolean;
Var
   apis : Boolean;
   pi : Byte;
Begin
   apis := True;

   For pi:=1 to NPE[Cur_NPE].PreInpNPEs do
       apis := (apis) and (Bit[pi]);

   All_PreInputs_Sampled := apis;
End;

Begin
   dwij_t := 0;

 { Initializes bit array }
   For b:=1 to NPE[Cur_NPE].PreInpNPEs do
      Bit[b]:=False;

 { Excitatory weights }
     begin
        S_aw := Sum_Exc_ActWgt(Cur_NPE);

        If S_aw > 0 then
          begin
             Tot_Wgt := Sum_Exc_Wgts(Cur_NPE);
             N_t := Nr - Tot_Wgt;  {maximum competition: 03-08-04}

             Repeat
              { Randomly samples, w/o replacement, a presynaptic input }
                repeat
                   rnd := Random(NPE[Cur_NPE].PreInpNPEs) + 1;
                until not Bit[rnd];

                Bit[rnd]:=True;

                if NPE[NPE[Cur_NPE].
                   PreInput[rnd].PreInp_Num].NPE_Kind <> -1 then
                begin
                  pi_t := (NPE[NPE[Cur_NPE].
                           PreInput[rnd].PreInp_Num].Act_t *
                           NPE[Cur_NPE].PreInput[rnd].Weight) / s_aw;

                  dWij_t := NPE[Cur_NPE].Alpha *
                            NPE[Cur_NPE].Act_t *
                            d *
                            pi_t *
                            N_t;

                  NPE[Cur_NPE].PreInput[rnd].Weight:=
                  NPE[Cur_NPE].PreInput[rnd].Weight + dWij_t;
                end;
             until All_PreInputs_Sampled;
          end;
     end;

     dwij_t := 0;

   { Initializes bit array }
     For b:=1 to NPE[Cur_NPE].PreInpNPEs do
        Bit[b]:=False;

   { Inhibitory weights }
       begin
          S_aw := Sum_Inh_ActWgt(Cur_NPE);

          If S_aw>0 then
            begin
               Tot_Wgt := Sum_Inh_Wgts(Cur_NPE);
               N_t := Nr - Tot_Wgt;

               Repeat
                { Randomly samples w/o replacement a presynaptic input }
                  repeat
                     rnd := Random(NPE[Cur_NPE].PreInpNPEs) + 1;
                  until not Bit[rnd];

                Bit[rnd] := True;

                if NPE[NPE[Cur_NPE].
                   PreInput[rnd].PreInp_Num].NPE_Kind = -1 then
                begin
                  pi_t := (NPE[NPE[Cur_NPE].
                           PreInput[rnd].PreInp_Num].Act_t *
                           NPE[Cur_NPE].PreInput[rnd].Weight) / s_aw;

                  dWij_t := NPE[Cur_NPE].Alpha *
                            NPE[Cur_NPE].Act_t *
                            d * { inhibitory weights too depend on d (03/28/08)}
                            pi_t *
                            N_t;

                  NPE[Cur_NPE].PreInput[rnd].Weight:=
                  NPE[Cur_NPE].PreInput[rnd].Weight + dWij_t;
                end;
               Until All_PreInputs_Sampled;
            end;
       end;
End;


{ Decrement mode }
Procedure Weak_Wgts (Cur_NPE : Integer);
Var
   rnd, b: Byte;
   dWij_t: Extended;
   Bit : Array[1..Max_Pre_Inps] of Boolean;

Function All_PreInputs_Sampled : Boolean;
Var
   apis : Boolean;
   pi : Byte;
Begin
   apis := True;

   For pi:=1 to NPE[Cur_NPE].PreInpNPEs do
       apis := (apis) and (Bit[pi]);

   All_PreInputs_Sampled := apis;
End;

Begin
 { Initializes bit array }
   For b:=1 to NPE[Cur_NPE].PreInpNPEs do
       Bit[b]:=False;

   If NPE[Cur_NPE].PreInpNPEs > 0 then
     Repeat
      { Randomly samples a previously not sampled presynaptic input }
        repeat
           rnd := Random(NPE[Cur_NPE].PreInpNPEs) + 1;
        until not Bit[rnd];

        Bit[rnd]:=True;

      { Now inhbitory weights extinguish! They didn't use to... 03-28-08 }
        dWij_t := NPE[Cur_NPE].Beta *
                  NPE[NPE[Cur_NPE].PreInput[rnd].PreInp_Num].Act_t *
                  NPE[Cur_NPE].Act_t *
                  NPE[Cur_NPE].PreInput[rnd].Weight;

        NPE[Cur_NPE].
        PreInput[rnd].
        Weight := NPE[Cur_NPE].PreInput[rnd].Weight - dWij_t;
      Until All_PreInputs_Sampled;
End;


Procedure Update_Wgts1;
Var
   d: Extended;
Begin
   update_set :=[];

   Repeat
     repeat
       Cur_PostNPE := Random(Tot_Elements-Tot_Net_Inputs) +
                             Tot_Net_Inputs + 1;
     until not(Cur_PostNPE in Update_Set);

     d := 0;

     with NPE[Cur_PostNPE] do
       begin
         case Net_Kind of
             1: d := Avg_ca1_d_t;
             2: d := Avg_vta_d_t;
         end{case};

         If d >= d_thr then
            Str_Wgts(d,Cur_PostNPE) {increment weights}
         else
             Weak_Wgts(Cur_PostNPE); {decrement weights}
       end;

      Update_Set := Update_Set + [Cur_PostNPE];
   until Update_Set = NPE_Set;
End;


Procedure Update_Wgts2; {05/30/2013: One discrepancy signal: D amplified H signal}
Var
   d: Extended;
Begin
   update_set :=[];

   Repeat
     repeat
       Cur_PostNPE := Random(Tot_Elements-Tot_Net_Inputs) +
                             Tot_Net_Inputs + 1;
     until not(Cur_PostNPE in Update_Set);

     d := Avg_ca1_d_t;

     If d >= d_thr then
       Str_Wgts(d,Cur_PostNPE) {increment weights}
     else
         Weak_Wgts(Cur_PostNPE); {decrement weights}

     Update_Set := Update_Set + [Cur_PostNPE];
   until Update_Set = NPE_Set;
End;


procedure UpdateActivationsAsyncRnd;   {asynchronous random update}
var
  ca1_n, vta_n, r_n, cr_n : Integer;
begin
   Update_Set := [];
   ca1_n := 0;
   vta_n := 0;
   r_n := 0;
   cr_n := 0;
   Cur_PostNPE := 0;

   Repeat
      repeat
         Cur_PostNPE := Random(Tot_Elements-Tot_Net_Inputs) +
                               Tot_Net_inputs + 1;
      until not(Cur_PostNPE in Update_Set);     {random order}

      with NPE[Cur_PostNPE] do
        begin
          Act_t_1 := Act_t;

          with trial_type[inp_patt].ts[t] do
              case NPE_Kind of
                -1,0: Act_t := Activation(Cur_PostNPE);

                   3: begin
                        ca1_n := ca1_n + 1;
                        ca1_NPE[ca1_n].Act_t_1 := ca1_NPE[ca1_n].Act_t;

                        Act_t := Activation(Cur_PostNPE);
                        ca1_NPE[ca1_n].Act_t := Act_t;
                      end;

                   4: begin
                        vta_n := vta_n + 1;
                        vta_npe[vta_n].Act_t_1 := vta_npe[vta_n].Act_t;

                        If tsReinforced then
                          Act_t := Cur_US_Act
                        else
                           Act_t := Activation(Cur_PostNPE);

                        vta_npe[vta_n].Act_t := Act_t;
                      end;

                   5: with trial_type[inp_patt] do
                          begin
                            r_n := r_n + 1;
                            r_npe[r_n].Act_t := r_npe[r_n].Act_t_1;

                            Act_t := Activation(Cur_PostNPE);
                            r_npe[r_n].Act_t := Act_t;

                            if (R_exc = 0) and (act_t > 0) then
                              Spontaneous_R_Acts[r_n] :=
                              Spontaneous_R_Acts[r_n] + 1;
                          end;

                   6: begin
                        cr_n := cr_n + 1;
                        cr_ur_npe[cr_n].act_t_1 := cr_ur_npe[cr_n].act_t;

                        If tsReinforced then
                          Act_t := Cur_US_Act
                        else
                          Act_t := Activation(Cur_PostNPE);

                        cr_ur_npe[cr_n].Act_t := Act_t;
                      end;
              end{case};
        end;

      Update_Set := Update_Set + [Cur_PostNPE];
   until Update_Set = NPE_Set;
end;


procedure UpdateActivationsAsyncSeq; { asynchronous sequential update}
var
  ca1_n, vta_n, r_n, cr_n : Integer;
begin
   Update_Set := [];
   ca1_n := 0;
   vta_n := 0;
   r_n := 0;
   cr_n := 0;
   Cur_PostNPE := 0;

   For Cur_PostNPE := Tot_Net_Inputs + 1 to Tot_elements do
      with NPE[Cur_PostNPE] do
        begin
          Act_t_1 := Act_t;

          with trial_type[inp_patt].ts[t] do
              case NPE_Kind of
                -1,0: Act_t := Activation(Cur_PostNPE);

                   3: begin
                        ca1_n := ca1_n + 1;
                        ca1_NPE[ca1_n].Act_t_1 := ca1_NPE[ca1_n].Act_t;

                        Act_t := Activation(Cur_PostNPE);
                        ca1_NPE[ca1_n].Act_t := Act_t;
                      end;

                   4: begin
                        vta_n := vta_n + 1;
                        vta_npe[vta_n].Act_t_1 := vta_npe[vta_n].Act_t;

                        If tsReinforced then
                          Act_t := Cur_US_Act
                        else
                           Act_t := Activation(Cur_PostNPE);

                        vta_npe[vta_n].Act_t := Act_t;
                      end;

                   5: begin
                        r_n := r_n + 1;
                        r_npe[r_n].Act_t := r_npe[r_n].Act_t_1;

                        Act_t := Activation(Cur_PostNPE);
                        r_npe[r_n].Act_t := Act_t;

                        if (R_exc = 0) and (act_t > 0) then
                           Spontaneous_R_Acts[r_n] :=
                           Spontaneous_R_Acts[r_n] + 1;
                      end;

                   6: begin
                        cr_n := cr_n + 1;
                        cr_ur_npe[cr_n].act_t_1 := cr_ur_npe[cr_n].act_t;

                        If tsReinforced then
                          Act_t := Cur_US_Act
                        else
                          Act_t := Activation(Cur_PostNPE);

                        cr_ur_npe[cr_n].Act_t := Act_t;
                      end;
              end{case};
        end;
end;


procedure UpdateActivationsSyncRnd;   {synchronous random update}
var
  ca1_n, vta_n, r_n, cr_n : Integer;
  Act : Array[1..Max_elements] of Extended;
begin
   Update_Set := [];
   ca1_n := 0;
   vta_n := 0;
   r_n := 0;
   cr_n := 0;
   Cur_PostNPE := 0;

   Repeat
      repeat
         Cur_PostNPE := Random(Tot_Elements-Tot_Net_Inputs) +
                               Tot_Net_inputs + 1;
      until not(Cur_PostNPE in Update_Set);       {random order}

      with NPE[Cur_PostNPE] do
        begin
          Act_t_1 := Act_t;

          with trial_type[inp_patt].ts[t] do
              case NPE_Kind of
                -1,0: Act[Cur_PostNPE] := Activation(Cur_PostNPE);

                   3: begin
                        ca1_n := ca1_n + 1;
                        ca1_NPE[ca1_n].Act_t_1 := ca1_NPE[ca1_n].Act_t;

                        Act[Cur_PostNPE] := Activation(Cur_PostNPE);
                      end;

                   4: begin
                        vta_n := vta_n + 1;
                        vta_npe[vta_n].Act_t_1 := vta_npe[vta_n].Act_t;

                        If tsReinforced then
                          Act[Cur_PostNPE] := Cur_US_Act
                        else
                           Act[Cur_PostNPE] := Activation(Cur_PostNPE);
                     end;

                   5: with trial_type[inp_patt] do
                          begin
                            r_n := r_n + 1;
                            r_npe[r_n].Act_t := r_npe[r_n].Act_t_1;

                            Act[Cur_PostNPE] := Activation(Cur_PostNPE);
                            r_npe[r_n].Act_t := Act[Cur_PostNPE];

                            if (R_exc = 0) and (act[Cur_PostNPE] > 0) then
                              Spontaneous_R_Acts[r_n] :=
                              Spontaneous_R_Acts[r_n] + 1;
                          end;

                   6: begin
                        cr_n := cr_n + 1;
                        cr_ur_npe[cr_n].act_t_1 := cr_ur_npe[cr_n].act_t;

                        If tsReinforced then
                          Act[Cur_PostNPE] := Cur_US_Act
                        else
                          Act[Cur_PostNPE] := Activation(Cur_PostNPE);

                        cr_ur_npe[cr_n].Act_t := Act[Cur_PostNPE];
                      end;
              end{case};
        end;

      Update_Set := Update_Set + [Cur_PostNPE];
   until Update_Set = NPE_Set;

   For Cur_PostNPE := Tot_Net_Inputs + 1 to Tot_elements do
      with NPE[Cur_PostNPE] do
        Act_t := Act[Cur_PostNPE];    {synchronous update}
end;


procedure UpdateActivationsSyncSeq; {synchronous sequential update}
var
  ca1_n, vta_n, r_n, cr_n : Integer;
  Act : Array[1..Max_elements] of Extended;
begin
   Update_Set := [];
   ca1_n := 0;
   vta_n := 0;
   r_n := 0;
   cr_n := 0;
   Cur_PostNPE := 0;

   For Cur_PostNPE := Tot_Net_Inputs + 1 to Tot_elements do
      with NPE[Cur_PostNPE] do
        begin
          Act_t_1 := Act_t;

          with trial_type[inp_patt].ts[t] do
              case NPE_Kind of
                -1,0: Act[Cur_PostNPE] := Activation(Cur_PostNPE);

                   3: begin
                        ca1_n := ca1_n + 1;
                        ca1_NPE[ca1_n].Act_t_1 := ca1_NPE[ca1_n].Act_t;

                        Act[Cur_PostNPE] := Activation(Cur_PostNPE);
                      end;

                   4: begin
                        vta_n := vta_n + 1;
                        vta_npe[vta_n].Act_t_1 := vta_npe[vta_n].Act_t;

                        If tsReinforced then
                          Act[Cur_PostNPE] := Cur_US_Act
                        else
                           Act[Cur_PostNPE] := Activation(Cur_PostNPE);
                      end;

                   5: begin
                        r_n := r_n + 1;
                        r_npe[r_n].Act_t := r_npe[r_n].Act_t_1;

                        Act[Cur_PostNPE] := Activation(Cur_PostNPE);
                        r_npe[r_n].Act_t := Act[Cur_PostNPE];

                        if (R_exc = 0) and (act_t > 0) then
                           Spontaneous_R_Acts[r_n] :=
                           Spontaneous_R_Acts[r_n] + 1;
                      end;

                   6: begin
                        cr_n := cr_n + 1;
                        cr_ur_npe[cr_n].act_t_1 := cr_ur_npe[cr_n].act_t;

                        If tsReinforced then
                          Act[Cur_PostNPE] := Cur_US_Act
                        else
                          Act[Cur_PostNPE] := Activation(Cur_PostNPE);
                      end;
              end{case};
        end;

   For Cur_PostNPE := Tot_Net_Inputs + 1 to Tot_elements do
      with NPE[Cur_PostNPE] do
        Act_t := Act[Cur_PostNPE];
end;


procedure UpdateActivationsMoreAsync; {June 18, 2012}
var
  ca1_n, vta_n, r_n, cr_n, rnd_npe, exc_npes, i : Integer;
  rnd : Extended;
begin
   Update_Set := [];
   ca1_n := 0;
   vta_n := 0;
   r_n := 0;
   cr_n := 0;
   exc_npes := 0;

   For i := 1 to exc_npes do
      begin
          repeat
             rnd_npe := Random(Tot_Elements-Tot_Net_Inputs) +
                        Tot_Net_inputs + 1;
          until (not(rnd_npe in Update_Set)) and
                (not(NPE[rnd_npe].NPE_Kind = 3)) and
                (not(NPE[rnd_npe].NPE_Kind = 4)) and
                (not(NPE[rnd_npe].NPE_Kind = 5)) and
                (not(NPE[rnd_npe].NPE_Kind = 6));

          Update_Set := Update_Set + [rnd_npe];
      end;

(*   rnd := Random(100000)/100000;

   If rnd > 0.2 then
      begin
        rnd := Random(100000)/100000;

        if rnd > 0.2 then
            Update_Set := Update_Set + [3,4] else Update_Set := [6,7];
      end;
*)
   Repeat
      repeat
         Cur_PostNPE := Random(Tot_Elements-Tot_Net_Inputs) +
                               Tot_Net_inputs + 1;
      until not(Cur_PostNPE in Update_Set);

      with NPE[Cur_PostNPE] do
        begin
          Act_t_1 := Act_t;

          with trial_type[inp_patt].ts[t] do
              case NPE_Kind of
                -1,0: Act_t := Activation(Cur_PostNPE);

                   3: begin
                        ca1_n := ca1_n + 1;
                        ca1_NPE[ca1_n].Act_t_1 := ca1_NPE[ca1_n].Act_t;

                        Act_t := Activation(Cur_PostNPE);
                        ca1_NPE[ca1_n].Act_t := Act_t;
                      end;

                   4: begin
                        vta_n := vta_n + 1;
                        vta_npe[vta_n].Act_t_1 := vta_npe[vta_n].Act_t;

                        If tsReinforced then
                          Act_t := Cur_US_Act
                        else
                           Act_t := Activation(Cur_PostNPE);

                        vta_npe[vta_n].Act_t := Act_t;
                      end;

                   5: begin
                        r_n := r_n + 1;
                        r_npe[r_n].Act_t := r_npe[r_n].Act_t_1;

                        Act_t := Activation(Cur_PostNPE);
                        r_npe[r_n].Act_t := Act_t;

                        if (R_exc = 0) and (act_t > 0) then
                           Spontaneous_R_Acts[r_n] :=
                           Spontaneous_R_Acts[r_n] + 1;
                      end;

                   6: begin
                        cr_n := cr_n + 1;
                        cr_ur_npe[cr_n].act_t_1 := cr_ur_npe[cr_n].act_t;

                        If tsReinforced then
                          Act_t := Cur_US_Act
                        else
                          Act_t := Activation(Cur_PostNPE);

                        cr_ur_npe[cr_n].Act_t := Act_t;
                      end;
              end{case};
        end;

      Update_Set := Update_Set + [Cur_PostNPE];
   until Update_Set = NPE_Set;
end;


procedure UpdateNet;
begin
   tsReinforced := Reinforcement;

   If UpProc = 'RndAsync' then UpdateActivationsAsyncRnd; {default}
   If UpProc = 'SeqAsync' then UpdateActivationsAsyncSeq;
   If UpProc = 'RndSync' then UpdateActivationsSyncRnd;
   If UpProc = 'SeqSync' then UpdateActivationsSyncSeq;

   Compute_ca1_discrepancies;
   Compute_vta_discrepancies;
   Amplify_ca1_d;

 { Update weights of current NPE }
   if Trial_Type[Inp_Patt].Mode = 0 then
      Update_Wgts1;
end;


procedure UpdateNetRnd;   {random update order of activations and weights}
var
  rnd: Integer;
begin
   tsReinforced := Reinforcement;

   rnd := Random(2);

   Case rnd of
      0: begin
            If UpProc = 'RndAsync' then UpdateActivationsAsyncRnd; {default}
            If UpProc = 'SeqAsync' then UpdateActivationsAsyncSeq;
            If UpProc = 'RndSync' then UpdateActivationsSyncRnd;
            If UpProc = 'SeqSync' then UpdateActivationsSyncSeq;

            Compute_ca1_discrepancies;
            Compute_vta_discrepancies;
            Amplify_ca1_d;

          { Update weights of current NPE }
            if Trial_Type[Inp_Patt].Mode = 0 then
              Update_Wgts1;
        end;
   end{case};

   Case rnd of
      1: begin
            If UpProc = 'RndAsync' then UpdateActivationsAsyncRnd; {default}
            If UpProc = 'SeqAsync' then UpdateActivationsAsyncSeq;
            If UpProc = 'RndSync' then UpdateActivationsSyncRnd;
            If UpProc = 'SeqSync' then UpdateActivationsSyncSeq;

            Compute_ca1_discrepancies;
            Compute_vta_discrepancies;
            Amplify_ca1_d;

          { Update weights of current NPE }
            if Trial_Type[Inp_Patt].Mode = 0 then
              Update_Wgts1;
        end;
   end{case};

   Case rnd of
      2: begin
            If UpProc = 'RndAsync' then UpdateActivationsAsyncRnd; {default}
            If UpProc = 'SeqAsync' then UpdateActivationsAsyncSeq;
            If UpProc = 'RndSync' then UpdateActivationsSyncRnd;
            If UpProc = 'SeqSync' then UpdateActivationsSyncSeq;

            Compute_ca1_discrepancies;
            Compute_vta_discrepancies;
            Amplify_ca1_d;

          { Update weights of current NPE }
            if Trial_Type[Inp_Patt].Mode = 0 then
              Update_Wgts1;
        end;
   end{case};
end;


Procedure Write_Acts;
Var
   ot, i: Integer;
Begin
     for ot := 1 to Tot_Obs_TimeSteps[st] do
        if Obs_ts[st,ot] = t then
           for i := 1 to Tot_Obs_NPEs[st] do
              Writeln(Af[Inp_Patt,i],NPE[Obs_NPE[st,i]].Act_t:21:17);
end;


Procedure Write_Wgts;
Var
   ot, i, j: Integer;
Begin
     for ot := 1 to Tot_Obs_TimeSteps[st] do
         if Obs_ts[st,ot] = t then
            for i := 1 to Tot_Obs_NPEs[st] do
                for j := 1 to NPE[Obs_NPE[st,i]].PreInpNPEs do
                    Writeln(Wf[Inp_Patt,i,j],
                            NPE[Obs_NPE[st,i]].PreInput[j].Weight:21:17);
end;


Procedure Write_CRs;
Var
   ot, crnpe: Integer;
Begin
     for crnpe := 1 to Tot_CR_UR_NPEs do
        for ot := 1 to Tot_Obs_TimeSteps[st] do
           if Obs_ts[st,ot] = t then
             if NPE[CR_UR_NPE[crnpe].NPE_Num].Act_t >= CR[st] then
               Writeln(CRf[Inp_Patt,crnpe],1)
             else
               Writeln(CRf[Inp_Patt,crnpe],0)
end;


Procedure Write_Rs;
Var
   ot, rnpe: Integer;
Begin
     for rnpe := 1 to Tot_R_NPEs do
        for ot := 1 to Tot_Obs_TimeSteps[st] do
           if Obs_ts[st,ot] = t then
             if NPE[R_NPE[rnpe].NPE_Num].Act_t >= R[st] then
                  Writeln(Rf[Inp_Patt,rnpe],1)
               else
                  Writeln(Rf[Inp_Patt,rnpe],0)
end;


Procedure Write_Final_State;
var
   cnpe, pi, j, h : integer;

   txt1, txt2 : String;
   Net_FileNameStr, Temp_NetFileName : String;
   Net_FileNameChar : String;
Begin
  Str(st,txt1);
  Str(sim,txt2);

  h := 0;
  j := Length(Net_FileName[st]);

  repeat
    h := h + 1;
    Net_FileNameChar := Copy(Net_FileName[st],j,1);
    Net_FileNameStr := Copy(Net_FileName[st],j,h);
    j := j - 1;
  until (j = 0) or
        (Net_FileNameChar = '\') or (h > Length(Net_FileName[st]));

  Net_FileNameStr := copy (Net_FileNameStr,1,length(Net_FileNameStr)-4);

  Net_FileName_F1[st] := DataMainDir +
                       '\' + Mess[st] +
                        Net_FileNameStr +
                       '-' + txt2 +
                        Net_FileNameStr +
                       '(FS).ntw';

  Assign(Nf2,Net_FileName_F1[st]);
  j := length(Net_FileName_F1[st]);
  Rewrite(Nf2);

  Writeln(Nf2, Tot_Net_Inputs);
  Writeln(Nf2, Tot_NPEs);

  For cnpe := Tot_Net_Inputs + 1 to Tot_Elements do
    with NPE[cnpe] do
       begin
          Writeln(Nf2, cnpe);
          Writeln(Nf2, Net_Kind);
          Writeln(Nf2, NPE_Kind);
          Writeln(Nf2, SigmaStr);
          Writeln(Nf2, TauStr);
          Writeln(Nf2, KappaStr);
          Writeln(Nf2, AlphaStr);
          Writeln(Nf2, BetaStr);
          Writeln(Nf2, PreInpNPEs);
          PreInpWgts := PreInpNPEs;

        { the number of presynaptic elements has priority ! }
          for pi := 1 to PreInpNPEs do
            begin
               Writeln(Nf2, PreInput[pi].NumStr);
                       str(PreInput[pi].Weight:19:17,
                       PreInput[pi].WgtStr);

               Writeln(Nf2, PreInput[pi].WgtStr);
            end;
       end;

  CloseFile(Nf2);

  str(st,txt1);

  Temp_NetFilename := net_filename[st];
  delete(Temp_NetFilename,length(Temp_NetFilename)-3,4);

  Assign(Nf3,Temp_NetFileName + '[' + txt1 + '].ntw');
  Rewrite(Nf3);

  Writeln(Nf3, Tot_Net_Inputs);
  Writeln(Nf3, Tot_NPEs);

  For cnpe := Tot_Net_Inputs + 1 to Tot_Elements do
    with NPE[cnpe] do
      begin
        Writeln(Nf3, cnpe);
        Writeln(Nf3, Net_Kind);
        Writeln(Nf3, NPE_Kind);
        Writeln(Nf3, SigmaStr);
        Writeln(Nf3, TauStr);
        Writeln(Nf3, KappaStr);
        Writeln(Nf3, AlphaStr);
        Writeln(Nf3, BetaStr);
        Writeln(Nf3, PreInpNPEs);

      { the number of presynaptic elements has priority ! }
        PreInpWgts := PreInpNPEs;

        for pi := 1 to PreInpNPEs do
          begin
            Writeln(Nf3, PreInput[pi].NumStr);
                    str(PreInput[pi].Weight:19:17,
                    PreInput[pi].WgtStr);

            Writeln(Nf3, PreInput[pi].WgtStr);
          end;
      end;

  CloseFile(Nf3);
End;


Procedure Write_Discrepancies;
var
   i, j, h : Integer;
   txt1, txt2 : String;
   Net_FileNameStr, Net_FileNameChar : String;
Begin
    Str(st,txt1);
    Str(sim,txt2);

    h := 0;
    j := Length(Net_FileName[st]);

    repeat
        h := h + 1;
        Net_FileNameChar := Copy(Net_FileName[st],j,1);
        Net_FileNameStr := Copy(Net_FileName[st],j,h);
        j := j - 1;
    until (j = 0) or
        (Net_FileNameChar = '\') or (h > Length(Net_FileName[st]));

    Net_FileNameStr := copy (Net_FileNameStr,1,length(Net_FileNameStr)-4);

    vta_d_FileName := DataMainDir +
                    '\' + Mess[st] +
                     Net_FileNameStr +
                     '-' + txt2 + '\Dd.txt';

    AssignFile(vta_d_f,vta_d_fileName);
    Rewrite(vta_d_f);

    ca1_d_FileName := DataMainDir +
                    '\' + Mess[st] +
                     Net_FileNameStr +
                       '-' + txt2 + '\Hd.txt';

    AssignFile(ca1_d_f,ca1_d_fileName);
    Rewrite(ca1_d_f);

    for i := 1 to TimeSteps do
       Writeln(vta_d_f,vta_d[i]:15:10);

    for i := 1 to TimeSteps do
       Writeln(ca1_d_f,ca1_d[i]:15:10);

    CloseFile(vta_d_f);
    CloseFile(ca1_d_f);
End;



Procedure Close_Data_Files;
Var
   i_p, i, j, crnpe, rnpe: Integer;
Begin
   for i_p := 1 to Tot_Trial_Types do
      begin
         if CR_Crit[st] then
           for crnpe := 1 to Tot_CR_UR_NPEs do
              CloseFile(CRf[i_p,crnpe]);

         if R_Crit[st] then
           for rnpe := 1 to Tot_R_NPEs do
              CloseFile(Rf[i_p,rnpe]);

         for i := 1 to Tot_Obs_NPEs[st] do
            begin
               if StoreActsOnSimType[st] then
                  CloseFile(Af[i_p,i]);

               if StoreWgtsOnSimType[st] then
                 for j := 1 to NPE[Obs_NPE[st,i]].PreInpNPEs do
                    CloseFile(Wf[i_p,i,j]);
            end;
      end;
End;


procedure TForm4b.DrawConditionLabels (Sender : TObject);
Const
   X1 = 27;
   Y1 = 23;
var
   i, j : Integer;
   txt1 : String;
Begin
     for i := 0 to Tot_Sim_Types - 1 do
         begin
              txt1 := Copy(Mess[i+1],1,50);

              for j := 0 to Tot_Obs_NPEs[i+1] - 1 do
                  begin
                       canvas.
                       textout(x1 + (i*158) + 1,y1 + (j*100) - 16, txt1);

                       ScreenBitMap.
                       canvas.
                       textout(x1 + (i*158) + 1,y1 + (j*100) - 16, txt1);
                  end;
         end;
end;


procedure TForm4b.DrawRectangles (Sender : TObject);
Const
   X1 = 25;
   Y1 = 23;
   X2 = 154;
   Y2 = 105;
var
   i, j : Integer;
   txt1 : String;
Begin
     for i := 0 to Tot_Sim_Types - 1 do
         begin
              txt1 := Copy(Mess[i+1],1,50);

              for j := 0 to Tot_Obs_NPEs[i+1] - 1 do
                  begin
                       Canvas.
                       Rectangle(x1 + (i*158),y1 + (j*100),
                                 x2 + (i*158),y2 + (j*100));

                       ScreenBitMap.
                       Canvas.
                       Rectangle(x1 + (i*158),y1 + (j*100),
                                 x2 + (i*158),y2 + (j*100));
                  end;
         end;
End;


procedure TForm4b.DrawNPELabels (Sender : TObject);
Const
   X1 = 2;
   Y1 = 25;
var
   j : Integer;
   txt1, txt2, txt3 : String;
Begin
     txt3 := '';

     for j := 0 to Tot_Obs_NPEs[st] - 1 do
         begin
              str(Obs_NPE[st,j+1],txt1);

              case NPE[Obs_NPE[st,j+1]].Net_Kind of
                   1: txt3 := 'sen';
                   2: txt3 := 'mot';
              end{case};

              case NPE[Obs_NPE[st,j+1]].NPE_Kind of
                   0: txt2 := 'e';
                   1: txt2 := 's';
                  -1: txt2 := 'i';
                   3: txt2 := 'H';
                   4: txt2 := 'D';
                   5: txt2 := 'r';
                   6: txt2 := 'cr';
              end;

              canvas.
              textout(x1 + ((st-1)*158),y1 + (j*100) + 15,txt1);

              canvas.
              textout(x1 + ((st-1)*158),y1 + (j*100) + 30,txt2);

              canvas.
              textout(x1 + ((st-1)*158),y1 + (j*100) + 45,txt3);

              ScreenBitMap.
              canvas.
              textout(x1 + ((st-1)*158),y1 + (j*100) + 15,txt1);

              ScreenBitMap.
              canvas.
              textout(x1 + ((st-1)*158),y1 + (j*100) + 30,txt2);

              ScreenBitMap.
              canvas.
              textout(x1 + ((st-1)*158),y1 + (j*100) + 45,txt3);
         end;
end;


procedure TForm4b.DrawLegend (sender : tobject);
Const
   X1 = 27;
   Y1 = 23;
   Y2 = 105;
var
   j : Integer;
   txt1 : String;
Begin
     for j := 0 to Tot_Trial_Types - 1 do
         begin
              txt1 := Trial_Type[j+1].Lab;

              canvas.
              textout(x1 + ((st-1) * 158) + 10,
                      Tot_Obs_NPEs[st] * y2,
                      txt1);

              canvas.
              Pixels[x1 + ((st-1) * 158) + 5,
                     y2 * Tot_Obs_NPEs[st] + (j * 15) + 10] :=
                     Trial_Type[j+1].Color;

              ScreenBitMap.
              canvas.
              textout(x1 + ((st-1) * 158) + 10,
                      y2  * Tot_Obs_NPEs[st] + (j * 15),
                      txt1);

              ScreenBitMap.
              canvas.
              Pixels[x1 + ((st-1) * 158) + 5,
                     y2 * Tot_Obs_NPEs[st] + (j * 15) + 10] :=
                     Trial_Type[j+1].Color;
         end;
end;


procedure TForm4b.PlotAct(Sender : TObject; X : Integer;
                               Y : Extended; SY : Integer);
Const
   X1 = 27;
   Y1 = 23;
   Height = 105;
Var
   Start_X, Start_Y, PX, PY : LongInt;
begin
     if NPE[Obs_NPE[st,sy+1]].NPE_Kind = 1 then
        Y := Trial_Type[Inp_Patt].ts[t].Cur_Inp_Act[Obs_NPE[st,sy+1]];

     Start_X := X1 + ((st-1)*158);
     Start_Y := Height + (SY*100);

     ScreenBitMap.Canvas.MoveTo(Start_X,Start_Y);

     with trial_type[inp_patt] do
          PX := Start_X + trunc(X/((TotOverallTrials*duration)/125));

     PY := Start_Y - round(y*80 + 2);

     case NPE[Obs_NPE[st,sy+1]].NPE_Kind of
         -1,1,0,3,5: begin
                          Canvas.Pixels[PX,PY] :=
                          Trial_Type[Inp_Patt].Color;
                          ScreenBitMap.Canvas.Pixels[PX,PY] :=
                          Trial_Type[Inp_Patt].Color;
                     end;

                4,6: if tsReinforced then
                        begin
                             Canvas.Pixels[PX,PY] := clRed;
                             ScreenBitMap.Canvas.Pixels[PX,PY] := clRed
                        end else
                           begin
                               Canvas.Pixels[PX,PY] :=
                               Trial_Type[Inp_Patt].Color;
                               ScreenBitMap.Canvas.Pixels[PX,PY] :=
                               Trial_Type[Inp_Patt].Color;
                           end;
     end{case};
end;


Procedure TForm4b.Graph_Activations (Sender : TObject; Sr : Boolean);
var
  ob_n, ob_ts: Integer;
begin
   for ob_n := 0 to Tot_Obs_NPEs[st] - 1 do
      for ob_ts := 1 to Tot_Obs_TimeSteps[st] do
         if t = Obs_ts[st,ob_ts] then
           with NPE[Obs_NPE[st,ob_n+1]] do
               with trial_type[inp_patt] do
                   begin
                   { Assigns the US input's activation to
                      cr/ur NPEs, if reinforced ts }
                      case NPE_Kind of
                          0,-1,
                           3,5: PlotAct_t := Act_t;
                           4,6: If Sr then
                                  PlotAct_t := ts[t].Cur_US_Act
                                else
                                   PlotAct_t := Act_t;
                      end{case};

                      PlotAct(Sender,TimeSteps,PlotAct_t,ob_n);
                   end;
end;


Procedure TForm4b.RunExperiment(Sender: TObject);
var
  st1, st2, o, tt: Integer;
Begin
   Randomize;
   ExperimentDone := False;

   for st1 := 1 to Tot_Sim_Types do
      begin
        largerthan := true;
        tot1 := Tot_Obs_NPEs[st1];

        for st2 := 1 to Tot_Obs_NPEs[st1] do
           if st1 <> st2 then
             largerthan := (largerthan) and
                           (tot1 >= Tot_Obs_NPEs[st2]);

        if largerthan then
          Largest := tot1;
      end;

   ScreenBitMap := TBitMap.Create;
   ScreenBitMap.Width := Tot_Sim_Types * 170 + 20;
   ScreenBitMap.Height := largest * 100 + 100;

   Form4b.Left := 0;
   Form4b.Top := 0;

   Form4b.Width := Tot_Sim_Types * 170 + 20;
   Form4b.Height := largest * 100 + 100;

   DrawRectangles(Sender);
   DrawConditionLabels(Sender);

   ScreenBitMapFree := False;

   sim := 0; { replication }

   Ran3INext := 1;

   For o := 1 to Tot_Outputs do
       Spontaneous_R_Acts[o] := 0;

   try
   if not(ExperimentDone) then
     repeat
        sim := sim + 1; { replication counter }

        str(sim,sim_txt);

        st := 0;  { resets the condition number for each replication }

        if not(ExperimentDone) then
          repeat
             st := st + 1; { condition counter }

             Form0.Caption := 'Running ' + Form0.OpenDialog1.FileName +
                              '. Replication ' + sim_txt +
                              '. Network: ' + Net_FileName[st] +
                              '. Protocol: ' + Sch_FileName[st];

             OpenNetFile(Sender); { Opens network file }
             OpenSchFile(Sender); { Opens schedule (training) file }

             if Tot_Net_Inputs <> Tot_Sch_Inputs then
               begin
                 str1 := 'Number of S units must coincide in ' +
                         ' network and protocol.';
                 MessageDlg(str1,mtError,[mbCancel],0);
                 CloseFile(Sf);
                 ExperimentDone := True;
               end;

             if not(ExperimentDone) then
               begin
                     DrawNPElabels(sender);
                     DrawLegend(sender);
                     Image1.Picture.Graphic := ScreenBitMap;
                     Repaint;

                  If (Rst_Wgts[st] = -1) or (Rst_Wgts[st] = 1) then
                    begin
                       Reset_Weights;
                       Write_Initial_State;
                    end;

                  If (StoreActsOnSimType[st]) or
                     (StoreWgtsOnSimType[st]) or
                     (CR_Crit[st]) or
                     (R_Crit[st]) then
                      OpenDataFiles(Sender);

                  If not(ExperimentDone) then
                    begin
                       TimeSteps := 0;
                       ovrl_tr := 0;
                       tot_tr := 0;

                     { Initializes NPE activations to spontaneous levels
                       at the beginning of training }
                       Init_Acts;

                       lri := 0;

                       For tt := 1 to Tot_Trial_Types do
                          tr[tt] := 0;

                       If not(ExperimentDone) then
                         repeat
                            ovrl_tr := ovrl_tr + 1;
                            str(ovrl_tr,tr_txt);

                            repeat
                               Inp_Patt := Random(Tot_Trial_Types) + 1;
                            until tr[inp_patt] <=
                                  Trial_Type[Inp_Patt].Tot_Trials;

                            tr[inp_patt] := tr[inp_patt] + 1;

                            t := 0;

                          { Resets (some) NPE activations to spontaneous levels
                            after each trial }
                            If ResetActs = 1 then
                                Reset_acts;

                            If not(ExperimentDone) then
                              repeat
                                 t := t + 1;

                                 Update_Set := [];
                                 TimeSteps := TimeSteps + 1;
                                 str(t,ts_txt);
                                 Str(Avg_ca1_d_t:7:5,ca1_d_str);
                                 Str(Avg_vta_d_t:7:5,vta_d_str);

                                 if Form4bOpen then
                                   Form4b.Caption := 'Trial ' + tr_txt +
                                                   ', ts = ' +  ts_txt +
                                                   ', Hd = ' +
                                                   ca1_d_str +
                                                   ', Dd = ' +
                                                   vta_d_str;

                                {DelaySim(2000000);}

                                 If not(ExperimentDone) then
                                   begin
                                      Create_Input_Vector;
                                      UpdateNet; {non-rendomized update}
                                   end;

                                 if not(ExperimentDone) then
                                   begin
                                      Graph_Activations(Sender,
                                                        tsReinforced);

                                      if StoreActsOnSimType[st] then
                                         Write_Acts;

                                      if StoreWgtsOnSimType[st] then
                                         Write_Wgts;

                                      if R_Crit[st] then
                                         Write_Rs;

                                      if CR_Crit[st] then
                                         Write_CRs;
                                   end;
                              until (t = Trial_Type[Inp_Patt].Duration)
                                     or (ExperimentDone) { of a trial };
                         until (ovrl_tr = TotOverallTrials)
                            or (ExperimentDone) { of a session };

                     { Save final weights as history }
                       If not(ExperimentDone) then
                         begin
                            Write_Final_State;
                            Write_Discrepancies;

                            if StoreActsOnSimType[st] or
                               StoreWgtsOnSimType[st] or
                               R_Crit[st] or CR_Crit[st] then
                                Close_Data_Files;
                         end;
                    end;
               end;
            Application.ProcessMessages;
          until (st = Tot_Sim_Types) or (ExperimentDone) {of a condition};
     until (sim = Tot_Sims) or (ExperimentDone) {of a replication};
   finally

   ExperimentDone := True;

   end;

   if Form4bOpen then
      begin
          Form4b.BorderStyle := bsSizeable;
          Image1.Picture.Graphic := ScreenBitMap;
          Form0.Caption := Form0.OpenDialog1.FileName + ' done...';
          Save1.Enabled := True;
       end;
End;


procedure TForm4b.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if not(ExperimentDone) then
        if MessageDlg('Interrupt the experiment?',
                       mtConfirmation,
                      [mbYes, mbNo],0) = mrYes then
                       begin
                          ExperimentDone := True;
                          Form4bOpen := False;

                          Form0.Caption := 'SelNet';
                          Form0.Run1.Enabled := True;
                          Save1.Enabled := False;
                          ScreenBitMapFree := True;
                          ScreenBitMap.Free;
                          Form4b.Destroy;
                       end;

     if (ExperimentDone) and (Form4bOpen) then
        if MessageDlg('Close graph-screen window?',
                       mtConfirmation,
                      [mbYes, mbNo],0) = mrYes then
                       begin
                          Form4bOpen := False;

                          Form0.Caption := 'SelNet';
                          Form0.Run1.Enabled := True;
                          Save1.Enabled := False;
                          ScreenBitMapFree := True;
                          ScreenBitMap.Free;
                          Form4b.Destroy;
                       end;
end;


procedure TForm4b.BitMap1Click(Sender: TObject);
begin
     if SaveFigureDialog.Execute then
        ScreenBitMap.SaveToFile(SaveFigureDialog.FileName);
end;

end.


unit Sn_Unit2b;

{MODULE FOR DESIGNING NETWORKS}
{SECOND TYPE OF D UNIT INCLUDED: 09-15-2020}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls, Buttons, DBTables, Db,
  Grids;

Const
     Max_NPEs = 255;
     Max_Inputs = 25;   { maximum number of input elements }
     Max_Pre_Inps = 25; { maximum number of presynaptic inputs per NPE }
     Max_Post_Outs = 30; { maximum number of postsynaptic outputs per NPE }
     Max_Elements = 255;
     Max_Outputs = 30;
     Max_Disc_NPEs = 30;

type
    TForm2b = class(TForm)
    Panel2: TPanel;
    StaticText4: TStaticText;
    EditTotInputs: TEdit;
    StaticText5: TStaticText;
    EditTotNPEs: TEdit;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    Main1: TMenuItem;
    OpenNet: TMenuItem;
    Panel3: TPanel;
    Label10: TLabel;
    statictext8: TStaticText;
    EditGoTo: TEdit;
    GroupBox4: TGroupBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditSigma: TEdit;
    EditTau: TEdit;
    EditKappa: TEdit;
    EditAlpha: TEdit;
    EditBeta: TEdit;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    GroupBox2: TGroupBox;
    SaveDialog1: TSaveDialog;
    NumText: TStaticText;
    WgtsText: TStaticText;
    GroupBox9: TGroupBox;
    NextBttn: TSpeedButton;
    BackBttn: TSpeedButton;
    DelNPEBttn: TButton;
    DefParBttn: TButton;
    StaticText3: TStaticText;
    SaveNet: TMenuItem;
    NewNet: TMenuItem;
    RecNPEBttn: TButton;
    Elements: TStaticText;
    FanInStringGrid: TStringGrid;
    Exit1: TMenuItem;
    N1: TMenuItem;
    PrintDialog1: TPrintDialog;
    RichEdit1: TRichEdit;
    Print1: TMenuItem;
    StaticText1: TStaticText;
    NPEs1: TMenuItem;
    Connections1: TMenuItem;
    sa: TRadioButton;
    ca1: TRadioButton;
    cortical: TGroupBox;
    ma: TRadioButton;
    vta1: TRadioButton;
    output: TGroupBox;
    Operant: TRadioButton;
    Respondent1: TRadioButton;
    Respondent2: TRadioButton;
    exc: TRadioButton;
    inh: TRadioButton;
    vta2: TRadioButton;
    procedure HandCraftNet (Sender : TObject);
    procedure EditTotInputsChCl(Sender: TObject);
    procedure EditTotInputsChange(Sender: TObject);
    procedure EditTotNPEsChCl(Sender: TObject);
    procedure EditTotNPEsChange(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure EditSigmaChange(Sender: TObject);
    procedure EditTauChange(Sender: TObject);
    procedure EditKappaChange(Sender: TObject);
    procedure EditAlphaChange(Sender: TObject);
    procedure EditBetaChange(Sender: TObject);
    procedure EditTotInputsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditTotNPEsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditSigmaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditTauKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditKappaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditAlphaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditBetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditSigmaChCl(Sender: TObject);
    procedure EditTauChCl(Sender: TObject);
    procedure EditKappaChCl(Sender: TObject);
    procedure EditAlphaChCl(Sender: TObject);
    procedure EditBetaChCl(Sender: TObject);
    procedure saClick(Sender: TObject);
    procedure maClick(Sender: TObject);
    procedure excClick(Sender: TObject);
    procedure inhClick(Sender: TObject);
    procedure ca1Click(Sender: TObject);
    procedure vta1Click(Sender: TObject);
    procedure OperantClick(Sender: TObject);
    procedure Respondent1Click(Sender: TObject);
    procedure Respondent2Click(Sender: TObject); (* Second CR/UR: 05/17/2013 *)
    procedure NextBttnClick(Sender: TObject);
    procedure BackBttnClick(Sender: TObject);
    procedure CloseBttnClick(Sender: TObject);
    procedure DefParBttnClick(Sender: TObject);
    procedure CorticalClick(Sender: TObject);
    procedure subcorticalClick(Sender: TObject);
    procedure outputClick(Sender: TObject);
    procedure GroupBox7Click(Sender: TObject);
    procedure GroupBox10Click(Sender: TObject);
    procedure EditGoToChange(Sender: TObject);
    procedure EditGoToKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DelNPEBttnClick(Sender: TObject);
    procedure NumTextClick(Sender: TObject);
    procedure WgtsTextClick(Sender: TObject);
    Function AllFieldsFilled(Sender: TObject) : Boolean;
    procedure SaveNetClick(Sender: TObject);
    procedure SaveNetFile(Sender: TObject);
    procedure OpenNetFile(Sender: TObject);
    procedure OpenNetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure RecNPEBttnClick(Sender: TObject);
    procedure NewNetClick(Sender: TObject);
    procedure FanInStringGridDblClick(Sender: TObject);
    procedure FanInStringGridExit(Sender: TObject);
    procedure FanInStringGridMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FanInStringGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuildHints(sender : tobject);
    procedure NPEs1Click(Sender: TObject);
    procedure Connections1Click(Sender: TObject);
    procedure UncheckAllTypeButtons(sender: tobject);
    procedure UpdatePostOutNPEs (sender: tobject);
    procedure CountConnections (sender : tobject);
    procedure vta2Click(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
    end;

    Flag = -3..10;  { for probe, Pavlovian/operant, input-type,
                      net-type, npe-type, and reset-weights}

    NPEType = Array [1..Max_Elements] of
                  Record
                    Number {NPE number},
                    PreInpWgts, PreInpNPEs, PostOutNPEs : integer;

                    Net_Kind {  1 = Polysensory; 2 = Motor },
                    NPE_Kind { -1 = hidden inhibitory;
                                0 = hidden excitatory;

                                1 = SC1;
                                2 = SC2;

                                3 = CA1;
                                4 = VTA1;

                                5 = R ;
                                6 = CR/UR1
                                7 = CR/UR2 (05-17-2013)
                                8 = VTA2 (09-17-2020 }  :  Flag;

                  { Free parameters }
                    LogisSigma, { std (temperature) of logistic function }
                    Tau,        { temporal summation parameter }
                    Kappa,      { activation decay parameter }
                    Alpha,      { acquisition rate }
                    Beta       { extinction rate } : Extended;

                    SigmaStr,
                    TauStr,
                    KappaStr,
                    AlphaStr,
                    BetaStr: String;

                    p_epsp_t {EPSP},
                    Act_t_1, Act_t {activations at t-1 and t} : extended;

                  { Presynaptic inputs to NPE }
                    PreInput : Array [1..Max_Pre_Inps] of
                                     Record
                                        Num: integer;
                                        Weight: extended;

                                        NumStr, WgtStr : String;
                                     end;

                  { Presynaptic inputs to NPE }
                    PostOutput : Array [1..Max_Post_Outs] of
                                       Record
                                          Num: integer;
                                          Weight: extended;

                                          NumStr, WgtStr : String;
                                       end;

                    Deleted : Boolean;
                  end;

    ConnectionType = Array[1..Max_NPEs*Max_pre_Inps] of
                       Record
                          pre, post : Integer;
                          pre_str, post_str : String;
                          w : Extended;
                          w_str : String;
                       end;


var
   Form2b: TForm2b;

   NPE : NPEType;

   Connection : ConnectionType;

 { Neural-Processing-Element record }

   Exc_NPEs, Inh_NPEs,
   Tot_Inputs, Tot_NPEs, Tot_Elements,
   Cur_NPE,
   Tot_CA1_NPEs,
   Tot_VTA1_NPEs,
   Tot_VTA2_NPEs,
   SA_NPEs, MA_NPEs,
   Tot_R_NPEs,
   Tot_CR_UR1_NPEs, Tot_CR_UR2_NPEs, err, Tot_Connections: integer;

   Net_FileName,
   Net_FileName_I,
   Net_FileName_F : String;

   Nf1, Nf2: Text;

   prev_sigma_str,
   prev_tau_str,
   prev_kappa_str,
   prev_alpha_str,
   prev_beta_str,

   cur_sigma_str,
   cur_tau_str,
   cur_kappa_str,
   cur_alpha_str,
   cur_beta_str:  String;

   JustSaved : Boolean;

   PrintNPEs, PrintConnections : Boolean;
   Bttn_Clicked : Boolean;
   OpenNetRequest : Boolean;

implementation

uses Sn_Unit0;

{$R *.DFM}

procedure TForm2b.UncheckAllTypeButtons(sender: tobject);
begin
  sa.checked := false;
  ma.checked := false;
  exc.checked := false;
  inh.checked := false;
  ca1.checked := false;
  vta1.checked := false;
  vta2.checked := false;
  operant.checked := false;
  respondent1.checked := false;
  respondent2.checked := false;
end;

procedure Count_NPEs;
var
  n : Integer;
begin
  Exc_NPEs := 0;
  Inh_NPEs := 0;
  Tot_CA1_NPEs := 0;
  Tot_VTA1_NPEs := 0;
  Tot_VTA2_NPEs := 0;
  SA_NPEs := 0;
  MA_NPEs := 0;
  Tot_R_NPEs := 0;
  Tot_CR_UR1_NPEs := 0;
  Tot_CR_UR2_NPEs := 0;

  for n := Tot_Inputs + 1 to Tot_Elements do
    with NPE[n] do
      begin
        Case Net_Kind of
           1: if NPE_Kind <> 3 then
                SA_NPEs:=SA_NPEs+1;

           2: if (NPE_Kind <> 4) and (NPE_Kind <> 5) and
                 (NPE_Kind <> 6) then
                MA_NPEs:=MA_NPEs+1;
        end{case};

        Case NPE_Kind of
          -1: Inh_NPEs := Inh_NPEs + 1;
           0: Exc_NPEs := Exc_NPEs + 1;
           3: Tot_ca1_NPEs := Tot_ca1_NPEs + 1;
           4: Tot_vta1_NPEs := Tot_vta1_NPEs + 1;
           5: Tot_R_NPEs := Tot_R_NPEs + 1;
           6: Tot_CR_UR1_NPEs := Tot_CR_UR1_NPEs + 1;
           7: Tot_CR_UR2_NPEs := Tot_CR_UR2_NPEs + 1;
           8: Tot_vta2_NPEs := Tot_vta2_NPEs + 1;
        end{case};
      end;
end;

procedure TForm2b.UpdatePostOutNPEs (sender: tobject);
var
  i, j, p_i : integer;
  txt0 : string;
begin
  for i := 1 to Tot_Elements do
    begin
      NPE[i].PostOutNPEs := 0;

      str(NPE[i].Number,txt0);

      for j := Tot_Inputs + 1 to Tot_Elements do
        for p_i := 1 to NPE[j].PreInpNPEs do
          if NPE[j].PreInput[p_i].Num = NPE[i].Number then
            begin
              NPE[i].PostOutNPEs := NPE[i].PostOutNPEs + 1;

              NPE[i].PostOutput[NPE[i].PostOutNPEs].Num :=
              NPE[j].Number;

              NPE[i].PostOutput[NPE[i].PostOutNPEs].Weight :=
              NPE[j].PreInput[p_i].Weight;

              str(NPE[j].Number,NPE[i].PostOutput[NPE[i].PostOutNPEs].NumStr);

              NPE[i].PostOutput[NPE[i].PostOutNPEs].WgtStr :=
              NPE[j].PreInput[p_i].WgtStr;
            end;
    end;
end;

procedure TForm2b.CountConnections (sender : tobject);
var
  i, j : Integer;
  txt : string;
begin
  tot_connections := 0;

  for i := Tot_Inputs + 1 to Tot_Elements do
    with NPE[i] do
      for j := 1 to PreInpNPEs do
        begin
          Tot_Connections := Tot_Connections + 1;

          with connection[tot_connections]do
            begin
              pre := NPE[PreInput[j].Num].Number;
              post := NPE[i].Number;

              str(post,txt);
              pre_str := PreInput[j].NumStr;
              post_str := txt;

              w := PreInput[j].Weight;
              w_str := PreInput[j].WgtStr;
            end;
        end;

  str(tot_connections,txt);
  StaticText1.Caption := 'Connections: ' + txt;
end;


procedure TForm2b.BuildHints(sender: tobject);
var
  i, p_i, p_i_2, p_i_3, n, c : Integer;
  txt0, txt0b, txt1, txt1b, txt2, txt3, txt4, txt5, txt6 : String;
begin
  StaticText3.Hint := '';  {current NPE}
  statictext4.hint := ''; {inputs}
  statictext5.hint := ''; {NPEs}
  Elements.Hint := '';

  txt0 := '';
  txt1 := '';
  txt2 := '';
  txt3 := '';
  txt4 := '';
  txt5 := '';
  txt6 := '';


  UpdatePostOutNPEs (sender);
  CountConnections (sender);

  for i := 1 to Tot_Elements do
    begin
        str(NPE[i].Number,txt0);

        case NPE[i].Net_Kind of
          1: txt2 := 'H';
          2: txt2 := 'D';
        end{case};

        with NPE[i] do
          case NPE_Kind of
           -2: begin
                 txt3 := 'nil';

                 StaticText5.Hint := StaticText5.Hint + txt0 + ': '  +
                                     txt2 + ', ' + txt3 + '; Pre={';

                 txt4 := '';

                 if PreInpNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to PreInpNPEs do
                     begin
                        txt4 := txt4 + '(' + PreInput[p_i_2].NumStr +
                                ',' + copy(PreInput[p_i_2].WgtStr,1,5) +
                                ')';

                        if p_i_2 < PreInpNPEs then
                          txt4 := txt4  + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt4 +
                                     '}, Post={';

                 txt5 := '';

                 if PostOutNPEs = 0 then
                   txt5 := 'ø'
                 else
                   for p_i_3 := 1 to PostOutNPEs do
                     begin
                        txt5 := txt5 + '(' + PostOutput[p_i_3].NumStr +
                                ',' + copy(PostOutput[p_i_3].WgtStr,1,5) +
                                ')';

                        if p_i_3 < PostOutNPEs then
                           txt5 := txt5  + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt5 + '}; ';
               end;

            0: begin
                 txt3 := 'exc';

                 StaticText5.Hint := StaticText5.Hint + txt0 + ': '  +
                                     txt2 + ', ' + txt3 + '; Pre={';

                 txt4 := '';

                 if PreInpNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to PreInpNPEs do
                     begin
                        txt4 := txt4 + '(' + PreInput[p_i_2].NumStr +
                                ',' + copy(PreInput[p_i_2].WgtStr,1,5) +
                                ')';

                        if p_i_2 < PreInpNPEs then
                          txt4 := txt4  + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt4 +
                                     '}, Post={';

                 txt5 := '';

                 if PostOutNPEs = 0 then
                   txt5 := 'ø'
                 else
                   for p_i_3 := 1 to PostOutNPEs do
                     begin
                        txt5 := txt5 + '(' + PostOutput[p_i_3].NumStr +
                                ',' + copy(PostOutput[p_i_3].WgtStr,1,5) +
                                ')';

                        if p_i_3 < PostOutNPEs then
                           txt5 := txt5  + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt5 + '}; ';
               end;

            1: begin
                 StaticText4.Hint := StaticText4.Hint + txt0 + ': '  +
                                     ' Post={';

                 txt4 := '';

                 if PostOutNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to PostOutNPEs do
                     begin
                       txt4 := txt4 + '(' + PostOutput[p_i_2].NumStr +
                                ',' + copy(PostOutput[p_i_2].WgtStr,1,5) +
                                ')';

                       if p_i_2 < PostOutNPEs then
                         txt4 := txt4 + ', ';
                     end;

                 StaticText4.Hint := StaticText4.Hint + txt4 + '}.   ';
               end;

           -1: begin
                 txt3 := 'inh';

                 StaticText5.Hint := StaticText5.Hint + txt0 + ': '  +
                                     txt2 + ', ' + txt3 + '; Pre={';

                 txt4 := '';

                 if PreInpNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to PreInpNPEs do
                     begin
                        txt4 := txt4 + '(' + PreInput[p_i_2].NumStr +
                                ',' + copy(PreInput[p_i_2].WgtStr,1,5) +
                                ')';

                        if p_i_2 < PreInpNPEs then
                          txt4 := txt4  + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt4 +
                                     '}, Post={';

                 txt5 := '';

                 if PostOutNPEs = 0 then
                   txt5 := 'ø'
                 else
                   for p_i_3 := 1 to PostOutNPEs do
                     begin
                        txt5 := txt5 + '(' + PostOutput[p_i_3].NumStr +
                                ',' + copy(PostOutput[p_i_3].WgtStr,1,5) +
                                ')';

                        if p_i_3 < PostOutNPEs then
                          txt5 := txt5 + ', ';
                   end;

                 StaticText5.Hint := StaticText5.Hint + txt5 + '}; ';
               end;

            3: begin
                 txt3 := 'H';

                 StaticText5.Hint := StaticText5.Hint + txt0 + ': '  +
                                     txt2 + ', ' + txt3 + '; Pre={';

                 txt4 := '';

                 if PreInpNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to PreInpNPEs do
                     begin
                        txt4 := txt4 + '(' + PreInput[p_i_2].NumStr +
                                ',' + copy(PreInput[p_i_2].WgtStr,1,5) +
                                ')';

                        if p_i_2 < PreInpNPEs then
                          txt4 := txt4 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt4 +
                                     '}, Post={';

                 txt5 := '';

                 if PostOutNPEs = 0 then
                   txt5 := 'ø'
                 else
                   for p_i_3 := 1 to PostOutNPEs do
                     begin
                        txt5 := txt5 + '(' + PostOutput[p_i_3].NumStr +
                                ',' + copy(PostOutput[p_i_3].WgtStr,1,5) +
                                ')';

                        if p_i_3 < PostOutNPEs then
                          txt5 := txt5 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt5 + '}; ';
               end;

            4: begin
                 txt3 := 'D';

                 StaticText5.Hint := StaticText5.Hint + txt0 + ': '  +
                                     txt2 + ', ' + txt3 + '; Pre={';

                 txt4 := '';

                 if PreInpNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to PreInpNPEs do
                     begin
                        txt4 := txt4 + '(' + PreInput[p_i_2].NumStr +
                                ',' + copy(PreInput[p_i_2].WgtStr,1,5) +
                                ')';

                        if p_i_2 < PreInpNPEs then
                          txt4 := txt4 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt4 +
                                     '}, Post={';

                 txt5 := '';

                 if PostOutNPEs = 0 then
                   txt5 := 'ø'
                 else
                   for p_i_3 := 1 to PostOutNPEs do
                     begin
                        txt5 := txt5 + '(' + PostOutput[p_i_3].NumStr +
                                ',' + copy(PostOutput[p_i_3].WgtStr,1,5) +
                                ')';

                        if p_i_3 < PostOutNPEs then
                          txt5 := txt5 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt5 + '}; ';
               end;

            5: begin
                 txt3 := 'R';

                 StaticText5.Hint := StaticText5.Hint + txt0 + ': '  +
                                     txt2 + ', ' + txt3 + '; Pre={';

                 txt4 := '';

                 if PreInpNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to PreInpNPEs do
                     begin
                        txt4 := txt4 + '(' + PreInput[p_i_2].NumStr +
                                ',' + copy(PreInput[p_i_2].WgtStr,1,5) +
                                ')';

                        if p_i_2 < PreInpNPEs then
                          txt4 := txt4 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt4 +
                                     '}, Post={';

                 txt5 := '';

                 if PostOutNPEs = 0 then
                   txt5 := 'ø'
                 else
                   for p_i_3 := 1 to PostOutNPEs do
                     begin
                        txt5 := txt5 + '(' + PostOutput[p_i_3].NumStr +
                                ',' + copy(PostOutput[p_i_3].WgtStr,1,5) +
                                ')';

                        if p_i_3 < PostOutNPEs then
                          txt5 := txt5 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt5 + '}; ';
               end;

            6: begin
                 txt3 := 'R*1';

                 StaticText5.Hint := StaticText5.Hint + txt0 + ': '  +
                                     txt2 + ', ' + txt3 + '; Pre={';

                 txt4 := '';

                 if PreInpNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to PreInpNPEs do
                     begin
                        txt4 := txt4 + '(' + PreInput[p_i_2].NumStr +
                                ',' + copy(PreInput[p_i_2].WgtStr,1,5) +
                                ')';

                        if p_i_2 < PreInpNPEs then
                          txt4 := txt4 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt4 +
                                     '}, Post={';

                 txt5 := '';

                 if PostOutNPEs = 0 then
                   txt5 := 'ø'
                 else
                   for p_i_3 := 1 to PostOutNPEs do
                     begin
                        txt5 := txt5 + '(' + PostOutput[p_i_3].NumStr +
                                ',' + copy(PostOutput[p_i_3].WgtStr,1,5) +
                                ')';

                        if p_i_3 < PostOutNPEs then
                          txt5 := txt5 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt5 + '}; ';
               end;

            7: begin
                 txt3 := 'R*2';

                 StaticText5.Hint := StaticText5.Hint + txt0 + ': '  +
                                     txt2 + ', ' + txt3 + '; Pre={';

                 txt4 := '';

                 if PreInpNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to PreInpNPEs do
                     begin
                        txt4 := txt4 + '(' + PreInput[p_i_2].NumStr +
                                ',' + copy(PreInput[p_i_2].WgtStr,1,5) +
                                ')';

                        if p_i_2 < PreInpNPEs then
                          txt4 := txt4 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt4 +
                                     '}, Post={';

                 txt5 := '';

                 if PostOutNPEs = 0 then
                   txt5 := 'ø'
                 else
                   for p_i_3 := 1 to PostOutNPEs do
                     begin
                        txt5 := txt5 + '(' + PostOutput[p_i_3].NumStr +
                                ',' + copy(PostOutput[p_i_3].WgtStr,1,5) +
                                ')';

                        if p_i_3 < PostOutNPEs then
                          txt5 := txt5 + ', ';
                     end;

                 StaticText5.Hint := StaticText5.Hint + txt5 + '}; ';
               end;
          end{case};

        if NPE[i].NPE_Kind <> 1 then
          begin
            if NPE[i].SigmaStr = '' then
              StaticText5.Hint := StaticText5.Hint +
                              'sigma=0, '
            else
              StaticText5.Hint := StaticText5.Hint +
                              'sigma=' + NPE[i].SigmaStr + ', ';

            if NPE[i].TauStr = '' then
              StaticText5.Hint := StaticText5.Hint +
                              'tau=0, '
            else
              StaticText5.Hint := StaticText5.Hint +
                              'tau=' + NPE[i].TauStr + ', ';

            if NPE[i].KappaStr = '' then
              StaticText5.Hint := StaticText5.Hint +
                              'kappa=0, '
            else
              StaticText5.Hint := StaticText5.Hint +
                              'kappa=' + NPE[i].KappaStr + ', ';

            if NPE[i].AlphaStr = '' then
              StaticText5.Hint := StaticText5.Hint +
                              'alpha=0, '
            else
              StaticText5.Hint := StaticText5.Hint +
                              'alpha=' + NPE[i].AlphaStr + ', ';

            if NPE[i].BetaStr = '' then
              StaticText5.Hint := StaticText5.Hint +
                              'beta=0.   '
            else
              StaticText5.Hint := StaticText5.Hint +
                              'beta=' + NPE[i].BetaStr + '.   ';
          end;
    end;

  Count_NPEs;

  str(sa_NPEs,txt0);
  str(ma_NPEs,txt1);
  str(exc_NPEs,txt0b);
  str(inh_NPEs,txt1b);
  str(Tot_ca1_NPEs,txt2);
  str(Tot_vta1_NPEs,txt3);
  str(Tot_vta2_NPEs,txt3);
  str(Tot_R_NPEs,txt4);
  str(Tot_CR_UR1_NPEs,txt5);
  str(Tot_CR_UR2_NPEs,txt6);

  Elements.Hint := 'NPE count:  ' + txt0 + ' H,  ' + txt1 +
                   ' D,  ' + txt0b + ' +,  ' + txt1b +
                   ' -,  ' + txt2 + ' H,  ' + txt3 +
                   ' D,  ' + txt4 + ' R,  ' + txt5 + ' R*1 '+ txt6 + ' R*2 ';

  if PrintNPEs then
    RichEdit1.Text := caption + ' (units)    -    ' +
                      StaticText4.Hint + '    ' + StaticText5.Hint;

  txt0 := '';
  txt1 := '';
  txt2 := '';
  txt3 := '';
  txt4 := '';
  txt5 := '';

  with NPE[cur_npe] do
    for p_i := 1 to PostOutNPEs do
      begin
        case NPE[PostOutput[p_i].Num].Net_Kind of
          1: txt2 := 'INT(Hip)';
          2: txt2 := 'INT(Dop)';
        end{case};

        case NPE[PostOutput[p_i].Num].NPE_Kind of
         -2: txt3 := 'nil';
          0: txt3 := 'exc';
          1: txt3 := 'inp';
         -1: txt3 := 'inh';
          3: txt3 := 'Hip';
          4: txt3 := 'Dop';
          5: txt3 := 'R';
          6: txt3 := 'R*';
         end{case};

         StaticText3.Hint := StaticText3.Hint +
                             PostOutput[p_i].NumStr + ': ' + 'w=' +
                             copy(PostOutput[p_i].WgtStr,1,5) + '; ' +
                             txt2 + ', ' + txt3 + '; Pre={';

         txt4 := '';

         if NPE[PostOutput[p_i].Num].PreInpNPEs = 0 then
           txt4 := 'ø'
         else
           for p_i_2 := 1 to NPE[PostOutput[p_i].Num].PreInpNPEs do
             begin
               txt4 := txt4 + '(' + NPE[PostOutput[p_i].Num].
                                    PreInput[p_i_2].NumStr +
                              ',' + copy(NPE[PostOutput[p_i].Num].
                                         PreInput[p_i_2].WgtStr,1,5) +
                              ')';

             if p_i_2 < NPE[PostOutPut[p_i].Num].PreInpNPEs then
               txt4 := txt4 + ', ';
           end;

         StaticText3.Hint := StaticText3.Hint + txt4 + '}, Post={';

         txt5 := '';

         if NPE[PostOutput[p_i].Num].PostOutNPEs = 0 then
           txt5 := 'ø'
         else
           for p_i_2 := 1 to NPE[PostOutput[p_i].Num].PostOutNPEs do
             begin
               txt5 := txt5 + '(' + NPE[PostOutput[p_i].Num].
                                    PostOutput[p_i_2].NumStr +
                              ',' + copy(NPE[PostOutput[p_i].Num].
                                    PostOutput[p_i_2].WgtStr,1,5) +
                              ')';

               if p_i_2 < NPE[PostOutPut[p_i].Num].PostOutNPEs then
                 txt5 := txt5 + ', ';
             end;

         StaticText3.Hint := StaticText3.Hint + txt5 + '}; ';

         if NPE[PostOutput[p_i].Num].SigmaStr = '' then
           StaticText3.Hint := StaticText3.Hint + 'sigma=0'
         else
           StaticText3.Hint := StaticText3.Hint + 'sigma=' +
                               NPE[PostOutput[p_i].Num].SigmaStr;

         if NPE[PostOutput[p_i].Num].TauStr = '' then
           StaticText3.Hint := StaticText3.Hint + ',tau=0'
         else
           StaticText3.Hint := StaticText3.Hint + ',tau=' +
                               NPE[PostOutput[p_i].Num].TauStr;

         if NPE[PostOutput[p_i].Num].KappaStr = '' then
           StaticText3.Hint := StaticText3.Hint + ',kappa=0'
         else
           StaticText3.Hint := StaticText3.Hint + ',kappa=' +
                               NPE[PostOutput[p_i].Num].KappaStr;

         if NPE[PostOutput[p_i].Num].AlphaStr = '' then
           StaticText3.Hint := StaticText3.Hint + ',alpha=0'
         else
           StaticText3.Hint := StaticText3.Hint + ',alpha=' +
                               NPE[PostOutput[p_i].Num].AlphaStr;

         if NPE[PostOutput[p_i].Num].BetaStr = '' then
           StaticText3.Hint := StaticText3.Hint + ',beta=0'
         else
           StaticText3.Hint := StaticText3.Hint + ',beta=' +
                               NPE[PostOutput[p_i].Num].BetaStr + '.   ';
      end;

  StaticText1.Hint := '';
  txt1 := '';

  for c := 1 to tot_connections do
    begin
      with connection[c] do
        txt1 := txt1 + '{(' + pre_str + ',' + post_str + '), ' +
                copy(w_str,1,5) + '}';

      if c < tot_connections then
        txt1 := txt1  + ';   '
      else
        txt1 := txt1  + '.';
    end;

  StaticText1.Hint := txt1;

  if PrintConnections then
    RichEdit1.Text := caption + ' (connections)    -    ' +
                      StaticText1.Hint;
end;

procedure TForm2b.CloseBttnClick(Sender: TObject);
begin
     Panel2.Visible := False;
     Panel3.Visible := False;
end;

procedure TForm2b.HandCraftNet (Sender : TObject);
var
   i, n, p_i, c : integer;
begin
  If (not OpenNetRequest) or
     ((OpenNetRequest) and (OpenDialog1.FileName = '') ) then
       Caption := 'New network';

  if (OpenNetRequest) and (OpenDialog1.FileName <> '') then
    begin
      Caption := 'Network - ' + OpenDialog1.FileName;
      SaveDialog1.FileName := OpenDialog1.FileName;
    end;

  EditTotInputs.Color := clWhite;
  EditTotNPEs.Color := clWhite;
  EditSigma.Color := clWhite;
  EditTau.Color := clWhite;
  EditKappa.Color := clWhite;
  EditAlpha.Color := clWhite;
  EditBeta.Color := clWhite;

  Exc_NPEs := 0;
  Inh_NPEs := 0;
  Tot_CA1_NPEs := 0;
  Tot_VTA1_NPEs := 0;
  Tot_VTA2_NPEs := 0;
  SA_NPEs := 0;
  MA_NPEs := 0;
  Tot_R_NPEs := 0;
  Tot_CR_UR1_NPEs := 0;
  Tot_CR_UR2_NPEs := 0;

  For n := 1 to Max_Elements do
    with NPE[n] do
      begin
        Net_Kind := -2;
        NPE_Kind := -2;

        LogisSigma := 0;
        Tau := 0;
        Kappa := 0;
        Alpha := 0;
        Beta := 0;

        SigmaStr := '';
        TauStr := '';
        KappaStr := '';
        AlphaStr := '';
        BetaStr := '';

        EditSigma.Text := '';
        EditTau.Text := '';
        EditKappa.Text := '';
        EditAlpha.Text := '';
        EditBeta.Text := '';

        PreInpNPEs := 0;
        PreInpWgts := 0;
        PostOutNPEs := 0;

        for p_i := 1 to Max_Pre_Inps do
          begin
            PreInput[p_i].Num := 0;
            PreInput[p_i].Weight := 0;
            PreInput[p_i].NumStr := '';
            PreInput[p_i].WgtStr := '';
          end;

        for p_i := 1 to Max_Post_Outs do
          begin
            PostOutput[p_i].Num := 0;
            PostOutput[p_i].Weight := 0;
            PostOutput[p_i].NumStr := '';
            PostOutput[p_i].WgtStr := '';
          end;

        Deleted := True;
      end;

  for p_i := 0 to Max_Pre_Inps-1 do
    begin
      FanInStringGrid.Cells[0,p_i] := '';
      FanInStringGrid.Cells[1,p_i] := '';
    end;

  For c := 1 to Max_NPEs * Max_pre_Inps do
    with connection[c] do
      begin
        pre := 0;
        post := 0;
        pre_str := '0';
        post_str := '0';
        w := 0;
        w_str := '0';
      end;

  tot_inputs := 1;
  tot_npes := 1;  { minimum number of NPEs possible }
  Cur_NPE := 2;
  Tot_Elements := 2;
  Tot_Connections := 1;

  SA_NPEs := 1;
  Exc_NPEs := 1;

  FanInStringGrid.Cells[0,0] := '1';
  FanInStringGrid.Cells[1,0] := '.01';

  Elements.Caption := '#S units + #NCUs: 2';
  statictext3.caption := '2';
  NextBttn.Enabled := False;
  BackBttn.Enabled := False;

  EditTotInputs.Text := '1';
  EditTotNPEs.Text := '1';

  NPE[1].Deleted := False;
  NPE[2].Deleted := False;
  NPE[1].Number := 1;
  NPE[2].Number := 2;
  NPE[1].NPE_Kind := 1;
  NPE[1].Net_Kind := 1;
  NPE[2].NPE_Kind := 0;
  NPE[2].Net_Kind := 1;

  NPE[1].PostOutNPEs := 1;
  NPE[1].PostOutput[1].Num := 2;
  NPE[1].PostOutput[1].NumStr := '2';
  NPE[1].PostOutput[1].Weight := 0.01;
  NPE[1].PostOutput[1].WgtStr := '.01';

  NPE[2].PreInpNPEs := 1;
  NPE[2].PreInpWgts := 1;
  NPE[2].PreInput[1].Num := 1;
  NPE[2].PreInput[1].NumStr := '1';
  NPE[2].PreInput[1].Weight := 0.01;
  NPE[2].PreInput[1].WgtStr := '.01';

  DelNPEBttn.Enabled := (Tot_Elements > 2) and (not NPE[cur_npe].deleted);

  sa.enabled := true;
  sa.checked := true;
  exc.enabled := true;
  exc.checked := true;

  Panel2.Visible := True;
  Panel3.Visible := True;

  FanInStringGrid.SetFocus;
  EditTotInputs.SetFocus;

  JustSaved := True;

  Bttn_Clicked := False;
  if (not bttn_clicked) then
     BuildHints(sender);
end;


procedure TForm2b.EditTotInputsChange(Sender: TObject);
Var
   prev_val, cur_val, Code, prev_te, p_i : Integer;
   txt, txt0, txt1, txt2, txt3, txt4 : String;

procedure RenumberElements;
var
  n, p_i, p_i_2, i, j, n2, r : Integer;
  txt, txt0, txt1, txt2, txt3, txt4 : String;
begin
  if Tot_Elements > prev_te then
    begin
      for n := Tot_Elements downto Tot_Inputs+1 do
        begin
          n2 := n-(Tot_Elements-prev_te);

          NPE[n].Number := n;
          NPE[n].NPE_Kind := NPE[n2].NPE_Kind;
          NPE[n].Net_Kind := NPE[n2].Net_Kind;

          NPE[n].SigmaStr := NPE[n2].SigmaStr;
          NPE[n].TauStr := NPE[n2].TauStr;
          NPE[n].KappaStr := NPE[n2].KappaStr;
          NPE[n].AlphaStr := NPE[n2].AlphaStr;
          NPE[n].BetaStr := NPE[n2].BetaStr;

          NPE[n].LogisSigma := NPE[n2].LogisSigma;
          NPE[n].Tau := NPE[n2].Tau;
          NPE[n].Kappa := NPE[n2].Kappa;
          NPE[n].Alpha := NPE[n2].Alpha;
          NPE[n].Beta := NPE[n2].Beta;

          NPE[n].PreInpNPEs := NPE[n2].PreInpNPEs;
          NPE[n].PreInpWgts := NPE[n2].PreInpWgts;
          NPE[n].PostOutNPEs := NPE[n2].PostOutNPEs;

          NPE[n].PreInput := NPE[n2].PreInput;
          NPE[n].PostOutput := NPE[n2].PostOutput;

          NPE[n].Deleted := NPE[n2].Deleted;
        end;

      for n := tot_inputs + 1 to Tot_Elements do
        for p_i := 1 to NPE[n].PreInpNPEs do
          if NPE[NPE[n].PreInput[p_i].Num].NPE_Kind <> 1 then
            begin
              NPE[n].PreInput[p_i].Num := NPE[n].PreInput[p_i].Num +
                                         (Tot_Elements - prev_te);

              NPE[n].PostOutput[p_i].Num := NPE[n].PostOutput[p_i].Num +
                                           (Tot_Elements - prev_te);

              str(NPE[n].PreInput[p_i].Num,NPE[n].PreInput[p_i].NumStr);
              str(NPE[n].PostOutput[p_i].Num,NPE[n].PostOutput[p_i].NumStr);
            end;

      for i := 1 to Tot_Inputs do
        begin
          NPE[i].Number := i;
          NPE[i].NPE_Kind := 1;
          NPE[i].Net_Kind := 1;
          NPE[i].PreInpNPEs := 0;
          NPE[i].PreInpWgts := 0;
          NPE[i].PostOutNPEs := 0;
          NPE[i].Deleted := False;
        end;
    end else
      begin
        for i := Tot_Inputs to prev_val do
          begin
            NPE[i].PostOutNPEs := 0;
            NPE[i].Deleted := True;
          end;

        for n := prev_val+1 to prev_te do
          for i := 1 to NPE[n].PreInpNPEs do
            if (NPE[NPE[n].PreInput[i].Num].Number > Tot_Inputs) and
               (NPE[NPE[n].PreInput[i].Num].NPE_Kind = 1) then
              begin
                NPE[n].PreInpNPEs := NPE[n].PreInpNPEs - 1;

                NPE[n].PreInput[i].NumStr := '';
                NPE[n].PreInput[i].WgtStr := '';

                NPE[n].PreInput[i].Num := 0;
                NPE[n].PreInput[i].Weight := 0.01;

                if n = cur_npe then
                  begin
                    FanInStringGrid.Cells[0,i-1] := '';
                    FanInStringGrid.Cells[1,i-1] := '';
                  end;
              end;

        for n := Tot_Inputs+1 to prev_te do
          begin
            n2 := n+(prev_val-Tot_Inputs);

            NPE[n].Number := n;
            NPE[n].NPE_Kind := NPE[n2].NPE_Kind;
            NPE[n].Net_Kind := NPE[n2].Net_Kind;

            NPE[n].SigmaStr := NPE[n2].SigmaStr;
            NPE[n].TauStr := NPE[n2].TauStr;
            NPE[n].KappaStr := NPE[n2].KappaStr;
            NPE[n].AlphaStr := NPE[n2].AlphaStr;
            NPE[n].BetaStr := NPE[n2].BetaStr;

            NPE[n].LogisSigma := NPE[n2].LogisSigma;
            NPE[n].Tau := NPE[n2].Tau;
            NPE[n].Kappa := NPE[n2].Kappa;
            NPE[n].Alpha := NPE[n2].Alpha;
            NPE[n].Beta := NPE[n2].Beta;

            NPE[n].PreInpNPEs := NPE[n2].PreInpNPEs;
            NPE[n].PreInpWgts := NPE[n2].PreInpWgts;
            NPE[n].PostOutNPEs := NPE[n2].PostOutNPEs;

            NPE[n].PreInput := NPE[n2].PreInput;
            NPE[n].PostOutput := NPE[n2].PostOutput;

            NPE[n].Deleted := NPE[n2].Deleted;
          end;

        for n := tot_inputs + 1 to Tot_Elements do
          for p_i := 1 to NPE[n].PreInpNPEs do
            if NPE[NPE[n].PreInput[p_i].Num].NPE_Kind <> 1 then
              begin
                NPE[n].PreInput[p_i].Num := NPE[n].PreInput[p_i].Num -
                                           (prev_te - Tot_Elements);

                NPE[n].PostOutput[p_i].Num := NPE[n].PostOutput[p_i].Num -
                                             (prev_te - Tot_Elements);

                str(NPE[n].PreInput[p_i].Num,NPE[n].PreInput[p_i].NumStr);
                str(NPE[n].PostOutput[p_i].Num,NPE[n].PostOutput[p_i].NumStr);
              end;

        for i := 1 to Tot_Inputs do
          begin
            NPE[i].Number := i;
            NPE[i].NPE_Kind := 1;
            NPE[i].Net_Kind := 1;
            NPE[i].PreInpNPEs := 0;
            NPE[i].PreInpWgts := 0;
            NPE[i].PostOutNPEs := 0;
            NPE[i].Deleted := False;
          end;
      end;
end;

begin
  prev_val := Tot_Inputs;

  Val(EditTotInputs.Text,cur_val,Code);

  if (code <> 0) and (EditTotInputs.Text <> '')  then
    begin
      MessageDlg('Only whole positive numeric values.', mtError, [mbOk],0);
      str(tot_inputs,txt);
      EditTotInputs.Text := txt;
      EditTotInputs.SetFocus;
    end else
      begin
        if (cur_val < 1) then
          Tot_Inputs := 1;

        if (cur_val > Max_Inputs) then
          Tot_Inputs := Max_Inputs;

        if (cur_val >= 1) and (cur_val <= Max_Inputs) then
          Tot_Inputs := cur_val;

        str(tot_inputs,txt);
        EditTotInputs.Text := txt;

        if cur_NPE < Tot_Inputs + 1 then
          cur_NPE := Tot_Inputs + 1;

        if cur_npe > tot_npes + tot_inputs then
          cur_npe := tot_npes + tot_inputs;

        if (cur_npe < tot_npes + tot_inputs) and (Tot_NPEs > 1) then
          NextBttn.Enabled := True;

        if (cur_npe > Tot_Inputs + 1) and (Tot_NPEs > 1) then
          BackBttn.Enabled := True;
      end;

  prev_te := tot_elements;
  Tot_Elements := Tot_Inputs + Tot_NPEs;
  str(tot_elements,txt);
  Elements.Caption := '#S units + #NCUs: ' + txt;

  if tot_elements > Max_Elements then
    begin
      MessageDlg('Too many elements: Max = 255.', mtError, [mbOk],0);
      str(prev_val,txt);
      EditTotInputs.Text := txt;
      EditTotInputs.SetFocus;
    end;

  if tot_elements <> prev_te then
    RenumberElements;

  str(npe[cur_npe].Number,txt);
  statictext3.caption := txt;

  if cur_val <> prev_val then
    begin
      JustSaved := False;
      EditTotInputs.Color := clYellow
    end else
      EditTotInputs.Color := clWhite;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.EditTotNPEsChange(Sender: TObject);
Var
   i, Code, n, te, prev_val, cur_val: Integer;
   txt : string[3];
begin
  prev_val := Tot_NPEs;
  Val(EditTotNPEs.Text,cur_val,Code);

  if code <> 0 then
    begin
      MessageDlg('Only whole positive numeric values.', mtError, [mbOk],0);
      str(Tot_NPEs,txt);
      EditTotNPEs.Text := txt;
      EditTotNPEs.SetFocus;
    end else
       begin
         if cur_val < 1 then
            Tot_NPEs := 1;

         if cur_val > Max_Elements then
           Tot_NPEs := Max_NPEs;

         if (cur_val >= 1) and (cur_val <= Max_Elements) then
           Tot_NPEs := cur_val;

         Str(Tot_NPEs,txt);
         EditTotNPEs.Text := txt;

         if (cur_npe > tot_NPEs + tot_inputs) then
           begin
             cur_npe := tot_NPEs + tot_inputs;
             str(npe[cur_npe].number,txt);
             statictext3.caption := txt;
             NextBttn.Enabled := False;

             DefParBttn.Enabled := not NPE[Cur_NPE].Deleted;
             DelNPEBttn.Enabled := not NPE[Cur_NPE].Deleted;
             RecNPEBttn.Enabled := NPE[Cur_NPE].Deleted;

             EditSigma.Enabled := not NPE[Cur_NPE].Deleted;
             EditTau.Enabled := not NPE[Cur_NPE].Deleted;
             EditKappa.Enabled := not NPE[Cur_NPE].Deleted;
             EditAlpha.Enabled := not NPE[Cur_NPE].Deleted;
             EditBeta.Enabled := not NPE[Cur_NPE].Deleted;

             sa.enabled := not NPE[Cur_NPE].Deleted;
             ma.enabled := not NPE[Cur_NPE].Deleted;
             exc.enabled := not NPE[Cur_NPE].Deleted;
             inh.enabled := not NPE[Cur_NPE].Deleted;
             ca1.enabled := not NPE[Cur_NPE].Deleted;
             vta1.enabled := not NPE[Cur_NPE].Deleted;
             operant.enabled := not NPE[Cur_NPE].Deleted;
             respondent1.enabled := not NPE[Cur_NPE].Deleted;
            { respondent2.enabled := not NPE[Cur_NPE].Deleted;}

             StaticText8.Enabled := not NPE[Cur_NPE].Deleted;
             StaticText3.Enabled := not NPE[Cur_NPE].Deleted;
           end;

         if (Tot_NPEs > prev_val) then
           NextBttn.Enabled := True;

         if (Tot_NPEs + Tot_Inputs < prev_val) then
           if cur_npe > Tot_NPEs + tot_inputs then
             begin
               cur_npe := Tot_NPEs + tot_inputs;
               Str(npe[cur_npe].number,txt);
               statictext3.caption := txt;
               NextBttn.Enabled := False;
               BackBttn.Enabled := True;

               DefParBttn.Enabled := not NPE[Cur_NPE].Deleted;
               DelNPEBttn.Enabled := not NPE[Cur_NPE].Deleted;
               RecNPEBttn.Enabled := NPE[Cur_NPE].Deleted;

               EditSigma.Enabled := not NPE[Cur_NPE].Deleted;
               EditTau.Enabled := not NPE[Cur_NPE].Deleted;
               EditKappa.Enabled := not NPE[Cur_NPE].Deleted;
               EditAlpha.Enabled := not NPE[Cur_NPE].Deleted;
               EditBeta.Enabled := not NPE[Cur_NPE].Deleted;

               sa.enabled := not NPE[Cur_NPE].Deleted;
               ma.enabled := not NPE[Cur_NPE].Deleted;
               exc.enabled := not NPE[Cur_NPE].Deleted;
               inh.enabled := not NPE[Cur_NPE].Deleted;
               ca1.enabled := not NPE[Cur_NPE].Deleted;
               vta1.enabled := not NPE[Cur_NPE].Deleted;
               operant.enabled := not NPE[Cur_NPE].Deleted;
               respondent1.enabled := not NPE[Cur_NPE].Deleted;
               {respondent2.enabled := not NPE[Cur_NPE].Deleted;}

               StaticText8.Enabled := not NPE[Cur_NPE].Deleted;
               StaticText3.Enabled := not NPE[Cur_NPE].Deleted;
             end;

         if tot_npes = 1 then
            begin
                 NextBttn.Enabled := False;
                 BackBttn.Enabled := False;
                 DelNPEBttn.Enabled := False;
                 RecNPEBttn.Enabled := False;
            end;
       end;

  te := Tot_Elements;
  Tot_Elements := Tot_Inputs + Tot_NPEs;
  str(tot_elements,txt);
  Elements.Caption := '#S units + #NPUs: ' + txt;

  if tot_elements > Max_Elements then
    begin
      MessageDlg('Too many elements: Max = 255.', mtError, [mbOk],0);
      str(prev_val,txt);
      EditTotNPEs.Text := txt;
      EditTotNPEs.SetFocus;
    end;

  if tot_elements  > te then
    for i := te+1 to Tot_Elements do
      begin
        NPE[i].Number := i;
        NPE[i].Deleted := False;
      end;

  if cur_val <> prev_val then
    begin
      JustSaved := False;
      EditTotNPEs.Color := clYellow
    end else
      EditTotNPEs.Color := clWhite;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.EditSigmaChange(Sender: TObject);
Var
   prev_val, cur_val : Extended;
   code : Integer;
begin
     prev_sigma_str := NPE[cur_npe].SigmaStr;
     prev_val := NPE[cur_NPE].LogisSigma;
     Val(EditSigma.Text,cur_val,code);

     if ((code <> 0) or (EditSigma.Text = '.')) and
        (EditSigma.Text <> '') then
        begin
             MessageDlg('Only numeric values between 0 and 1.', mtError, [mbOk],0);
             EditSigma.Text := prev_sigma_str;
             EditSigma.SetFocus;
        end else
           begin
                if (cur_val < 0) then
                   begin
                        Cur_Val := 0;
                        EditSigma.Text := '0';
                   end;

                if (cur_val > 1) then
                   begin
                        Cur_Val := 1;
                        EditSigma.Text := '1';
                   end;

                NPE[Cur_NPE].LogisSigma := cur_val;
                NPE[Cur_NPE].SigmaStr := EditSigma.Text;

                cur_sigma_str := EditSigma.Text;
           end;

     if (cur_sigma_str <> prev_sigma_str) then
        begin
             JustSaved := False;
             EditSigma.Color := clYellow
        end else
            EditSigma.Color := clWhite;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.EditTauChange(Sender: TObject);
Var
   prev_val, cur_val : extended;
   code : Integer;
begin
     prev_tau_str := NPE[cur_npe].TauStr;
     prev_val := NPE[cur_NPE].Tau;
     Val(EditTau.Text,cur_val,code);

     if ((code <> 0) or (EditTau.Text = '.')) and
        (EditTau.Text <> '') then
        begin
             MessageDlg('Only numeric values between 0 and 1.', mtError, [mbOk],0);
             EditTau.Text := prev_Tau_str;
             EditTau.SetFocus;
        end else
           begin
                if (cur_val < 0) then
                   begin
                        Cur_Val := 0;
                        EditTau.Text := '0';
                   end;

                if (cur_val > 1) then
                   begin
                        Cur_Val := 1;
                        EditTau.Text := '1';
                   end;

                NPE[Cur_NPE].Tau := cur_val;
                NPE[Cur_NPE].TauStr := EditTau.Text;

                cur_Tau_str := EditTau.Text;
           end;

     if (cur_Tau_str <> prev_Tau_str) then
        begin
             JustSaved := False;
             EditTau.Color := clYellow
        end else
            EditTau.Color := clWhite;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.EditKappaChange(Sender: TObject);
Var
   prev_val, cur_val : extended;
   code : Integer;
begin
     prev_Kappa_str := NPE[cur_npe].KappaStr;
     prev_val := NPE[cur_NPE].Kappa;
     Val(EditKappa.Text,cur_val,code);

     if ((code <> 0) or (EditKappa.Text = '.')) and
        (EditKappa.Text <> '') then
        begin
             MessageDlg('Only numeric values between 0 and 1.', mtError, [mbOk],0);
             EditKappa.Text := prev_Kappa_str;
             EditKappa.SetFocus;
        end else
           begin
                if (cur_val < 0) then
                   begin
                        Cur_Val := 0;
                        EditKappa.Text := '0';
                   end;

                if (cur_val > 1) then
                   begin
                        Cur_Val := 1;
                        EditKappa.Text := '1';
                   end;

                NPE[Cur_NPE].Kappa := cur_val;
                NPE[Cur_NPE].KappaStr := EditKappa.Text;

                cur_Kappa_str := EditKappa.Text;
           end;

     if (cur_Kappa_str <> prev_Kappa_str) then
        begin
             JustSaved := False;
             EditKappa.Color := clYellow
        end else
            EditKappa.Color := clWhite;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.EditAlphaChange(Sender: TObject);
Var
   cur_val, prev_val : extended;
   code : Integer;
begin
     prev_Alpha_str := NPE[cur_npe].AlphaStr;
     prev_val := NPE[cur_NPE].Alpha;
     Val(EditAlpha.Text,cur_val,code);

     if ((code <> 0) or (EditAlpha.Text = '.')) and
        (EditAlpha.Text <> '') then
        begin
             MessageDlg('Only numeric values between 0 and 1.', mtError, [mbOk],0);
             EditAlpha.Text := prev_Alpha_str;
             EditAlpha.SetFocus;
        end else
           begin
                if (cur_val < 0) then
                   begin
                        Cur_Val := 0;
                        EditAlpha.Text := '0';
                   end;

                if (cur_val > 1) then
                   begin
                        Cur_Val := 1;
                        EditAlpha.Text := '1';
                   end;

                NPE[Cur_NPE].Alpha := cur_val;
                NPE[Cur_NPE].AlphaStr := EditAlpha.Text;

                cur_Alpha_str := EditAlpha.Text;
           end;

     if (cur_Alpha_str <> prev_Alpha_str) then
        begin
             JustSaved := False;
             EditAlpha.Color := clYellow
        end else
            EditAlpha.Color := clWhite;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.EditBetaChange(Sender: TObject);
Var
   prev_val, cur_val : extended;
   code : Integer;
begin
     prev_Beta_str := NPE[cur_npe].BetaStr;
     prev_val := NPE[cur_NPE].Beta;
     Val(EditBeta.Text,cur_val,code);

     if ((code <> 0) or (EditBeta.Text = '.')) and
        (EditBeta.Text <> '') then
        begin
             MessageDlg('Only numeric values between 0 and 1.', mtError, [mbOk],0);
             EditBeta.Text := prev_Beta_str;
             EditBeta.SetFocus;
        end else
           begin
                if (cur_val < 0) then
                   begin
                        Cur_Val := 0;
                        EditBeta.Text := '0';
                   end;

                if (cur_val > 1) then
                   begin
                        Cur_Val := 1;
                        EditBeta.Text := '1';
                   end;

                NPE[Cur_NPE].Beta := cur_val;
                NPE[Cur_NPE].BetaStr := EditBeta.Text;

                cur_Beta_str := EditBeta.Text;
           end;

     if (cur_Beta_str <> prev_Beta_str) then
        begin
             JustSaved := False;
             EditBeta.Color := clYellow
        end else
            EditBeta.Color := clWhite;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.FanInStringGridExit(Sender: TObject);
var
  r, r2, k, i, j, p_i, p_i_2, n,
  value1, value2, value3,
  code1, code2, code3,
  x, y, col, row : Integer;

  txt0, txt1, txt2, txt3, txt4, txt : String;
begin
  for r := 0 to FanInStringGrid.RowCount-1 do
    begin
      txt1 := FanInStringGrid.Cells[0,r];
      txt2 := FanInStringGrid.Cells[1,r];

      val(txt1,value1,code1);

      if code1 <> 0 then
        begin
          i := 0;

          Repeat
            i := i + 1;

            val(copy(txt1,i,1),value3,code3);

            if (code3 <> 0) then
              begin
                delete(txt1,i,1);
                i := i - 1;
              end;
          until i >= Length(txt1);

          FanInStringGrid.Cells[0,r] := txt1;
        end;

      val(FanInStringGrid.Cells[0,r],value1,code1);
      if (value1 < 1) or
         (value1 = NPE[cur_npe].Number) or
         (value1 > Tot_Elements) then
         FanInStringGrid.Cells[0,r] := '';

      val(txt2,value2,code2);

      if code2 <> 0 then
        begin
          i := 0;

          Repeat
            i := i + 1;

            val(copy(txt2,i,1),value3,code3);

            if (code3 <> 0) and (copy(txt2,i,1) <> '.') then
              begin
                delete(txt2,i,1);
                i := i - 1;
              end;
          until  i >= Length(txt2);

          FanInStringGrid.Cells[1,r] := txt2;
        end;

      val(FanInStringGrid.Cells[1,r],value1,code1);
      if (value1 < 0) or
         (value1 > 1) or
         (FanInStringGrid.Cells[0,r] = '') then
         FanInStringGrid.Cells[1,r] := '';

      with NPE[cur_npe] do
        if FanInStringGrid.Cells[0,r] <> '' then
          begin
            PreInput[r+1].NumStr := FanInStringGrid.Cells[0,r];

            if FanInStringGrid.Cells[1,r] = '' then
              begin
                FanInStringGrid.Cells[1,r] := '.01';
                PreInput[r+1].WgtStr := '.01';
              end;

            PreInput[r+1].WgtStr := FanInStringGrid.Cells[1,r];
        end else
          begin
            PreInput[r+1].NumStr := '';
            PreInput[r+1].WgtStr := '';
            FanInStringGrid.Cells[1,r] := '';
          end;
    end;

{ deletes blank cells }
  FanInStringGrid.ColCount := 4;
  for r := 0 to FanInStringGrid.RowCount-1 do
    begin
      FanInStringGrid.Cells[2,r] := '';
      FanInStringGrid.Cells[3,r] := '';
    end;

  r2 := 0;
  for r := 0 to FanInStringGrid.RowCount-1 do
    if FanInStringGrid.Cells[0,r] <> '' then
      begin
        FanInStringGrid.Cells[2,r2] := FanInStringGrid.Cells[0,r];
        FanInStringGrid.Cells[3,r2] := FanInStringGrid.Cells[1,r];
        r2 := r2 + 1;
      end;

  for r := 0 to FanInStringGrid.RowCount-1 do
    begin
      FanInStringGrid.Cells[0,r] := FanInStringGrid.Cells[2,r];
      FanInStringGrid.Cells[1,r] := FanInStringGrid.Cells[3,r];
    end;

  FanInStringGrid.ColCount := 2;

{ deletes repeated presynaptic inputs }
  for r := 0 to FanInStringGrid.RowCount-1 do
    for r2 := r+1 to FanInStringGrid.RowCount-1 do
      if (FanInStringGrid.Cells[0,r2] = FanInStringGrid.Cells[0,r]) then
        begin
          FanInStringGrid.Cells[0,r2] := '';
          FanInStringGrid.Cells[1,r2] := '';
        end;

  with NPE[cur_NPE] do
    for p_i := 1 to Max_Pre_Inps do
      for i := p_i+1 to Max_Pre_Inps do
        if (PreInput[p_i].NumStr = PreInput[i].NumStr) then
          begin
            PreInput[i].NumStr := '';
            PreInput[i].WgtStr := '';
          end;

    with NPE[cur_npe] do
      begin
        PreInpNPEs := 0;

        For i := 1 to Max_Pre_Inps do
          if PreInput[i].NumStr <> '' then
            begin
              PreInpNPEs := PreInpNPEs + 1;
              PreInput[PreInpNPEs].NumStr := PreInput[i].NumStr;
              PreInput[PreInpNPEs].WgtStr := PreInput[i].WgtStr;

              Val(PreInput[PreInpNPEs].NumStr,
                  PreInput[PreInpNPEs].Num,
                  code1);

              Val(PreInput[PreInpNPEs].WgtStr,
                  PreInput[PreInpNPEs].Weight,
                  code1);
            end;
      end;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.EditTotInputsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditTotInputs.Text <> '' then
                      EditTotInputs.Color := clYellow
                   else
                       EditTotInputs.Color := clWhite;

                   EditTotInputsChange(sender);
              end;

          33: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE > Tot_Inputs+1) then
                  BackBttnClick(sender);

          34: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE < Tot_NPEs+Tot_Inputs) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm2b.EditTotNPEsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditTotNPEs.Text <> '' then
                      EditTotNPEs.Color := clYellow
                   else
                       EditTotNPEs.Color := clWhite;

                   EditTotNPEsChange(sender);
              end;

          33: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE > Tot_Inputs+1) then
                  BackBttnClick(sender);

          34: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE < Tot_NPEs+Tot_Inputs) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm2b.EditSigmaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: if EditSigma.Text <> '' then
                 begin
                      EditSigma.Color := clYellow;
                      EditSigmaChange(sender)
                 end else
                     EditSigma.Color := clWhite;

          33: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE > Tot_Inputs+1) then
                  BackBttnClick(sender);

          34: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE < Tot_NPEs+Tot_Inputs) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm2b.EditTauKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   EditTau.Color := clYellow;
                   EditTauChange(sender);
              end;

          33: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE > Tot_Inputs+1) then
                  BackBttnClick(sender);

          34: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE < Tot_NPEs+Tot_Inputs) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm2b.EditKappaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   EditKappa.Color := clYellow;
                   EditKappaChange(sender);
              end;

          33: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE > Tot_Inputs+1) then
                  BackBttnClick(sender);

          34: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE < Tot_NPEs+Tot_Inputs) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm2b.EditAlphaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   EditAlpha.Color := clYellow;
                   EditAlphaChange(sender);
              end;

          33: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE > Tot_Inputs+1) then
                  BackBttnClick(sender);

          34: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE < Tot_NPEs+Tot_Inputs) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm2b.EditBetaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   EditBeta.Color := clYellow;
                   EditBetaChange(sender);
              end;

          33: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE > Tot_Inputs+1) then
                  BackBttnClick(sender);

          34: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE < Tot_NPEs+Tot_Inputs) then
                  NextBttnClick(sender);
     end{case};
end;


procedure TForm2b.FanInStringGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  r : Integer;
begin
  with FanInStringGrid do
    with NPE[cur_npe] do
      Case Key of
        13: if Row < RowCount-1 then
               Row := Row + 1;

        45: if cells[0,RowCount-1] = '' then
              begin
                for r := RowCount-2 downto Row do
                  begin
                    Cells[0,r+1] := Cells[0,r];
                    Cells[1,r+1] := Cells[1,r];

                    PreInput[r+2].NumStr := PreInput[r+1].NumStr;
                    PreInput[r+2].WgtStr := PreInput[r+1].WgtStr;
                end;

              Cells[0,Row] := '';
              Cells[1,Row] := '';

              PreInput[row+1].NumStr := '';
              PreInput[row+1].WgtStr := '';
            end;
     end{case};
end;


procedure TForm2b.EditTotInputsChCl(Sender: TObject);
begin
     EditTotInputs.Color := clWhite;
end;

procedure TForm2b.EditTotNPEsChCl(Sender: TObject);
begin
     EditTotNPEs.Color := clWhite;
end;

procedure TForm2b.EditSigmaChCl(Sender: TObject);
begin
     EditSigma.Color := clWhite;
end;

procedure TForm2b.EditTauChCl(Sender: TObject);
begin
     EditTau.Color := clWhite;
end;

procedure TForm2b.EditKappaChCl(Sender: TObject);
begin
     EditKappa.Color := clWhite;
end;

procedure TForm2b.EditAlphaChCl(Sender: TObject);
begin
     EditAlpha.Color := clWhite;
end;

procedure TForm2b.EditBetaChCl(Sender: TObject);
begin
     EditBeta.Color := clWhite;
end;


procedure TForm2b.CorticalClick(Sender: TObject);
begin
     if not NPE[cur_NPE].Deleted then
        begin
             sa.enabled := true;
             ma.enabled := true;
             exc.enabled := true;
             inh.enabled := true;
             ca1.enabled := false;
             vta1.enabled := false;
             operant.enabled := false;
             respondent1.enabled := false;
             respondent2.enabled := false;
        end;
end;

procedure TForm2b.subcorticalClick(Sender: TObject);
begin
     if not NPE[cur_NPE].Deleted then
        begin
             sa.enabled := false;
             ma.enabled := false;
             exc.enabled := false;
             inh.enabled := false;
             ca1.enabled := true;
             vta1.enabled := true;
             operant.enabled := false;
             respondent1.enabled := false;
             respondent2.enabled := false;
        end;
end;

procedure TForm2b.outputClick(Sender: TObject);
begin
     if not NPE[cur_NPE].Deleted then
        begin
             sa.enabled := false;
             ma.enabled := false;
             exc.enabled := false;
             inh.enabled := false;
             ca1.enabled := false;
             vta1.enabled := false;
             operant.enabled := true;
             respondent1.enabled := true;
            { respondent2.enabled := true;    }
        end;
end;

procedure TForm2b.GroupBox7Click(Sender: TObject);
begin
     if not NPE[cur_NPE].Deleted then
        corticalclick(sender);
end;


procedure TForm2b.GroupBox10Click(Sender: TObject);
begin
     if not NPE[cur_NPE].Deleted then
        corticalclick(sender);
end;


procedure TForm2b.saClick(Sender: TObject);
begin
     NPE[Cur_NPE].Net_Kind := 1;

     ca1.checked := false;
     ma.Checked := false;
     vta1.checked := false;
     vta2.Checked := false;
     operant.checked := false;
     respondent1.checked := false;
     respondent2.checked := false;
     exc.enabled := true;
     inh.enabled := true;

     JustSaved := False;

     BuildHints(sender);
end;


procedure TForm2b.maClick(Sender: TObject);
begin
  NPE[Cur_NPE].Net_Kind := 2;
  JustSaved := False;

  sa.Checked := false;
  ca1.checked := false;
  vta1.checked := false;
  vta2.Checked := false;
  operant.checked := false;
  respondent1.checked := false;
  respondent2.checked := false;
  exc.enabled := true;
  inh.enabled := true;

  JustSaved := False;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.excClick(Sender: TObject);
begin
  NPE[Cur_NPE].NPE_Kind := 0;

  ca1.checked := false;
  vta1.checked := false;
  operant.checked := false;
  respondent1.checked := false;
{  respondent2.checked := false;}

  JustSaved := False;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.inhClick(Sender: TObject);
begin
  NPE[Cur_NPE].NPE_Kind := -1;

  ca1.checked := false;
  vta1.checked := false;
  vta2.Checked := false;
  operant.checked := false;
  respondent1.checked := false;
  respondent2.checked := false;

  JustSaved := False;

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.ca1Click(Sender: TObject);
begin
   NPE[Cur_NPE].Net_Kind := 1;
   NPE[Cur_NPE].NPE_Kind := 3;

   ma.checked := false;
   vta1.checked := false;
   vta2.checked := false;
   exc.enabled := false;
   inh.enabled := false;
   operant.checked := false;
   respondent1.checked := false;
   respondent2.checked := false;

   JustSaved := False;

   if (tot_ca1_NPEs + tot_vta1_NPEs + tot_vta2_NPEs < Max_Disc_NPEs) then
     Tot_ca1_NPEs := Tot_ca1_NPEs + 1
   else
     MessageDlg('Too many discrepancy NCUs.  Maximum = 25.',
                 mtError,[mbCancel],0);

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.vta1Click(Sender: TObject);
begin
   NPE[Cur_NPE].Net_Kind := 2;
   NPE[Cur_NPE].NPE_Kind := 4;

   sa.checked := false;
   ma.checked := false;
   ca1.checked := false;
   operant.checked := false;
   respondent1.checked := false;
   respondent2.checked := false;

   exc.enabled := false;
   inh.enabled := false;

   JustSaved := False;

   if tot_ca1_NPEs + tot_vta1_NPEs < Max_Disc_NPEs then
     Tot_vta1_NPEs := Tot_vta1_NPEs + 1
   else
     MessageDlg('Too many discrepancy NCUs.  Maximum = 25.',
                 mtError,[mbCancel],0);

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.OperantClick(Sender: TObject);
begin
   NPE[Cur_NPE].Net_Kind := 2;
   NPE[Cur_NPE].NPE_Kind := 5;

   sa.checked := false;
   ma.checked := false;
   ca1.checked := false;
   vta1.checked := false;
   vta2.Checked := false;
   respondent1.Checked := false;
   respondent2.Checked := false;

   exc.enabled := false;
   inh.enabled := false;

   JustSaved := False;

   if tot_R_NPEs + tot_CR_UR1_NPEs + tot_CR_UR2_NPEs < Max_Outputs then
     Tot_R_NPEs := Tot_R_NPEs + 1
   else
     MessageDlg('Too many output NCUs.  Maximum = 25.',
                 mtError,[mbCancel],0);

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.Respondent1Click(Sender: TObject);
begin
   NPE[Cur_NPE].Net_Kind := 2;
   NPE[Cur_NPE].NPE_Kind := 6;

   sa.checked := false;
   ma.checked := false;
   ca1.checked := false;
   vta1.checked := false;
   vta2.Checked := false;

   exc.enabled := false;
   inh.enabled := false;

   JustSaved := False;

   if tot_R_NPEs + tot_CR_UR1_NPEs + tot_CR_UR2_NPEs < Max_Outputs then
     Tot_CR_UR1_NPEs := Tot_CR_UR1_NPEs + 1
   else
     MessageDlg('Too many output NCUs.  Maximum = 30.',
                 mtError,[mbCancel],0);

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.Respondent2Click(Sender: TObject);
begin
   NPE[Cur_NPE].Net_Kind := 2;
   NPE[Cur_NPE].NPE_Kind := 7;

   sa.checked := false;
   ma.checked := false;
   ca1.checked := false;
   vta1.checked := false;
   vta2.Checked := false;

   exc.enabled := false;
   inh.enabled := false;

   JustSaved := False;

   if tot_R_NPEs + tot_CR_UR1_NPEs + tot_CR_UR2_NPEs < Max_Outputs then
     Tot_CR_UR2_NPEs := Tot_CR_UR2_NPEs + 1
   else
     MessageDlg('Too many output NCUs.  Maximum = 30.',
                 mtError,[mbCancel],0);

  if not bttn_clicked then
    BuildHints(sender);
end;


procedure TForm2b.NextBttnClick(Sender: TObject);
var
   txt, txt2, txt3 : string;
   p_i, code, i, j : integer;
begin
     bttn_clicked := true;

     EditTotInputs.Color := clWhite;
     EditTotNPEs.Color := clWhite;
     EditSigma.Color := clWhite;
     EditTau.Color := clWhite;
     EditKappa.Color := clWhite;
     EditAlpha.Color := clWhite;
     EditBeta.Color := clWhite;
     FanInStringGrid.Color := clWhite;

     EditTotInputsChange(sender);
     EditTotNPEsChange(sender);
     EditSigmaChange(sender);
     EditTauChange(sender);
     EditKappaChange(sender);
     EditAlphaChange(sender);
     EditBetaChange(sender);
     FanInStringGridExit(Sender);

     if (sa.checked) then
        NPE[Cur_NPE].Net_Kind := 1;

     if (ma.checked) then
        NPE[Cur_NPE].Net_Kind := 2;

     if (exc.checked) then
        NPE[Cur_NPE].NPE_Kind := 0;

     if (inh.checked) then
        NPE[Cur_NPE].NPE_Kind := -1;

     if (ca1.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 1;
             NPE[Cur_NPE].NPE_Kind := 3;
        end;

     if (vta1.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 4;
        end;

     if (vta2.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 8;
        end;

     if (operant.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 5;
        end;

     if (respondent1.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 6;
        end;

     if (respondent2.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 7;
        end;

     UncheckAllTypeButtons(sender);

     Cur_NPE := Cur_NPE + 1;
     BuildHints(sender);

     Str(npe[cur_npe].number,txt);
     statictext3.caption := txt;

     StaticText8.Enabled := not NPE[Cur_NPE].Deleted;
     StaticText3.Enabled := not NPE[Cur_NPE].Deleted;

     if Cur_NPE >= Tot_Elements then
        NextBttn.Enabled := False;

     if (cur_npe < Tot_NPEs + Tot_Inputs) and
        (cur_npe > Tot_Inputs + 1) then
        begin
             NextBttn.Enabled := True;
             BackBttn.Enabled := true;
        end;

     EditSigma.Text := NPE[Cur_NPE].SigmaStr;
     EditTau.Text := NPE[Cur_NPE].TauStr;
     EditKappa.Text := NPE[Cur_NPE].KappaStr;
     EditAlpha.Text := NPE[Cur_NPE].AlphaStr;
     EditBeta.Text := NPE[Cur_NPE].BetaStr;

     EditSigma.Enabled := not NPE[Cur_NPE].Deleted;
     EditTau.Enabled := not NPE[Cur_NPE].Deleted;
     EditKappa.Enabled := not NPE[Cur_NPE].Deleted;
     EditAlpha.Enabled := not NPE[Cur_NPE].Deleted;
     EditBeta.Enabled := not NPE[Cur_NPE].Deleted;

     DefParBttn.Enabled := not NPE[Cur_NPE].Deleted;

     for p_i := 0 to FanInStringGrid.RowCount - 1 do
       begin
         FanInStringGrid.Cells[0,p_i] := '';
         FanInStringGrid.Cells[1,p_i] := '';
       end;

     for p_i := 0 to FanInStringGrid.RowCount - 1 do
       begin
         FanInStringGrid.Cells[0,p_i] := NPE[Cur_NPE].
                                         PreInput[p_i+1].NumStr;

         FanInStringGrid.Cells[1,p_i] := NPE[Cur_NPE].
                                         PreInput[p_i+1].WgtStr;
       end;

     FanInStringGrid.Enabled := not NPE[Cur_NPE].Deleted;

     if (not FanInStringGrid.Enabled) then
        FanInStringGrid.Font.Color := clSilver
     else
        FanInStringGrid.Font.Color := clBlack;

     if NPE[Cur_NPE].Net_Kind <> -2 then
       case NPE[Cur_NPE].Net_Kind of
           1: begin
                exc.enabled := true;
                inh.enabled := true;
                sa.checked := true;      (*this one*)
                ma.checked := false;
                vta1.checked := false;
                vta2.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;

           2: begin
                exc.enabled := true;
                inh.enabled := true;
                sa.checked := false;
                ma.checked := true;     (*this one*)
                ca1.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;
       end{case};

     if NPE[Cur_NPE].NPE_Kind <> -2 then
         case NPE[Cur_NPE].NPE_Kind of
             -1: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   inh.checked := true; (*this one*)

                   ca1.enabled := false;
                   ca1.checked := false;
                   vta1.enabled := false;
                   vta1.checked := false;
                   vta2.Enabled := false;
                   vta2.Checked := false;
                   operant.enabled := false;
                   operant.checked := false;
                   respondent1.enabled := false;
                   respondent1.checked := false;
                   respondent2.enabled := false;
                   respondent2.checked := false;
                 end;

              0: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   exc.checked := true;       (*this one*)

                   ca1.enabled := true;
                   ca1.checked := false;
                   vta1.enabled := true;
                   vta1.checked := false;
                   vta2.Enabled := true;
                   vta2.Checked := false;
                   operant.enabled := true;
                   operant.checked := false;
                   respondent1.enabled := true;
                   respondent1.checked := false;
                   respondent2.enabled := true;
                   respondent2.checked := false;
                 end;

              3: begin
                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;

                   ca1.enabled := true;
                   ca1.checked := true; (*this one*)
                   ma.checked := false;
                   vta1.enabled := true;
                   vta1.checked := false;
                   vta2.Enabled := true;
                   vta2.Checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;
                 end;

              4: begin
                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;

                   sa.checked := false;
                   ca1.checked := false;
                   vta1.checked := true;            (*this one*)
                   vta2.Checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;
                 end;

              5: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.Checked := false;
                   operant.checked := true;         (*this one*)
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              6: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.Checked := false;
                   operant.checked := false;
                   respondent1.checked := true;     (*this one*)
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              7: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.Checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := true; (*this one*)

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              8: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.Checked := true;         (*this one*)
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;
         end{case} else
            begin
              sa.checked := false;
              ma.checked := false;
              exc.checked := false;
              inh.checked := false;
              ca1.checked := false;
              vta1.checked := false;
              vta2.Checked := false;
              operant.checked := false;
              respondent1.checked := false;
              respondent2.checked := false;
            end;

     if NPE[Cur_NPE].Deleted then
        begin
             FanInStringGrid.Font.Color := clSilver;
             sa.enabled := False;
             ma.enabled := False;
             exc.enabled := False;
             inh.enabled := False;
             ca1.enabled := False;
             vta1.enabled := False;
             vta2.Enabled := false;
             operant.enabled := False;
             respondent1.enabled := False;
             respondent2.enabled := False;
        end;

     DelNPEBttn.Enabled := not NPE[Cur_NPE].Deleted;
     RecNPEBttn.Enabled := NPE[Cur_NPE].Deleted;

     bttn_clicked := false;
end;


procedure TForm2b.BackBttnClick(Sender: TObject);
var
   txt, txt2, txt3 : string;
   p_i, i, j : integer;
   code : integer;
begin
     bttn_clicked := true;

     EditTotInputs.Color := clWhite;
     EditTotNPEs.Color := clWhite;
     EditSigma.Color := clWhite;
     EditTau.Color := clWhite;
     EditKappa.Color := clWhite;
     EditAlpha.Color := clWhite;
     EditBeta.Color := clWhite;
     FanInStringGrid.Color := clWhite;

     EditTotInputsChange(sender);
     EditTotNPEsChange(sender);
     EditSigmaChange(sender);
     EditTauChange(sender);
     EditKappaChange(sender);
     EditAlphaChange(sender);
     EditBetaChange(sender);
     FanInStringGridExit(Sender);

     if (sa.checked) then
        NPE[Cur_NPE].Net_Kind := 1;

     if (ma.checked) then
        NPE[Cur_NPE].Net_Kind := 2;

     if (exc.checked) then
        NPE[Cur_NPE].NPE_Kind := 0;

     if (inh.checked) then
        NPE[Cur_NPE].NPE_Kind := -1;

     if (ca1.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 1;
             NPE[Cur_NPE].NPE_Kind := 3;
        end;

     if (vta1.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 4;
        end;

     if (vta2.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 8;
        end;

     if (operant.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 5;
        end;

     if (respondent1.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 6;
        end;

     if (respondent2.checked) then
        begin
             NPE[Cur_NPE].Net_Kind := 2;
             NPE[Cur_NPE].NPE_Kind := 7;
        end;

     UncheckAllTypeButtons(sender);

     Cur_NPE := Cur_NPE - 1;
     BuildHints(sender);

     Str(npe[cur_npe].number,txt);
     statictext3.caption := txt;

     StaticText8.Enabled := not NPE[Cur_NPE].Deleted;
     StaticText3.Enabled := not NPE[Cur_NPE].Deleted;

     if (Cur_NPE <= Tot_Inputs + 1) then
        begin
             NextBttn.Enabled := true;
             BackBttn.Enabled := false;
        end;

     if (Cur_NPE < Tot_NPEs + Tot_Inputs) and
        (Cur_NPE > Tot_Inputs + 1) then
        begin
             NextBttn.Enabled := True;
             BackBttn.Enabled := true;
        end;

     EditSigma.Text := NPE[Cur_NPE].SigmaStr;
     EditTau.Text := NPE[Cur_NPE].TauStr;
     EditKappa.Text := NPE[Cur_NPE].KappaStr;
     EditAlpha.Text := NPE[Cur_NPE].AlphaStr;
     EditBeta.Text := NPE[Cur_NPE].BetaStr;

     EditSigma.Enabled := not NPE[Cur_NPE].Deleted;
     EditTau.Enabled := not NPE[Cur_NPE].Deleted;
     EditKappa.Enabled := not NPE[Cur_NPE].Deleted;
     EditAlpha.Enabled := not NPE[Cur_NPE].Deleted;
     EditBeta.Enabled := not NPE[Cur_NPE].Deleted;

     DefParBttn.Enabled := not NPE[Cur_NPE].Deleted;

     for p_i := 0 to FanInStringGrid.RowCount-1 do
       begin
         FanInStringGrid.Cells[0,p_i] := '';
         FanInStringGrid.Cells[1,p_i] := '';
       end;

     for p_i := 0 to FanInStringGrid.RowCount - 1 do
       begin
         FanInStringGrid.Cells[0,p_i] := NPE[Cur_NPE].
                                         PreInput[p_i+1].NumStr;

         FanInStringGrid.Cells[1,p_i] := NPE[Cur_NPE].
                                         PreInput[p_i+1].WgtStr;
       end;

     FanInStringGrid.Enabled := not NPE[Cur_NPE].Deleted;

     if (not FanInStringGrid.Enabled) then
        FanInStringGrid.Font.Color := clSilver
     else
        FanInStringGrid.Font.Color := clBlack;

     if NPE[Cur_NPE].Net_Kind <> -2 then
       case NPE[Cur_NPE].Net_Kind of
           1: begin
                exc.enabled := true;
                inh.enabled := true;
                sa.checked := true;
                ma.checked := false;
                vta1.checked := false;
                vta2.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;

           2: begin
                exc.enabled := true;
                inh.enabled := true;
                sa.checked := false;
                ma.checked := true;
                vta1.checked := false;
                vta2.checked := false;
                ca1.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;
       end{case};

     if NPE[Cur_NPE].NPE_Kind <> -2 then
         case NPE[Cur_NPE].NPE_Kind of
             -1: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   inh.checked := true;

                   ca1.enabled := false;
                   ca1.checked := false;
                   vta1.enabled := false;
                   vta1.checked := false;
                   vta2.enabled := false;
                   vta2.checked := false;
                   operant.enabled := false;
                   operant.checked := false;
                   respondent1.enabled := false;
                   respondent1.checked := false;
                   respondent2.enabled := false;
                   respondent2.checked := false;
                 end;

              0: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   exc.checked := true;

                   ca1.enabled := true;
                   ca1.checked := false;
                   vta1.enabled := true;
                   vta1.checked := false;
                   vta2.enabled := true;
                   vta2.checked := false;
                   operant.enabled := true;
                   operant.checked := false;
                   respondent1.enabled := true;
                   respondent1.checked := false;
                   respondent2.enabled := true;
                   respondent2.checked := false;
                 end;

              3: begin
                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;

                   ca1.enabled := true;
                   ca1.checked := true;
                   ma.enabled := true;
                   ma.checked := false;
                   vta1.enabled := true;
                   vta1.checked := false;
                   vta2.enabled := true;
                   vta2.checked := false;
                   operant.enabled := true;
                   operant.checked := false;
                   respondent1.enabled := true;
                   respondent2.checked := false;
                   respondent1.enabled := true;
                   respondent2.checked := false;
                 end;

              4: begin
                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;

                   sa.checked := false;
                   ca1.checked := false;
                   vta1.checked := true;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;
                 end;

              5: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := true;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              6: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   respondent1.checked := true;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              7: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := true;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              8: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := true;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;
         end{case} else
            begin
              sa.checked := false;
              ma.checked := false;
              exc.checked := false;
              inh.checked := false;
              ca1.checked := false;
              vta1.checked := false;
              vta2.checked := false;
              operant.checked := false;
              respondent1.checked := false;
              respondent2.checked := false;
            end;

     if NPE[Cur_NPE].Deleted then
        begin
             FanInStringGrid.Font.Color := clSilver;
             sa.enabled := False;
             ma.enabled := False;
             exc.enabled := False;
             inh.enabled := False;
             ca1.enabled := False;
             vta1.enabled := False;
             vta2.enabled := False;
             operant.enabled := False;
             respondent1.enabled := False;
             respondent2.enabled := False;
        end;

     DelNPEBttn.Enabled := not NPE[Cur_NPE].Deleted;
     RecNPEBttn.Enabled := NPE[Cur_NPE].Deleted;

     bttn_clicked := false;
end;


procedure TForm2b.Button6Click(Sender: TObject);
begin
  Panel2.Visible := False;
  Panel3.Visible := False;
end;


procedure TForm2b.DefParBttnClick(Sender: TObject);
begin
     NPE[Cur_NPE].LogisSigma := 0.1;
     NPE[Cur_NPE].Tau := 0.1;
     NPE[Cur_NPE].Kappa := 0.1;
     NPE[Cur_NPE].Alpha := 0.5;
     NPE[Cur_NPE].Beta := 0.1;

     prev_sigma_str := EditSigma.Text;
     EditSigma.Text := '0.1';
     cur_sigma_str := EditSigma.Text;
     if cur_sigma_str <> prev_sigma_str then
        EditSigma.Color := clYellow
     else
         EditSigma.Color := clWhite;

     prev_tau_str := EditTau.Text;
     EditTau.Text := '0.1';
     cur_tau_str := EditTau.Text;
     if cur_tau_str <> prev_tau_str then
        EditTau.Color := clYellow
     else
         EditTau.Color := clWhite;

     prev_kappa_str := EditKappa.Text;
     EditKappa.Text := '0.1';
     cur_kappa_str := EditKappa.Text;
     if cur_kappa_str <> prev_kappa_str then
        EditKappa.Color := clYellow
     else
         EditKappa.Color := clWhite;

     prev_alpha_str := EditAlpha.Text;
     EditAlpha.Text := '0.5';
     cur_alpha_str := EditAlpha.Text;
     if cur_alpha_str <> prev_alpha_str then
        EditAlpha.Color := clYellow
     else
         EditAlpha.Color := clWhite;

     prev_beta_str := EditBeta.Text;
     EditBeta.Text := '0.1';
     cur_beta_str := EditBeta.Text;
     if cur_beta_str <> prev_beta_str then
        EditBeta.Color := clYellow
     else
         EditBeta.Color := clWhite;

  BuildHints(sender);
end;


procedure TForm2b.EditGoToChange(Sender: TObject);
Var
   code, value : Integer;
   txt, txt2, txt3 : String[255];
   p_i : integer;
begin
  EditSigma.Color := clWhite;
  EditTau.Color := clWhite;
  EditKappa.Color := clWhite;
  EditAlpha.Color := clWhite;
  EditBeta.Color := clWhite;
  FanInStringGrid.Color := clWhite;

  val(EditGoTo.Text,value,code);

  if code <> 0 then
    EditGoTo.Text := ''
  else
    begin
      if value <= Tot_Inputs + 1 then
        begin
            Cur_NPE := Tot_Inputs + 1;
            Str(NPE[Cur_NPE].Number,txt);

            EditGoTo.Text := txt;
            StaticText3.Caption := txt;

            NextBttn.Enabled := True;
            BackBttn.Enabled := False;
        end;

      if (value > Tot_Inputs + 1) and
         (value <= Tot_NPEs + Tot_Inputs) then
          begin
             Cur_NPE := value;
             Str(NPE[Cur_NPE].Number,txt);
             StaticText3.Caption := txt;

             if Cur_NPE = Tot_NPEs + Tot_Inputs then
               begin
                  NextBttn.Enabled := False;
                  BackBttn.Enabled := True;
               end;

             if (Cur_NPE > Tot_Inputs + 1) and
                (Cur_NPE < Tot_NPEs + Tot_Inputs) then
                 begin
                    NextBttn.Enabled := True;
                    BackBttn.Enabled := True;
                 end;
          end;

      if value >= Tot_NPEs + Tot_Inputs then
        begin
           Cur_NPE := Tot_NPEs + Tot_Inputs;
           Str(NPE[Cur_NPE].Number,txt);
           EditGoTo.Text := txt;
           StaticText3.Caption := txt;
           NextBttn.Enabled := False;
           BackBttn.Enabled := True;
        end;

      UncheckAllTypeButtons(sender);

      EditSigma.Text := NPE[Cur_NPE].SigmaStr;
      EditTau.Text := NPE[Cur_NPE].TauStr;
      EditKappa.Text := NPE[Cur_NPE].KappaStr;
      EditAlpha.Text := NPE[Cur_NPE].AlphaStr;
      EditBeta.Text := NPE[Cur_NPE].BetaStr;

      DefParBttn.Enabled := not NPE[Cur_NPE].Deleted;

      with NPE[Cur_NPE] do
          for p_i := 0 to Max_Pre_Inps-1 do
             begin
                FanInStringGrid.Cells[0,p_i] := PreInput[p_i+1].NumStr;
                FanInStringGrid.Cells[1,p_i] := PreInput[p_i+1].WgtStr;
             end;

     if NPE[Cur_NPE].Net_Kind <> -2 then
       case NPE[Cur_NPE].Net_Kind of
           1: begin
                exc.enabled := true;
                inh.enabled := true;
                sa.checked := true;
                ma.checked := false;
                vta1.checked := false;
                vta2.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;

           2: begin
                exc.enabled := true;
                inh.enabled := true;
                sa.checked := false;
                ma.checked := true;
                vta1.checked := false;
                vta2.checked := false;
                ca1.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;
       end{case};

     if NPE[Cur_NPE].NPE_Kind <> -2 then
         case NPE[Cur_NPE].NPE_Kind of
             -1: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   inh.checked := true;

                   ca1.enabled := true;
                   ca1.checked := false;
                   vta1.enabled := true;
                   vta1.checked := false;
                   vta2.enabled := true;
                   vta2.checked := false;
                   operant.enabled := true;
                   operant.checked := false;
                   respondent1.enabled := true;
                   respondent1.checked := false;
                   respondent2.enabled := true;
                   respondent2.checked := false;
                 end;

              0: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   exc.checked := true;

                   ca1.enabled := true;
                   ca1.checked := false;
                   vta1.enabled := true;
                   vta1.checked := false;
                   vta2.enabled := true;
                   vta2.checked := false;
                   operant.enabled := true;
                   operant.checked := false;
                   respondent1.enabled := true;
                   respondent1.checked := false;
                   respondent2.enabled := true;
                   respondent2.checked := false;
                 end;

              3: begin
                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;

                   ca1.enabled := true;
                   ca1.checked := true;
                   ma.checked := false;
                   vta1.enabled := true;
                   vta1.checked := false;
                   vta2.enabled := true;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;
                 end;

              4: begin
                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;

                   sa.checked := false;
                   ca1.checked := false;
                   vta1.checked := true;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;
                 end;

              5: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := true;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              6: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := true;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              7: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := true;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;
         end{case} else
            begin
              sa.checked := false;
              ma.checked := false;
              exc.checked := false;
              inh.checked := false;
              ca1.checked := false;
              vta1.checked := false;
              vta2.checked := false;
              operant.checked := false;
              respondent1.checked := false;
              respondent2.checked := false;
            end;
       end;
       
    StaticText8.Enabled := not NPE[Cur_NPE].Deleted;
    StaticText3.Enabled := not NPE[Cur_NPE].Deleted;

    EditSigma.Enabled := not NPE[Cur_NPE].Deleted;
    EditTau.Enabled := not NPE[Cur_NPE].Deleted;
    EditKappa.Enabled := not NPE[Cur_NPE].Deleted;
    EditAlpha.Enabled := not NPE[Cur_NPE].Deleted;
    EditBeta.Enabled := not NPE[Cur_NPE].Deleted;

    FanInStringGrid.Enabled := not NPE[Cur_NPE].Deleted;

    if NPE[Cur_NPE].Deleted then
      begin
         FanInStringGrid.Font.Color := clSilver;
         sa.enabled := False;
         ma.enabled := False;
         exc.enabled := False;
         inh.enabled := False;
         ca1.enabled := False;
         vta1.enabled := False;
         operant.enabled := False;
         respondent1.enabled := False;
         {respondent2.enabled := False;}
       end;

     DelNPEBttn.Enabled := not NPE[Cur_NPE].Deleted;
     RecNPEBttn.Enabled := NPE[Cur_NPE].Deleted;

     BuildHints(sender);
end;


procedure TForm2b.EditGoToKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case key of
          13: EditGoToChange(sender);

          33: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE > Tot_Inputs+1) then
                  BackBttnClick(sender);

          34: if (Tot_NPEs+Tot_Inputs > 1) and
                 (Cur_NPE < Tot_NPEs+Tot_Inputs) then
                  NextBttnClick(sender);
     end{case};
end;


procedure TForm2b.DelNPEBttnClick(Sender: TObject);
var
   cnpe, p_i, pi2, j : integer;
   txt : String[3];
begin
  if MessageDlg('Delete current unit?',
                 mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin
         NPE[Cur_NPE].Deleted := True;

         StaticText8.Enabled := not NPE[Cur_NPE].Deleted;
         StaticText3.Enabled := not NPE[Cur_NPE].Deleted;

         EditSigma.Enabled := not NPE[Cur_NPE].Deleted;
         EditTau.Enabled := not NPE[Cur_NPE].Deleted;
         EditKappa.Enabled := not NPE[Cur_NPE].Deleted;
         EditAlpha.Enabled := not NPE[Cur_NPE].Deleted;
         EditBeta.Enabled := not NPE[Cur_NPE].Deleted;

         DefParBttn.Enabled := not NPE[Cur_NPE].Deleted;

         FanInStringGrid.Enabled := not NPE[Cur_NPE].Deleted;

         FanInStringGrid.Font.Color := clSilver;

         sa.enabled := not NPE[Cur_NPE].Deleted;
         ma.enabled := not NPE[Cur_NPE].Deleted;
         exc.enabled := not NPE[Cur_NPE].Deleted;
         inh.enabled := not NPE[Cur_NPE].Deleted;
         ca1.enabled := not NPE[Cur_NPE].Deleted;
         vta1.enabled := not NPE[Cur_NPE].Deleted;
         operant.enabled := not NPE[Cur_NPE].Deleted;
         respondent1.enabled := not NPE[Cur_NPE].Deleted;
         {respondent2.enabled := not NPE[Cur_NPE].Deleted;}

         DelNPEBttn.Enabled := not NPE[Cur_NPE].Deleted;
         RecNPEBttn.Enabled := NPE[Cur_NPE].Deleted;
    end;
end;


procedure TForm2b.RecNPEBttnClick(Sender: TObject);
begin
  if MessageDlg('Recover current unit?',
                 mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin
      NPE[Cur_NPE].Deleted := False;

      StaticText8.Enabled := not NPE[Cur_NPE].Deleted;
      StaticText3.Enabled := not NPE[Cur_NPE].Deleted;

      EditSigma.Enabled := not NPE[Cur_NPE].Deleted;
      EditTau.Enabled := not NPE[Cur_NPE].Deleted;
      EditKappa.Enabled := not NPE[Cur_NPE].Deleted;
      EditAlpha.Enabled := not NPE[Cur_NPE].Deleted;
      EditBeta.Enabled := not NPE[Cur_NPE].Deleted;

      DefParBttn.Enabled := not NPE[Cur_NPE].Deleted;

      FanInStringGrid.Enabled := not NPE[Cur_NPE].Deleted;

      FanInStringGrid.Font.Color := clBlack;

      sa.enabled := not NPE[Cur_NPE].Deleted;
      ma.enabled := not NPE[Cur_NPE].Deleted;
      exc.enabled := not NPE[Cur_NPE].Deleted;
      inh.enabled := not NPE[Cur_NPE].Deleted;
      ca1.enabled := not NPE[Cur_NPE].Deleted;
      vta1.enabled := not NPE[Cur_NPE].Deleted;
      operant.enabled := not NPE[Cur_NPE].Deleted;
      respondent1.enabled := not NPE[Cur_NPE].Deleted;
      respondent2.enabled := not NPE[Cur_NPE].Deleted;

     if NPE[Cur_NPE].Net_Kind <> -2 then
       case NPE[Cur_NPE].Net_Kind of
           1: begin
                exc.enabled := true;
                inh.enabled := true;
                sa.checked := true;
                ma.checked := false;
                vta1.checked := false;
                vta2.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;

           2: begin
                exc.enabled := true;
                inh.enabled := true;
                sa.checked := false;
                ma.checked := true;
                vta1.checked := false;
                vta2.checked := false;
                ca1.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;
       end{case};

     if NPE[Cur_NPE].NPE_Kind <> -2 then
         case NPE[Cur_NPE].NPE_Kind of
             -1: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   inh.checked := true;

                   ca1.enabled := false;
                   ca1.checked := false;
                   vta1.enabled := false;
                   vta1.checked := false;
                   vta2.enabled := false;
                   vta2.checked := false;
                   operant.enabled := false;
                   operant.checked := false;
                   respondent1.enabled := false;
                   respondent1.checked := false;
                   respondent2.enabled := false;
                   respondent2.checked := false;
                 end;

              0: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   exc.checked := true;

                   ca1.enabled := true;
                   ca1.checked := false;
                   vta1.enabled := true;
                   vta1.checked := false;
                   vta2.enabled := true;
                   vta2.checked := false;
                   operant.enabled := true;
                   operant.checked := false;
                   respondent1.enabled := true;
                   respondent1.checked := false;
                   respondent2.enabled := true;
                   respondent2.checked := false;
                 end;

              3: begin
                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;

                   ca1.enabled := true;
                   ca1.checked := true;
                   ma.checked := false;
                   vta1.enabled := true;
                   vta1.checked := false;
                   vta2.enabled := true;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;
                 end;

              4: begin
                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;

                   sa.checked := false;
                   ca1.checked := false;
                   vta1.checked := true;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;
                 end;

              5: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := true;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              6: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := true;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              7: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := true;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              8: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := true;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;
         end{case} else
            begin
              sa.checked := false;
              ma.checked := false;
              exc.checked := false;
              inh.checked := false;
              ca1.checked := false;
              vta1.checked := false;
              vta2.checked := false;
              operant.checked := false;
              respondent1.checked := false;
              respondent2.checked := false;
            end;
    end;

    DelNPEBttn.Enabled := not NPE[Cur_NPE].Deleted;
    RecNPEBttn.Enabled := NPE[Cur_NPE].Deleted;
end;


procedure TForm2b.NumTextClick(Sender: TObject);
var
   p_i : integer;
begin
  GroupBox2.Cursor := crNo;

  if (Cur_NPE > Tot_Inputs + 1) then
     with NPE[Cur_NPE-1] do
       for p_i := 0 to FanInStringGrid.RowCount-1 do
         FanInStringGrid.Cells[0,p_i] := PreInput[p_i+1].NumStr;

  GroupBox2.Cursor := crDefault;

  FanInStringGridExit(sender);
  BuildHints(sender);
end;


procedure TForm2b.WgtsTextClick(Sender: TObject);
var
   p_i : integer;
begin
  GroupBox2.Cursor := crNo;

  if (Cur_NPE > Tot_Inputs + 1) then
     with NPE[Cur_NPE-1] do
       for p_i := 0 to FanInStringGrid.RowCount-1 do
         FanInStringGrid.Cells[1,p_i] := PreInput[p_i+1].WgtStr;

  GroupBox2.Cursor := crDefault;

  FanInStringGridExit(sender);
  BuildHints(sender);
end;


Function TForm2b.AllFieldsFilled(Sender: TObject) : Boolean;
Var
   n, i : Integer;
   aff : Boolean;
Begin
  aff := True;

  EditTotInputsChange(sender);
  EditTotNPEsChange(sender);
  EditSigmaChange(sender);
  EditTauChange(sender);
  EditKappaChange(sender);
  EditAlphaChange(sender);
  EditBetaChange(sender);
  FanInStringGridExit(Sender);

  aff := (aff) and (EditTotInputs.Text <> '');
  aff := (aff) and (EditTotNPEs.Text <> '');
  aff := (aff) and (EditSigma.Text <> '');
  aff := (aff) and (EditTau.Text <> '');
  aff := (aff) and (EditKappa.Text <> '');
  aff := (aff) and (EditAlpha.Text <> '');
  aff := (aff) and (EditBeta.Text <> '');
  aff := (aff) and ((sa.enabled) or (ca1.enabled) or
                    (ma.enabled) or (vta1.enabled) or
                    (exc.enabled) or (inh.enabled) or
                    (operant.enabled) or (respondent1.enabled) or
                    (respondent2.enabled));

  for n := Tot_Inputs+1 to Tot_Elements do
    with NPE[n] do
      begin
        aff := (aff) and (NPE_Kind <> -2);
        aff := (aff) and (Net_Kind <> -2);

        aff := (aff) and (SigmaStr <> '');
        aff := (aff) and (TauStr <> '');
        aff := (aff) and (KappaStr <> '');
        aff := (aff) and (AlphaStr <> '');
        aff := (aff) and (BetaStr <> '');

        aff := (aff) and (PreInpNPEs <> 0);
      end;

  AllFieldsFilled := Aff;
End;


procedure TForm2b.SaveNetClick(Sender: TObject);
begin
  If not(AllFieldsFilled(sender)) then
    if MessageDlg('Incomplete network specification. ' +
                  'You can save now and continue later. ' +
                  'However, trying to use this network in a simulation ' +
                  'will result in an error.  Proceed?',
                   mtConfirmation,[mbYes, mbNo],0) = mrYes then
      if SaveDialog1.Execute then
        SaveNetFile(Sender);

    if AllFieldsFilled(sender) then
      if SaveDialog1.Execute then
        SaveNetFile(Sender)
end;


procedure TForm2b.SaveNetFile(Sender: TObject);
var
   cnpe, p_i, i, n, inp : integer;
begin
  EditTotInputs.Color := clWhite;
  EditTotNPEs.Color := clWhite;
  EditSigma.Color := clWhite;
  EditTau.Color := clWhite;
  EditKappa.Color := clWhite;
  EditAlpha.Color := clWhite;
  EditBeta.Color := clWhite;
  FanInStringGrid.Color := clWhite;

  EditTotInputsChange(sender);
  EditTotNPEsChange(sender);
  EditSigmaChange(sender);
  EditTauChange(sender);
  EditKappaChange(sender);
  EditAlphaChange(sender);
  EditBetaChange(sender);
  FanInStringGridExit(Sender);

  if (sa.enabled) and (sa.checked) then
    NPE[Cur_NPE].Net_Kind := 1;

  if (ma.enabled) and (ma.checked) then
    NPE[Cur_NPE].Net_Kind := 2;

  if (exc.enabled) and (exc.checked) then
    NPE[Cur_NPE].NPE_Kind := 0;

  if (inh.enabled) and (inh.checked) then
    NPE[Cur_NPE].NPE_Kind := -1;

  if (ca1.enabled) and (ca1.checked) then
    begin
      NPE[Cur_NPE].Net_Kind := 1;
      NPE[Cur_NPE].NPE_Kind := 3;
    end;

  if (vta1.enabled) and (vta1.checked) then
    begin
      NPE[Cur_NPE].Net_Kind := 2;
      NPE[Cur_NPE].NPE_Kind := 4;
    end;

  if (vta2.enabled) and (vta2.checked) then
    begin
      NPE[Cur_NPE].Net_Kind := 2;
      NPE[Cur_NPE].NPE_Kind := 8;
    end;

  if (operant.enabled) and (operant.checked) then
    begin
      NPE[Cur_NPE].Net_Kind := 2;
      NPE[Cur_NPE].NPE_Kind := 5;
    end;

  if (respondent1.enabled) and (respondent1.checked) then
    begin
      NPE[Cur_NPE].Net_Kind := 2;
      NPE[Cur_NPE].NPE_Kind := 6;
    end;

  if (respondent2.enabled) and (respondent2.checked) then
    begin
      NPE[Cur_NPE].Net_Kind := 2;
      NPE[Cur_NPE].NPE_Kind := 7;
    end;

  Net_FileName := SaveDialog1.FileName;
  AssignFile(Nf1,Net_FileName);

 {$I-}
  ReWrite(Nf1);
 {$I+}

  If IOResult <> 0 then
    begin
      MessageDlg('Invalid writing operation.' +
                 'Target disk is either full or corrupted.',
                  mtError,[mbCancel],0);

      CloseFile(Nf1);
      Exit;
    end else
      begin
        Writeln(Nf1, Tot_Inputs);

        for inp := 1 to tot_inputs do
           NPE[inp].Deleted := false;

        n := 0;

        For cnpe := Tot_Inputs + 1 to Tot_Elements do
          if not NPE[cnpe].Deleted then
            n := n + 1;

        Writeln(Nf1, n);

        For cnpe := Tot_Inputs + 1 to Tot_Elements do
          if not NPE[cnpe].Deleted then
            begin
              Writeln(Nf1, NPE[cnpe].Number);
              Writeln(Nf1, NPE[cnpe].Net_Kind);
              Writeln(Nf1, NPE[cnpe].NPE_Kind);

              if NPE[cnpe].SigmaStr = '' then
                Writeln(Nf1)
              else
                Writeln(Nf1, NPE[cnpe].SigmaStr);

              if NPE[cnpe].TauStr = '' then
                Writeln(Nf1)
              else
                Writeln(Nf1, NPE[cnpe].TauStr);

              if NPE[cnpe].KappaStr = '' then
                Writeln(Nf1)
              else
                Writeln(Nf1, NPE[cnpe].KappaStr);

              if NPE[cnpe].AlphaStr = '' then
                Writeln(Nf1)
              else
                Writeln(Nf1, NPE[cnpe].AlphaStr);

              if NPE[cnpe].BetaStr = '' then
                Writeln(Nf1)
              else
                Writeln(Nf1, NPE[cnpe].BetaStr);

              i := 0;

              for p_i := 1 to NPE[cnpe].PreInpNPEs do
                if not NPE[NPE[cnpe].PreInput[p_i].Num].Deleted then
                  i := i + 1;

              Writeln(Nf1, i); { True number of presynaptic inputs }

            { the number of presynaptic elements has priority ! }

              for p_i := 1 to NPE[cnpe].PreInpNPEs do
                if not NPE[NPE[cnpe].PreInput[p_i].Num].Deleted then
                  begin
                     Writeln(Nf1, NPE[cnpe].PreInput[p_i].NumStr);
                     Writeln(Nf1, NPE[cnpe].PreInput[p_i].WgtStr);
                  end;
            end;

        Form2b.Caption := 'Network - ' + SaveDialog1.FileName;
        CloseFile(Nf1);
        JustSaved := True;
      end;
end;


procedure TForm2b.OpenNetClick(Sender: TObject);
begin
   OpenNetRequest := True;

   if JustSaved then
     begin
       if OpenDialog1.Execute then
         begin
           Net_FileName := OpenDialog1.FileName;
           AssignFile(Nf1,Net_FileName);

          {$I-}
           ReSet(Nf1);
          {$I+}

           If IOResult = 0 then
             OpenNetFile(Sender)
           else
             HandCraftNet(sender);
         end;
     end;

   if (not JustSaved) then
       case MessageDlg('Save current network?',mtConfirmation,
                     [mbYes, mbNo,mbCancel],0) of
         mrYes: begin
                  SaveNetClick(sender);

                  if OpenDialog1.Execute then
                    begin
                      Net_FileName := OpenDialog1.FileName;
                      AssignFile(Nf1,Net_FileName);

                     {$I-}
                      ReSet(Nf1);
                     {$I+}

                      If IOResult = 0 then
                        OpenNetFile(Sender)
                      else
                        HandCraftNet(sender);
                    end;
                end;

         mrNo: if OpenDialog1.Execute then
                 begin
                   Net_FileName := OpenDialog1.FileName;
                   AssignFile(Nf1,Net_FileName);

                  {$I-}
                   ReSet(Nf1);
                  {$I+}

                   If IOResult = 0 then
                     OpenNetFile(Sender)
                   else
                     HandCraftNet(sender);
                 end;
       end{case};

   OpenNetRequest := False;
end;


procedure TForm2b.OpenNetFile(Sender: TObject);
var
   cnpe, p_i, code, i, j, inp, p_i_2 : integer;
   txt0, txt, txt2, txt3, txt4 : String;
begin
  HandCraftNet(sender);

  Exc_NPEs := 0;
  Inh_NPEs := 0;
  Tot_CA1_NPEs := 0;
  Tot_VTA1_NPEs := 0;
  Tot_VTA2_NPEs := 0;
  SA_NPEs := 0;
  MA_NPEs := 0;
  Tot_R_NPEs := 0;
  Tot_CR_UR1_NPEs := 0;
  Tot_CR_UR2_NPEs := 0;

 {$I-}
  Readln(Nf1, Tot_Inputs);
 {$I+}

  if (IOResult <> 0) or (Tot_Inputs < 1) or
     (Tot_Inputs > Max_Inputs) then
    begin
      MessageDlg('Illegal number of inputs.',mtError,[mbCancel],0);
      CloseFile(Nf1);
      Exit;
    end;

  for inp := 1 to tot_inputs do
    begin
       NPE[inp].Number := inp;
       NPE[inp].NPE_Kind := 1;
       NPE[inp].Net_Kind := 1;
       NPE[inp].Deleted := False;
    end;

 {$I-}
  Readln(Nf1, Tot_NPEs);
 {$I+}

  if (IOResult <> 0) or (Tot_NPEs < 1) or (Tot_NPEs > Max_NPEs) then
    begin
      MessageDlg('Illegal number of NPUs.',mtError,[mbCancel],0);
      CloseFile(Nf1);
      Exit;
    end;

  Tot_Elements := Tot_Inputs + Tot_NPEs;
  str(tot_elements,txt);
  Elements.Caption := '#S units + #NPUs: ' + txt;

  if tot_elements > Max_Elements then
    begin
      MessageDlg('Too many units: Max = 255.', mtError, [mbOk],0);
      CloseFile(Nf1);
      Exit;
    end;

  For cnpe := Tot_Inputs + 1 to Tot_Elements do
    with NPE[cnpe] do
      begin
        Deleted := False;

       {$I-}
        Readln(Nf1, Number);
       {$I+}

        if (IOResult <> 0) or (Number < 2) then
          begin
            MessageDlg('Illegal NPU number.',
                        mtError,[mbCancel],0);

            CloseFile(Nf1);
            Exit;
          end;

        Str(Number,txt);

       {$I-}
        Readln(Nf1, Net_Kind);
       {$I+}

        if (IOResult <> 0) or (Net_Kind < -2) or (Net_Kind > 2) then
          begin
            MessageDlg('Illegal network type for NPU ' + txt + '.',
                        mtError,[mbCancel],0);
            CloseFile(Nf1);
            Exit;
          end;

       {$I-}
        Readln(Nf1, NPE_Kind);
       {$I+}

        if (IOResult <> 0) or (NPE_Kind < -2) or (NPE_Kind > 8) then
          begin
            MessageDlg('Illegal type for NPU ' + txt + '.',
                        mtError,[mbCancel],0);
            CloseFile(Nf1);
            Exit;
          end;

        if Tot_ca1_NPEs+Tot_vta1_NPEs+Tot_vta2_NPEs > Max_Disc_NPEs then
          begin
            MessageDlg('Too many discrepancy NPUs.  Maximum allowed = 25',
                        mtError,[mbCancel],0);
            CloseFile(Nf1);
            Exit;
          end;

        if Tot_R_NPEs + Tot_CR_UR1_NPEs + Tot_CR_UR2_NPEs > Max_Outputs then
          begin
            MessageDlg('Too many output NPUs.  Maximum allowed = 30',
                        mtError,[mbCancel],0);
            CloseFile(Nf1);
            Exit;
          end;

        Readln(Nf1, SigmaStr);
        Readln(Nf1, TauStr);
        Readln(Nf1, KappaStr);
        Readln(Nf1, AlphaStr);
        Readln(Nf1, BetaStr);

        val(SigmaStr,LogisSigma,code);
        if (SigmaStr <> '') and
           ((code <> 0) or (LogisSigma < 0) or (LogisSigma > 1)) then
          begin
            MessageDlg('Invalid logistic standard deviation for NPU ' + txt + '.',
                        mtError,[mbCancel],0);
            CloseFile(Nf1);
            Exit;
          end;

        val(TauStr,Tau,code);
        if (TauStr <> '') and
           ((code <> 0) or (tau < 0) or (tau > 1)) then
          begin
            MessageDlg('Invalid temporal summation for NPU ' + txt + '.',
                        mtError,[mbCancel],0);
            CloseFile(Nf1);
            Exit;
          end;

        val(KappaStr,Kappa,code);
        if (KappaStr <> '') and
           ((code <> 0) or (kappa < 0) or (kappa > 1)) then
          begin
            MessageDlg('Invalid decay parameter for NPU ' + txt + '.',
                        mtError,[mbCancel],0);
            CloseFile(Nf1);
            Exit;
          end;

        val(AlphaStr,Alpha,code);
        if (AlphaStr <> '') and
           ((code <> 0) or (alpha < 0) or (alpha > 1)) then
          begin
            MessageDlg('Invalid weight-increase parameter for NPU ' + txt + '.',
                        mtError,[mbCancel],0);
            CloseFile(Nf1);
            Exit;
          end;

        val(BetaStr,Beta,code);
        if (BetaStr <> '') and
           ((code <> 0) or (beta < 0) or (beta > 1)) then
          begin
            MessageDlg('Invalid weight-decrease parameter for NPU ' + txt + '.',
                        mtError,[mbCancel],0);
            CloseFile(Nf1);
            Exit;
          end;

       {$I-}
        Readln(Nf1,PreInpNPEs);
       {$I+}

        if (IOResult <> 0) or
           (PreInpNPEs < 0) or
           (PreInpNPEs > Max_Pre_Inps) then
          begin
            MessageDlg('Invalid number of presynaptic inputs for NPU ' + txt + '.',
                        mtError,[mbCancel],0);

            CloseFile(Nf1);
            Exit;
          end;

        PreInpWgts := PreInpNPEs;

        for p_i := 1 to PreInpNPEs do
          with PreInput[p_i] do
            begin
              Readln(Nf1, NumStr);
              val(NumStr,Num,code);
              if (code <> 0) or (Num < 1) or
                 (Num > Tot_Inputs + Tot_NPEs) then
                begin
                  MessageDlg('Invalid presynaptic input for NPU ' + txt + '.',
                              mtError,[mbCancel],0);
                  CloseFile(Nf1);
                  Exit;
                end;

              Readln(Nf1,PreInput[p_i].WgtStr);
              val(WgtStr,Weight,code);
              if (code <> 0) or (Weight < 0) or (Weight > 1) then
                begin
                  MessageDlg('Invalid weight for presynaptic input ' +
                             NumStr + ' of NPU ' + txt + '.',
                             mtError,[mbCancel],0);
                  CloseFile(Nf1);
                  Exit;
                end;
            end;
      end;

  CloseFile(Nf1);

  UpdatePostOutNPEs(sender);
  CountConnections(sender);

  str(tot_connections,txt);
  StaticText1.Caption := 'Connections: ' + txt;

  Panel2.Visible := True;
  Panel3.Visible := True;

  EditSigma.Color := clWhite;
  EditTau.Color := clWhite;
  EditKappa.Color := clWhite;
  EditAlpha.Color := clWhite;
  EditBeta.Color := clWhite;
  FanInStringGrid.Color := clWhite;

  Form2b.Caption := 'Network - ' + OpenDialog1.FileName;

  Cur_NPE := Tot_Inputs + 1;

  str(NPE[Cur_NPE].Number,txt);
  StaticText3.Caption := txt;

  str(Tot_Inputs,txt);
  EditTotInputs.Text := txt;
  str(Tot_NPEs,txt);
  EditTotNPEs.Text := txt;

  EditSigma.text := NPE[Cur_NPE].SigmaStr;
  EditTau.text := NPE[Cur_NPE].TauStr;
  EditKappa.text := NPE[Cur_NPE].KappaStr;
  EditAlpha.text := NPE[Cur_NPE].AlphaStr;
  EditBeta.text := NPE[Cur_NPE].BetaStr;

  with NPE[Cur_NPE] do
    for p_i := 1 to PreInpNPEs do
      begin
         FanInStringGrid.Cells[0,p_i-1] := PreInput[p_i].NumStr;
         FanInStringGrid.Cells[1,p_i-1] := PreInput[p_i].WgtStr;
      end;

  if Tot_NPEs > 1 then
     NextBttn.Enabled := True
  else
     NextBttn.Enabled := False;

  BackBttn.Enabled := False;

  case NPE[Cur_NPE].Net_Kind of
   -2: begin
         sa.enabled := false;
         sa.checked := false;

         ma.enabled := false;
         ma.checked := false;

         exc.enabled := false;
         exc.checked := false;

         inh.enabled := false;
         exc.checked := false;

         ca1.enabled := false;
         ca1.checked := false;

         vta1.enabled := false;
         vta1.checked := false;

         vta2.enabled := false;
         vta2.checked := false;

         operant.enabled := false;
         operant.checked := false;

         respondent1.enabled := false;
         respondent1.checked := false;

         respondent2.enabled := false;
         respondent2.checked := false;
       end;

    1: begin
         sa.checked := true;
         ma.checked := false;

         exc.enabled := true;
         inh.enabled := true;
       end;

    2: begin
         sa.checked := false;
         ma.checked := true;

         exc.enabled := true;
         inh.enabled := true;
       end;
  end{case};

  case NPE[Cur_NPE].NPE_Kind of
    -2: begin
          sa.enabled := false;
          sa.checked := false;

          ma.enabled := false;
          ma.checked := false;

          exc.enabled := false;
          inh.enabled := false;

          ca1.enabled := false;
        end;

    -1: begin
          exc.enabled := true;
          exc.checked := false;

          inh.enabled := true;
          inh.checked := true;
        end;

     0: begin
          exc.enabled := true;
          exc.checked := true;

          inh.enabled := true;
          inh.checked := false;
        end;

     3: begin
          ca1.checked := true;
          vta1.checked := false;
          vta2.checked := false;

          exc.enabled := false;
          inh.enabled := false;
        end;

     4: begin
          ca1.checked := false;
          vta1.checked := true;
          vta2.checked := false;

          exc.enabled := false;
          inh.enabled := false;
        end;

     5: begin
          operant.checked := true;
          respondent1.checked := false;
          respondent2.checked := false;

          exc.enabled := false;
          inh.enabled := false;
        end;

     6: begin
          operant.checked := false;
          respondent1.checked := true;
          respondent2.checked := false;

          exc.enabled := false;
          inh.enabled := false;
        end;

     7: begin
          operant.checked := false;
          respondent1.checked := false;
          respondent2.checked := true;

          exc.enabled := false;
          inh.enabled := false;
        end;

     8: begin
          ca1.checked := false;
          vta1.checked := false;
          vta2.checked := true;

          exc.enabled := false;
          inh.enabled := false;
        end;
  end{case};

  If (Tot_NPEs > 1) and (not NPE[cur_npe].Deleted) then
     DelNPEBttn.Enabled := True
  else
     DelNPEBttn.Enabled := False;

  SaveDialog1.FileName := OpenDialog1.FileName;

  JustSaved := True;

  BuildHints(sender);
end;


procedure TForm2b.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caNone;

  if JustSaved then
    begin
      Form0.Caption := 'SelNet';
      Form0.Run1.Enabled := True;
      SaveNet.Enabled := False;
      Action := caFree;
      Form0.HandCrafted1.Enabled := True;
    end else
      case MessageDlg('Save current network?',mtConfirmation,
                       [mbYes, mbNo, mbCancel],0) of
         mrYes: begin
                  SaveNetClick(sender);
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  SaveNet.Enabled := False;
                  Action := caFree;
                  Form0.HandCrafted1.Enabled := True;
                end;

          mrNo: begin
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  SaveNet.Enabled := False;
                  Action := caFree;
                  Form0.HandCrafted1.Enabled := True;
                end;
           end{case};
end;

procedure TForm2b.Exit1Click(Sender: TObject);
begin
  if JustSaved then
    begin
      Form2b.Close;
      Form0.Caption := 'SelNet';
      Form0.Run1.Enabled := True;
      Form0.HandCrafted1.Enabled := True;
    end else
      case MessageDlg('Save current network?',mtConfirmation,
                       [mbYes, mbNo, mbCancel],0) of
         mrYes: begin
                  Form2b.Close;
                  SaveNetClick(sender);
                  Form0.Caption := 'SelNet';
                  Form0.HandCrafted1.Enabled := True;
                end;

          mrNo: begin
                  Form2b.Close;
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  SaveNet.Enabled := False;
                  Form0.HandCrafted1.Enabled := True;
                end;
           end{case};
end;


procedure TForm2b.NewNetClick(Sender: TObject);
begin
   if JustSaved then
     HandCraftNet(sender)
   else
     case MessageDlg('Save current network?',
                      mtConfirmation,[mbYes,mbNo,mbCancel],0) of
       mrYes: begin
                SaveNetClick(sender);
                HandCraftNet(sender);
              end;

       mrNo: HandCraftNet(sender);
     end{case};
end;


procedure TForm2b.FanInStringGridDblClick(Sender: TObject);
var
   c, r, value, i, j, n : Integer;
   code : Integer;
   txt, txt2, txt3, txt4, txt5 : String;
   p_i, p_i_2 : integer;
begin
  c := FanInStringGrid.Col;
  r := FanInStringGrid.Row;

  EditSigma.Color := clWhite;
  EditTau.Color := clWhite;
  EditKappa.Color := clWhite;
  EditAlpha.Color := clWhite;
  EditBeta.Color := clWhite;
  FanInStringGrid.Color := clWhite;

  val(FanInStringGrid.Cells[c,r],value,code);

  if code = 0 then
    if NPE[value].Number > Tot_Inputs then
      begin
        cur_npe := value;
        str(value,txt);
        StaticText3.Caption := txt;

        if Cur_NPE = Tot_NPEs + Tot_Inputs then
          begin
            NextBttn.Enabled := False;
            BackBttn.Enabled := True;
          end;

        if (Cur_NPE > Tot_Inputs + 1) and
           (Cur_NPE < Tot_NPEs + Tot_Inputs) then
          begin
            NextBttn.Enabled := True;
            BackBttn.Enabled := True;
          end;

        EditSigma.Text := NPE[Cur_NPE].SigmaStr;
        EditTau.Text := NPE[Cur_NPE].TauStr;
        EditKappa.Text := NPE[Cur_NPE].KappaStr;
        EditAlpha.Text := NPE[Cur_NPE].AlphaStr;
        EditBeta.Text := NPE[Cur_NPE].BetaStr;

        DefParBttn.Enabled := not NPE[Cur_NPE].Deleted;

        with NPE[Cur_NPE] do
          for p_i := 0 to Max_Pre_Inps-1 do
            begin
              FanInStringGrid.Cells[0,p_i] := PreInput[p_i+1].NumStr;
              FanInStringGrid.Cells[1,p_i] := PreInput[p_i+1].WgtStr;
            end;

     if NPE[Cur_NPE].Net_Kind <> -2 then
       case NPE[Cur_NPE].Net_Kind of
           1: begin
                sa.checked := true;
                ma.checked := false;
                vta1.checked := false;
                vta2.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;

           2: begin
                sa.checked := false;
                ma.checked := true;
                ca1.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;
       end{case};

     if NPE[Cur_NPE].Net_Kind <> -2 then
       case NPE[Cur_NPE].Net_Kind of
           1: begin
                sa.checked := true;
                ma.checked := false;
                vta1.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;

           2: begin
                sa.checked := false;
                ma.checked := true;
                ca1.checked := false;
                operant.checked := false;
                respondent1.checked := false;
                respondent2.checked := false;
              end;
       end{case};

     if NPE[Cur_NPE].NPE_Kind <> -2 then
         case NPE[Cur_NPE].NPE_Kind of
             -1: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   exc.checked := false;
                   inh.checked := true;

                   sa.checked := false;
                   ma.checked := false;

                   ca1.enabled := false;
                   ca1.checked := false;
                   vta1.enabled := false;
                   vta1.checked := false;
                   vta2.enabled := false;
                   vta2.checked := false;
                   operant.enabled := false;
                   operant.checked := false;
                   respondent1.enabled := false;
                   respondent1.checked := false;
                   respondent2.enabled := false;
                   respondent2.checked := false;
                 end;

              0: begin
                   exc.enabled := true;
                   inh.enabled := true;

                   exc.checked := true;
                   inh.checked := false;
                 end;

              3: begin
                   ca1.checked := true;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              4: begin
                   sa.checked := false;
                   ca1.checked := false;
                   vta1.checked := true;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              5: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := true;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              6: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := true;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              7: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := false;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := true;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;

              8: begin
                   sa.checked := false;
                   ca1.checked := false;
                   ma.checked := false;
                   vta1.checked := false;
                   vta2.checked := true;
                   operant.checked := false;
                   respondent1.checked := false;
                   respondent2.checked := false;

                   exc.enabled := false;
                   exc.checked := false;
                   inh.enabled := false;
                   inh.checked := false;
                 end;
         end{case} else
            begin
              sa.checked := false;
              ma.checked := false;
              exc.checked := false;
              inh.checked := false;
              ca1.checked := false;
              vta1.checked := false;
              vta2.checked := false;
              operant.checked := false;
              respondent1.checked := false;
              respondent2.checked := false;
            end;

        StaticText8.Enabled := not NPE[Cur_NPE].Deleted;
        StaticText3.Enabled := not NPE[Cur_NPE].Deleted;

        EditSigma.Enabled := not NPE[Cur_NPE].Deleted;
        EditTau.Enabled := not NPE[Cur_NPE].Deleted;
        EditKappa.Enabled := not NPE[Cur_NPE].Deleted;
        EditAlpha.Enabled := not NPE[Cur_NPE].Deleted;
        EditBeta.Enabled := not NPE[Cur_NPE].Deleted;

        FanInStringGrid.Enabled := not NPE[Cur_NPE].Deleted;

        if NPE[Cur_NPE].Deleted then
          begin
            FanInStringGrid.Font.Color := clSilver;
            sa.enabled := False;
            ma.enabled := False;
            exc.enabled := False;
            inh.enabled := False;
            ca1.enabled := False;
            vta1.enabled := False;
            operant.enabled := False;
            respondent1.enabled := False;
            respondent2.enabled := False;
          end;

        DelNPEBttn.Enabled := not NPE[Cur_NPE].Deleted;
        RecNPEBttn.Enabled := NPE[Cur_NPE].Deleted;
      end else
       { for input elements }
        begin
           FanInStringGrid.ShowHint := True;
           FanInStringGrid.Hint := '';

           with NPE[value] do
             for p_i := 1 to PostOutNPEs do
               begin
                 case NPE[PostOutput[p_i].Num].Net_Kind of
                   1: txt2 := 'sa';
                   2: txt2 := 'ma';
                 end{case};

                 case NPE[PostOutput[p_i].Num].NPE_Kind of
                  -2: txt3 := 'nil';
                   0: txt3 := 'exc';
                   1: txt3 := 'inp';
                  -1: txt3 := 'inh';
                   3: txt3 := 'ca1';
                   4: txt3 := 'vta';
                   5: txt3 := 'r';
                   6: txt3 := 'cr1';
                   7: txt3 := 'cr2';
                 end{case};

                 FanInStringGrid.Hint := FanInStringGrid.Hint +
                                     PostOutput[p_i].NumStr + ': ' +
                                     'w=' +
                                     copy(PostOutput[p_i].WgtStr,1,5) +
                                     '; ' +
                                     txt2 + ', ' + txt3 + '; In={';

                 txt4 := '';

                 if NPE[PostOutput[p_i].Num].PreInpNPEs = 0 then
                   txt4 := 'ø'
                 else
                   for p_i_2 := 1 to NPE[PostOutput[p_i].Num].PreInpNPEs do
                     begin
                       txt4 := txt4 + '(' + NPE[PostOutput[p_i].Num].
                                            PreInput[p_i_2].NumStr +
                                      ',' + copy(NPE[PostOutput[p_i].Num].
                                                 PreInput[p_i_2].WgtStr,1,5) +
                                      ')';

                       if p_i_2 < NPE[PostOutput[p_i].Num].PreInpNPEs then
                           txt4 := txt4 + ', ';
                     end;

                 FanInStringGrid.Hint := FanInStringGrid.Hint + txt4 +
                                         '}, Out={';

                 txt5 := '';

                 if NPE[PostOutput[p_i].Num].PostOutNPEs = 0 then
                   txt5 := 'ø'
                 else
                   for p_i_2 := 1 to NPE[PostOutput[p_i].Num].PostOutNPEs do
                     begin
                       txt5 := txt5 + '(' + NPE[PostOutput[p_i].Num].
                                            PostOutput[p_i_2].NumStr +
                                      ',' + copy(NPE[PostOutput[p_i].Num].
                                                 PostOutput[p_i_2].WgtStr,1,5) +
                                      ')';

                       if p_i_2 < NPE[PostOutput[p_i].Num].PostOutNPEs then
                         txt5 := txt5 + ', ';
                     end;

                   FanInStringGrid.Hint := FanInStringGrid.Hint + txt5 +
                                           '}; ';

                  if NPE[PostOutput[p_i].Num].SigmaStr = '' then
                    FanInStringGrid.Hint := FanInStringGrid.Hint + 's=0'
                  else
                    FanInStringGrid.Hint := FanInStringGrid.Hint + 's=' +
                                        NPE[PostOutput[p_i].Num].SigmaStr;

                  if NPE[PostOutput[p_i].Num].TauStr = '' then
                    FanInStringGrid.Hint := FanInStringGrid.Hint + ',t=0'
                  else
                    FanInStringGrid.Hint := FanInStringGrid.Hint + ',t=' +
                                        NPE[PostOutput[p_i].Num].TauStr;

                  if NPE[PostOutput[p_i].Num].KappaStr = '' then
                    FanInStringGrid.Hint := FanInStringGrid.Hint + ',k=0'
                  else
                    FanInStringGrid.Hint := FanInStringGrid.Hint + ',k=' +
                                        NPE[PostOutput[p_i].Num].KappaStr;

                  if NPE[PostOutput[p_i].Num].AlphaStr = '' then
                    FanInStringGrid.Hint := FanInStringGrid.Hint + ',a=0'
                  else
                    FanInStringGrid.Hint := FanInStringGrid.Hint + ',a=' +
                                        NPE[PostOutput[p_i].Num].AlphaStr;

                  if NPE[PostOutput[p_i].Num].BetaStr = '' then
                    FanInStringGrid.Hint := FanInStringGrid.Hint + ',b=0'
                  else
                    FanInStringGrid.Hint := FanInStringGrid.Hint + ',b=' +
                                        NPE[PostOutput[p_i].Num].BetaStr + '.   ';
               end;
        end;

  BuildHints(sender);
end;


procedure TForm2b.FanInStringGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  FanInStringGrid.ShowHint := False;
end;


procedure TForm2b.NPEs1Click(Sender: TObject);
begin
   PrintNPEs := True;
   PrintConnections := False;

   BuildHints(sender);

   if printdialog1.execute then
     RichEdit1.Print('Network file: ' + OpenDialog1.FileName);
end;

procedure TForm2b.Connections1Click(Sender: TObject);
begin
   PrintNPEs := False;
   PrintConnections := True;

   BuildHints(sender);

   if printdialog1.execute then
     RichEdit1.Print('Network file: ' + OpenDialog1.FileName);
end;


procedure TForm2b.vta2Click(Sender: TObject);
begin
   NPE[Cur_NPE].Net_Kind := 2;
   NPE[Cur_NPE].NPE_Kind := 8;

   sa.checked := false;
   ma.checked := false;
   ca1.checked := false;
   operant.checked := false;
   respondent1.checked := false;
   respondent2.checked := false;

   exc.enabled := false;
   inh.enabled := false;

   JustSaved := False;

   if tot_ca1_NPEs + tot_vta1_NPEs + Tot_vta2_NPEs < Max_Disc_NPEs then
     Tot_vta2_NPEs := Tot_vta2_NPEs + 1
   else
     MessageDlg('Too many discrepancy NCUs. Maximum = 25.',
                 mtError,[mbCancel],0);

  if not bttn_clicked then
    BuildHints(sender);
end;

END.


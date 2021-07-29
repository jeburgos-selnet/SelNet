unit Sn_Unit3;
{CONTINGENCY DESIGN MODULE
Last update: 09-17-2020. Added second US}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ComCtrls, Buttons, ExtCtrls, ColorGrd, checklst;

Const
     Max_NPEs = 230;
     Max_Inputs = 25; { maximum number of input elements }
     Max_Trial_Types = 50;  { maximum number of trial types }
     Max_Duration = 1000; { maximum number of ts per trial }
     Max_Op_Targets = 30; { maximum number of operant output NPEs }
     Max_Tot_Trials = 10000;

type
  TForm3 = class(TForm)
    Panel2: TPanel;
    StaticText4: TStaticText;
    EditTotTrialTypes: TEdit;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    Main1: TMenuItem;
    OpenSch: TMenuItem;
    SaveSch: TMenuItem;
    Exit1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Panel3: TPanel;
    Label10: TLabel;
    TrialTypeNextBttn: TSpeedButton;
    TrialTypeBackBttn: TSpeedButton;
    StaticText8: TStaticText;
    EditTrialTypeGoTo: TEdit;
    TrialTypeDelBttn: TButton;
    StaticText3: TStaticText;
    StaticText2: TStaticText;
    EditDuration: TEdit;
    StaticText9: TStaticText;
    EditTotTrials: TEdit;
    tsPanel: TPanel;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    tsNextBttn: TSpeedButton;
    tsBackBttn: TSpeedButton;
    Label1: TLabel;
    EdittsGoto: TEdit;
    tsInsBttn: TButton;
    tsDelBttn: TButton;
    New1: TMenuItem;
    ColorDialog1: TColorDialog;
    SpeedButton1: TSpeedButton;
    EditTrialTypeLabel: TEdit;
    StaticText1: TStaticText;
    StaticText5: TStaticText;
    GroupBox1: TGroupBox;
    ConstInpActBttn: TRadioButton;
    RandInpActBttn: TRadioButton;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    InpBackBttn: TSpeedButton;
    InpNextBttn: TSpeedButton;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    EditConstInpAct: TEdit;
    EditMinRandInpAct: TEdit;
    EditMaxRandInpAct: TEdit;
    Label2: TLabel;
    EditInputGoto: TEdit;
    StaticText17: TStaticText;
    EditTotInputs: TEdit;
    ContingencyBox: TGroupBox;
    Pavlovian1Bttn: TRadioButton;
    TarOutLabel: TStaticText;
    EditTargets: TEdit;
    GroupBox3: TGroupBox;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    NPELabel: TStaticText;
    EditNPE: TEdit;
    MinLabel: TStaticText;
    EditMinOpAct: TEdit;
    EditMaxOpAct: TEdit;
    MaxLabel: TStaticText;
    TargetBackBttn: TSpeedButton;
    TargetNextBttn: TSpeedButton;
    EditTargetGoto: TEdit;
    GotoLabel: TStaticText;
    ModeBox: TGroupBox;
    TrainBttn: TRadioButton;
    ProbeBttn: TRadioButton;
    StaticText21: TStaticText;
    N1: TMenuItem;
    Print1: TMenuItem;
    RichEdit1: TRichEdit;
    PrintDialog1: TPrintDialog;
    ResetActsCheckBox: TCheckBox;
    RDependentCheckBox: TCheckBox;
    GroupBox4: TGroupBox;
    OmissionBttn: TRadioButton;
    OperantBttn: TRadioButton;
    GroupBox2: TGroupBox;
    ConstUSActBttn: TRadioButton;
    EditConstUS2Act: TEdit;
    RandUSActBttn: TRadioButton;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    EditMinRandUSAct: TEdit;
    EditMaxRandUSAct: TEdit;
    EditMinRandUS2Act: TEdit;
    EditMaxRandUS2Act: TEdit;
    GroupBox5: TGroupBox;
    Pavlovian2Bttn: TRadioButton;
    GroupBox6: TGroupBox;
    Operant2Bttn: TRadioButton;
    Omission2Bttn: TRadioButton;
    GroupBox7: TGroupBox;
    ConstUS2ActBttn: TRadioButton;
    EditConstUSAct: TEdit;
    RandUS2ActBttn: TRadioButton;
    StaticText12: TStaticText;
    StaticText20: TStaticText;

    procedure WhiteAll(sender : TObject);
    procedure DisableGroupBox3 (sender : TObject);
    procedure EnableGroupBox3 (sender : TObject);

    procedure EditTotTrialTypesChange (Sender : TObject);
    procedure EditTotTrialsChange(Sender: TObject);
    procedure EditTrialTypeLabelChange(Sender: TObject);
    procedure EditDurationChange(Sender: TObject);
    procedure EditTotInputsChange(Sender: TObject);
    procedure EditConstInpActChange(Sender: TObject);
    procedure EditConstUSActChange(Sender: TObject);
    procedure EditConstUS2ActChange(Sender: TObject);
    procedure EditTargetsChange(Sender: TObject);
    procedure EditNPEChange(Sender: TObject);
    procedure EditMinOpActChange(Sender: TObject);
    procedure EditMaxOpActChange(Sender: TObject);
    procedure SaveSchFile(Sender: TObject);
    procedure OpenSchFile(Sender: TObject);

    procedure EditTotTrialTypesKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditTotTrialsKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditTrialTypeLabelKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditDurationKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditTargetsKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditNPEKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditMinOpActKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditMaxOpActKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditTrialTypeGoToKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EdittsGoToKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditTargetGoToKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);

    procedure EditTotTrialTypesChCl(Sender: TObject);
    procedure EditTotTrialsChCl(Sender: TObject);
    procedure EditTrialTypeLabelChCl(Sender: TObject);
    procedure EditDurationChCl(Sender: TObject);
    procedure EditConstInpActChCl(Sender: TObject);
    procedure EditMinRandInpActChCl(Sender: TObject);
    procedure EditTargetsChCl(Sender: TObject);
    procedure EditNPEChCl(Sender: TObject);
    procedure EditMinOpActChCl(Sender: TObject);
    procedure EditMaxOpActChCl(Sender: TObject);
    procedure NewSch1Click(Sender: TObject);
    procedure HandCraftSchedule (Sender : TObject);
    procedure TrialTypeNextBttnClick(Sender: TObject);
    procedure tsNextBttnClick(Sender: TObject);
    procedure TargetNextBttnClick(Sender: TObject);
    procedure TrialTypeBackBttnClick(Sender: TObject);
    procedure tsBackBttnClick(Sender: TObject);
    procedure tsInsBttnClick(Sender: TObject);
    procedure tsDelBttnClick(Sender: TObject);
    procedure TargetBackBttnClick(Sender: TObject);
    procedure TrainBttnClick(Sender: TObject);
    procedure ProbeBttnClick(Sender: TObject);
    procedure Pavlovian1BttnClick(Sender: TObject);
    procedure Operant1BttnClick(Sender: TObject);
    procedure Omission1BttnClick(Sender: TObject);
    procedure TrialTypeDelBttnClick(Sender: TObject);
    procedure EditTrialTypeGoToChange(Sender: TObject);
    procedure EdittsGoToChange(Sender: TObject);
    procedure EditTargetGoToChange(Sender: TObject);
    procedure SaveSchClick(Sender: TObject);
    procedure OpenSchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ConstInpActBttnClick(Sender: TObject);
    procedure RandInpActBttnClick(Sender: TObject);
    procedure EditMinRandInpActChange(Sender: TObject);
    procedure EditMaxRandInpActChange(Sender: TObject);
    procedure EditMinRandInpActKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditTotInputsChCl(Sender: TObject);
    procedure EditTotInputsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InpNextBttnClick(Sender: TObject);
    procedure InpBackBttnClick(Sender: TObject);
    procedure EditConstInpActKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditMinRandUSActChCl(Sender: TObject);
    procedure EditMinRandUSActChange(Sender: TObject);
    procedure EditMinRandUSActKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditMinRandUS2ActChCl(Sender: TObject);
    procedure EditMinRandUS2ActChange(Sender: TObject);
    procedure EditMinRandUS2ActKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditMaxRandInpActChCl(Sender: TObject);
    procedure EditMaxRandInpActKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditInputGotoChange (Sender: TObject);
    procedure EditInputGoToKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InpInsBttnClick(Sender: TObject);
    procedure EditMaxRandUSActChange(Sender: TObject);
    procedure EditMaxRandUS2ActChange(Sender: TObject);
    procedure ConstUSActBttnClick(Sender: TObject);
    procedure RandUSActBttnClick(Sender: TObject);
    procedure EditConstUSActKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditConstUS2ActKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditConstUSActChCl(Sender: TObject);
    procedure EditMaxRandUSActChCl(Sender: TObject);
    procedure EditMaxRandUSActKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditConstUS2ActChCl(Sender: TObject);
    procedure EditMaxRandUS2ActChCl(Sender: TObject);
    procedure EditMaxRandUS2ActKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DelTargetBttnClick(Sender: TObject);
    procedure BuildHint(sender: tobject);
    procedure Print1Click(Sender: TObject);
    procedure PhasicCueBttnClick(Sender: TObject);
    procedure TonicCueBttnClick(Sender: TObject);
    procedure RDependentCheckBoxClick(Sender: TObject);
    procedure Pavlovian2BttnClick(Sender: TObject);
    procedure ConstUS2ActBttnClick(Sender: TObject);
    procedure RandUS2ActBttnClick(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
  end;

var
  Form3: TForm3;

  Trial_Type: Array [1..Max_Trial_Types] of
                Record
                  Number,
                  Duration,
                  cur_ts,
                  Tot_Trials: integer;

                  Color : LongInt;
                  Lab : String[15];

                  Mode {0 = training, 1 = probe},
                  Cue {0 = phasic, 1 = tonic; 10/07/01} : 0..1;

                  ts: Array [1..Max_Duration] of
                        Record
                          cur_input : Integer;

                         {RDependent: Sensory feedback (01/21/05}
                          RDependent, InpActMode : Array[1..Max_Inputs] of 0..1;

                          Const_Inp_Act,
                          Min_Rand_Inp_Act,
                          Max_Rand_Inp_Act : Array [1..Max_Inputs] of
                                             extended;

                          Const_Inp_Act_Str,
                          Min_Rand_Inp_Act_Str,
                          Max_Rand_Inp_Act_Str : Array[1..Max_Inputs] of
                                                 String;

                          USActMode : -1..3; (*-1 = no mode
                                                0 = constant US1 activation
                                                1 = random US1 activation
                                                2 = constant US2 activation
                                                3 = random US2 activation*)

                          Const_US_Act,
                          Min_Rand_US_Act,
                          Max_Rand_US_Act,
                          Const_US2_Act,
                          Min_Rand_US2_Act,
                          Max_Rand_US2_Act: extended;

                          Const_US_Act_Str, Const_US2_Act_Str,
                          Min_Rand_US_Act_Str, Min_Rand_US2_Act_Str,
                          Max_Rand_US_Act_Str, Max_Rand_US2_Act_Str: String;

                          Contingency : 0..2; { 2 = omission; 01/21/05}

                          cur_op_target,
                          Tot_Op_Targets : Integer;

                          Op_Target : Array [1..Max_Op_Targets] of
                                        Record
                                          op_npe : integer;
                                          min_op_act, max_op_act: extended;
                                          op_npe_str,
                                          min_op_act_str,
                                          max_op_act_str : String;
                                        end;
                        end;
                end;

   Tot_Trial_Types, tot_inputs,
   cur_trial_type,
   TotOverallTrials : Integer;

   Sch_FileName : String[255];
   Sf : Text;

   JustSaved, OpenSchRequest, GroupBox3Enabled : Boolean;

   RstActs : 0..1; { added 05/14/03: 0 = do not reset acts. at trial onset;
                                     1 = reset acts. at trial onset }

implementation

uses Sn_Unit0;

{$R *.DFM}

procedure TForm3.BuildHint (Sender : TObject);
var
  i, c, t, s, tar : Integer;
  txt0, txt5, txt6, txt7, txt8, op_npe_txt,
  txt1, txt2, txt3, txt3b, txt4, txt4a,
  tr_txt, ts_str, cl, s_str, tot_txt : String;
begin
  statictext4.hint := ''; {stimulus type}

  txt0 := '';
  tot_txt := '';

  for i := 1 to Tot_Trial_Types do
    with Trial_Type[i] do
      begin
        str(i,txt0);
        txt0 := 'Input pattern type ' + txt0;
        str(Tot_Trials,txt1);
        str(Duration,txt2);

        Case color of
          clBlue: cl := 'blue';
          clGreen: cl := 'green';
          clAqua: cl := 'aqua';
          clTeal: cl := 'teal';
          clLime: cl := 'lime';
          clFuchsia: cl := 'fuchsia';
          clOlive: cl := 'olive';
          clNavy: cl := 'navy';
          clPurple: cl := 'purple';
          clSilver: cl := 'silver';
          clGray: cl := 'gray';
          clBlack: cl := 'black';
        end{case};

        case mode of
          0: txt3 := 'learning enabled';
          1: txt3 := 'learning disabled';
        end{case};

        if tot_trials > 1 then
          tr_txt := ' trials, '
        else
          tr_txt := ' trial, ';

        txt4 := '';

        for t := 1 to duration do
          with ts[t] do
            begin
              str(t,ts_str);
              txt4 := txt4 + 'ts=' + ts_str + ': ';

              txt5 := '';

              for s := 1 to tot_inputs do
                begin
                  case RDependent[s] of
                    0: txt5 := txt5 + 'not RD, ';
                    1: txt5 := txt5 + 'RD, ';
                  end{case};

                  case InpActMode[s] of
                    0: txt5 := txt5 + const_inp_act_str[s];
                    1: txt5 := txt5 + '[' +
                               min_rand_inp_act_str[s] + ',' +
                               max_rand_inp_act_str[s] + ']';
                  end{case};

                  if s < tot_inputs then
                    txt5 := txt5 + ', ';
                end;

              txt4 := txt4 + 'S=(' + txt5 + '), ';

              case UsActMode of
                0: txt6 := const_us_act_str + ', ';
                1: txt6 := '[' + min_rand_us_act_str + ',' +
                                 max_rand_us_act_str + '], ';
                2: txt6 := const_us2_act_str + ', ';
                3: txt6 := '[' + min_rand_us2_act_str + ',' +
                                 max_rand_us2_act_str + '], ';
              end{case};

              txt4 := txt4 + 'S*=' + txt6;

              case contingency of
                0: if t < duration then txt7 := 'S-dependent;  '
                   else txt7 := 'S-dependent.    ';
                1: txt7 := 'R-dependent+, ';
                2: txt7 := 'R-dependent-, ';
              end{case};

              txt4 := txt4 + txt7;

              if (contingency = 1) or (contingency = 2) then
                begin
                  txt8 := 'R={(';

                  for tar := 1 to Tot_Op_Targets do
                    with op_target[tar] do
                      begin
                        str(op_npe,op_npe_txt);
                        txt8 := txt8 + op_npe_txt + ',[' +
                                min_op_act_str + ',' +
                                max_op_act_str + '])';

                        if tar < Tot_Op_Targets then
                          txt8 := txt8 + ', (';
                      end;

                  txt8 := txt8 + '};  ';
                end else
                  txt8 := '';

              txt4 := txt4 + txt8;
            end;

        tot_txt := tot_txt + txt0 + ': ' + txt1 + tr_txt + txt2 + ' ts, ' +
                   Lab + ', ' + cl + ', ' + txt3 + ';  ' +
                   ';  ' + txt4;
      end;

  StaticText4.Hint := tot_txt;

  RichEdit1.Text := caption + '   -   ' + StaticText4.Hint;
end;

procedure TForm3.NewSch1Click(Sender: TObject);
begin
   if JustSaved then
     HandCraftSchedule(sender)
   else
     case MessageDlg('Save current arrangement?',
                      mtConfirmation,[mbYes,mbNo,mbCancel],0) of
       mrYes: begin
                SaveSchClick(sender);
                HandCraftSchedule(sender);
              end;

       mrNo: HandCraftSchedule(sender);
     end{case};
end;

procedure TForm3.HandCraftSchedule (Sender : TObject);
var
   i, t, j, ot : integer;
   txt : String[5];

function randomcolor : LongInt;
var
   r, g, b : Byte;
begin
     r := Random(255);
     g := Random(255);
     b := Random(255);

     randomcolor := r or (g shl 8) or (b shl 16);
end;

begin
     if OpenDialog1.FileName = '' then
        Form3.Caption := 'New contingency arrangement'
     else
         begin
              Caption := OpenDialog1.FileName;
              SaveDialog1.FileName := OpenDialog1.FileName;
         end;

     tot_trial_types := 1;
     Cur_Trial_Type := 1;
     tot_inputs := 1;

     statictext3.caption := '1';

     EditTotTrialTypes.Text := '1';
     EditTotInputs.Text := '1';
     EditTotTrials.Text := '1';
     EditDuration.Text := '1';
     EditConstInpAct.Text := '0';
     EditMinRandInpAct.Text := '0';
     EditMaxRandInpAct.Text := '1';
     EditConstUSAct.Text := '0';
     EditConstUS2Act.Text := '0';
     EditMinRandUSAct.Text := '0';
     EditMaxRandUSAct.Text := '1';
     EditMinRandUS2Act.Text := '0';
     EditMaxRandUS2Act.Text := '1';
     EditTargets.Text := '1';

     TrialTypeNextBttn.Enabled := False;
     TrialTypeBackBttn.Enabled := False;
     TrialTypeDelBttn.Enabled := False;
     tsNextBttn.Enabled := False;
     tsBackBttn.Enabled := False;
     tsDelBttn.Enabled := False;
     InpNextBttn.Enabled := False;
     InpBackBttn.Enabled := False;
     targetNextBttn.Enabled := False;
     targetBackBttn.Enabled := False;

     TrainBttn.Checked := True;
     ProbeBttn.Checked := False;
     Pavlovian1Bttn.Checked := True;
     OperantBttn.Checked := False;
     TarOutLabel.Enabled := False;
     StaticText6.Enabled := False;
     StaticText7.Enabled := False;

     EditMinOpAct.Enabled := False;
     EditMaxOpAct.Enabled := False;

     RstActs := 0;

     for i := 1 to Max_Trial_Types do
         with Trial_Type[i] do
              begin
                   Number := i;
                   tot_trials := 1;
                   Str(number,txt);
                   Lab := 'S' + txt;
                   Duration := 1;
                   Mode := 0;
                   Cue := 0;
                   cur_ts := 1;

                   Case i of
                        1: Color := clBlue;
                        2: Color := clAqua;
                        3: Color := clLime;
                        4: Color := clSilver;
                        5: Color := clFuchsia;
                        6: Color := clOlive;
                        7: Color := clGray;
                        8: Color := clPurple;
                        9: Color := clGreen;
                       10: Color := clTeal;
                       11: Color := clNavy;
                       12: Color := clBlack;
                   end{case};

                   if i > 12 then
                      color := RandomColor;

                   for t := 1 to Max_Duration do
                     with ts[t] do
                       begin
                            cur_input := 1;

                            for j := 1 to Max_Inputs do
                                begin
                                     RDependent[j] := 0;
                                     InpActMode[j] := 0;

                                     const_inp_act[j] := 0;
                                     min_rand_inp_act[j] := 0;
                                     max_rand_inp_act[j] := 1;

                                     const_inp_act_str[j] := '0';
                                     min_rand_inp_act_str[j] := '0';
                                     max_rand_inp_act_str[j] := '1';
                                end;

                          (*defaults*)
                            USActMode := -1;(* no US activation mode at start*)

                            const_US_Act := 0;
                            min_rand_US_act := 0;
                            max_rand_US_act := 1;

                            const_US_Act_str := '0';
                            min_rand_US_act_str := '0';
                            max_rand_US_act_str := '1';

                            const_US2_Act := 0;
                            min_rand_US2_act := 0;
                            max_rand_US2_act := 1;

                            const_US2_Act_str := '0';
                            min_rand_US2_act_str := '0';
                            max_rand_US2_act_str := '1';

                            Contingency := 0;

                            cur_op_target := 1;
                            Tot_Op_Targets := 1;

                            for ot := 1 to Max_Op_Targets do
                                with Op_Target[ot] do
                                     begin
                                          op_npe := 1; { what should this default be? hmmm... }
                                          Min_Op_Act := 0;
                                          Max_Op_Act := 1;

                                          op_npe_str:='1';
                                          Min_Op_Act_Str := '0';
                                          Max_Op_Act_Str := '1';
                                     end;
                       end;
              end;

     Panel2.Visible := True;
     Panel3.Visible := True;

     JustSaved := True;

     EditTotTrialTypes.SetFocus;

     BuildHint(sender);
end;

Procedure TForm3.DisableGroupBox3 (sender : TObject);
Begin
     GroupBox3Enabled := False;
     TarOutLabel.Enabled := False;
     EditTargets.Enabled := False;
     StaticText6.Enabled := False;
     StaticText7.Enabled := False;
     NPELabel.Enabled := False;
     EditNPE.Enabled := False;
     StaticText21.Enabled := False;
     MinLabel.Enabled := False;
     MaxLabel.Enabled := False;
     EditMinOpAct.Enabled := False;
     EditMaxOpAct.Enabled := False;
     GotoLabel.Enabled := False;
     EditTargetGoto.Enabled := False;
End;

Procedure TForm3.EnableGroupBox3 (sender : TObject);
Begin
     GroupBox3Enabled := True;
     TarOutLabel.Enabled := True;
     EditTargets.Enabled := True;
     StaticText6.Enabled := True;
     StaticText7.Enabled := True;
     NPELabel.Enabled := True;
     EditNPE.Enabled := True;
     StaticText21.Enabled := True;
     MinLabel.Enabled := True;
     MaxLabel.Enabled := True;
     EditMinOpAct.Enabled := True;
     EditMaxOpAct.Enabled := True;
     GotoLabel.Enabled := True;
     EditTargetGoto.Enabled := True;
End;

procedure TForm3.WhiteAll (sender : TObject);
begin
     EditTotTrialTypes.Color := clWhite;
     EditTotInputs.Color := clWhite;
     EditTotTrials.Color := clWhite;
     EditDuration.Color := clWhite;
     EditConstInpAct.Color := clWhite;
     EditMinRandInpAct.Color := clWhite;
     EditMaxRandInpAct.Color := clWhite;
     EditConstUSAct.Color := clWhite;
     EditMinRandUSAct.Color := clWhite;
     EditMaxRandUSAct.Color := clWhite;
     EditConstUS2Act.Color := clWhite;
     EditMinRandUS2Act.Color := clWhite;
     EditMaxRandUS2Act.Color := clWhite;
     EditTargets.Color := clWhite;
     EditNPE.Color := clWhite;
     EditMinOpAct.Color := clWhite;
     EditMaxOpAct.Color := clWhite;
end;

procedure TForm3.EditTotTrialTypesChange (Sender: TObject);
Var
    txt : String[255];
    prev_val, cur_val, code, i, pi, ctt : Integer;
begin
  prev_val := Tot_Trial_Types;
  Val(EditTotTrialTypes.Text,cur_val,Code);

  if code <> 0 then
    begin
      MessageDlg('Only whole positive numeric values.', mtError,[mbOk],0);
      str(Tot_Trial_Types,txt);
      EditTotTrialTypes.Text := txt;
      EditTotTrialTypes.SetFocus;
    end else
       begin
         if cur_val <= 1 then
           Tot_Trial_Types := 1;

         if cur_val >= Max_Trial_Types then
           Tot_Trial_Types := Max_Trial_Types;

         if (cur_val > 1) and (cur_val < Max_Trial_Types) then
           Tot_Trial_Types := cur_val;

         Str(Tot_Trial_Types,txt);
         EditTotTrialTypes.Text := txt;

         if cur_trial_type > Tot_Trial_Types then
           begin
             cur_trial_type := Tot_Trial_Types;
             TrialTypeNextBttn.Enabled := False;

             with trial_type[cur_trial_type] do
               begin
                 str(number,txt);
                 statictext3.caption := txt;
                 EditTotTrialTypes.Text := txt;

                 Str(Duration,txt);
                 EditDuration.Text := txt;

                 Str(Tot_Trials,txt);
                 EditTotTrials.Text := txt;

                 EditTrialTypeLabel.Text := Lab;
                 ColorDialog1.Color := Color;

                 Case Mode of
                   0: TrainBttn.Checked := True;
                   1: ProbeBttn.Checked := True;
                 end{case};

                 str(cur_ts,txt);
                 StaticText11.Caption := txt;

                 with ts[cur_ts] do
                   begin
                     Case RDependent[cur_input] of
                       0: begin
                            RDependentCheckBox.Checked := False;
                            DisableGroupBox3(sender);
                          end;

                       1: begin
                            RDependentCheckBox.Checked := True;
                            EnableGroupBox3(sender);
                          end;
                     end{case};

                     Case InpActMode[cur_input] of
                       0: begin
                            ConstInpActBttn.Checked := True;
                            EditConstInpAct.Enabled := True;
                            EditMinRandInpAct.Enabled := False;
                            EditMaxRandInpAct.Enabled := False;
                          end;

                       1: begin
                            RandInpActBttn.Checked := True;
                            EditConstInpAct.Enabled := False;
                            EditMinRandInpAct.Enabled := True;
                            EditMaxRandInpAct.Enabled := True;
                          end;
                     end{case};

                     str(cur_input,txt);
                     StaticText19.Caption := txt;

                     str(tot_inputs,txt);
                     EditTotInputs.Text := txt;
                     EditConstInpAct.Text := const_Inp_Act_Str[cur_input];

                     Case USActMode of
                       0: begin
                            ConstUSActBttn.Checked := True;
                            EditConstUSAct.Enabled := True;
                            RandUSActBttn.Checked := False;
                            EditMinRandUSAct.Enabled := False;
                            EditMaxRandUSAct.Enabled := False;
                            ConstUS2ActBttn.Checked := False;
                            EditConstUS2Act.Enabled := False;
                            RandUS2ActBttn.Checked := False;
                            EditMinRandUS2Act.Enabled := False;
                            EditMaxRandUS2Act.Enabled := False;
                          end;

                       1: begin
                            ConstUSActBttn.Checked := False;
                            EditConstUSAct.Enabled := False;
                            RandUSActBttn.Checked := True;
                            EditMinRandUSAct.Enabled := True;
                            EditMaxRandUSAct.Enabled := True;
                            ConstUS2ActBttn.Checked := False;
                            EditConstUS2Act.Enabled := False;
                            RandUS2ActBttn.Checked := False;
                            EditMinRandUS2Act.Enabled := False;
                            EditMaxRandUS2Act.Enabled := False;
                          end;

                       2: begin
                            ConstUSActBttn.Checked := False;
                            EditConstUSAct.Enabled := False;
                            RandUSActBttn.Checked := False;
                            EditMinRandUSAct.Enabled := False;
                            EditMaxRandUSAct.Enabled := False;
                            ConstUS2ActBttn.Checked := True;
                            EditConstUS2Act.Enabled := True;
                            RandUS2ActBttn.Checked := False;
                            EditMinRandUS2Act.Enabled := False;
                            EditMaxRandUS2Act.Enabled := False;
                          end;

                       3: begin
                            ConstUSActBttn.Checked := False;
                            EditConstUSAct.Enabled := False;
                            RandUSActBttn.Checked := False;
                            EditMinRandUSAct.Enabled := False;
                            EditMaxRandUSAct.Enabled := False;
                            ConstUS2ActBttn.Checked := False;
                            EditConstUS2Act.Enabled := False;
                            RandUS2ActBttn.Checked := True;
                            EditMinRandUS2Act.Enabled := True;
                            EditMaxRandUS2Act.Enabled := True;
                          end;
                     end{case};

                     EditConstUSAct.Text := ts[cur_ts].const_US_Act_Str;

                     Case Contingency of
                       0: begin
                            Pavlovian1Bttn.Checked := True;

                            if (not RDependentCheckBox.Checked) then
                              DisableGroupBox3(sender)
                            else
                               EnableGroupBox3(sender);
                          end;

                     1,2: begin
                            str(Tot_Op_Targets,txt);
                            EditTargets.Text := txt;
                            str(Cur_Op_Target,txt);
                            StaticText7.Caption := txt;

                            if Contingency = 1 then
                                OperantBttn.Checked := True
                            else
                                OmissionBttn.Checked := True;

                            EnableGroupBox3(sender);

                            str(Op_Target[cur_op_target].op_npe,txt);

                            EditNPE.Text := txt;

                            EditMinOpAct.Text := Op_Target[cur_op_target].
                                                 min_Op_Act_str;

                            EditMaxOpAct.Text := Op_Target[cur_op_target].
                                                 max_Op_Act_str;

                            if Tot_Op_Targets <= 1 then
                              begin
                                TargetNextBttn.Enabled := False;
                                TargetBackBttn.Enabled := False;
                              end else
                                begin
                                  if (Cur_Op_Target >= Tot_Op_Targets) and
                                     (tot_op_targets > 0) then
                                    begin
                                      TargetNextBttn.Enabled := False;
                                      TargetBackBttn.Enabled := True;
                                    end;

                                  if (cur_op_target<tot_op_targets) and
                                     (cur_op_target > 1) then
                                    begin
                                      TargetNextBttn.Enabled := True;
                                      TargetBackBttn.Enabled := true;
                                    end;

                                  if cur_op_target = 1 then
                                    begin
                                      TargetNextBttn.Enabled := True;
                                      TargetBackBttn.Enabled := False;
                                    end;
                                end;
                          end;
                     end{case};

                     if Tot_Trial_Types = 1 then
                       begin
                         TrialTypeNextBttn.Enabled := False;
                         TrialTypeBackBttn.Enabled := False;
                         TrialTypeDelBttn.Enabled := False;
                       end else
                         begin
                           if Cur_trial_type = tot_trial_types then
                             begin
                               TrialTypeNextBttn.Enabled := False;

                               if tot_trial_types > 1 then
                                 begin
                                   TrialTypeBackBttn.Enabled := True;
                                   TrialTypeDelBttn.Enabled := True;
                                 end else
                                   begin
                                     TrialTypeBackBttn.Enabled := False;
                                     TrialTypeDelBttn.Enabled := False;
                                   end;
                             end;

                           if (cur_trial_type < tot_trial_types) and
                              (cur_trial_type > 1) then
                             begin
                               TrialTypeNextBttn.Enabled := True;
                               TrialTypeBackBttn.Enabled := true;
                               TrialTypeDelBttn.Enabled := True;
                             end;

                           if cur_trial_type = 1 then
                             begin
                               TrialTypeNextBttn.Enabled := True;
                               TrialTypeBackBttn.Enabled := False;

                               if tot_trial_types > 1 then
                                 TrialTypeDelBttn.Enabled := True
                               else
                                 TrialTypeDelBttn.Enabled := False;
                             end;
                         end;

                     if Duration = 1 then
                       begin
                         tsNextBttn.Enabled := False;
                         tsBackBttn.Enabled := False;
                       end else
                         begin
                           if Cur_ts >= Duration then
                             begin
                               tsNextBttn.Enabled := False;
                               tsBackBttn.Enabled := True;
                             end;

                           if (cur_ts < Duration) and (cur_ts > 1) then
                             begin
                               tsNextBttn.Enabled := True;
                               tsBackBttn.Enabled := true;
                             end;

                           if cur_ts = 1 then
                             begin
                               tsNextBttn.Enabled := True;
                               tsBackBttn.Enabled := False;
                             end;
                         end;

                       if Tot_Inputs = 1 then
                         begin
                           InpNextBttn.Enabled := False;
                           InpBackBttn.Enabled := False;
                         end else
                           begin
                             if Cur_input >= tot_inputs then
                               begin
                                 InpNextBttn.Enabled := False;
                                 InpBackBttn.Enabled := True;
                               end;

                             if (cur_input < tot_inputs) and
                                (cur_input > 1) then
                               begin
                                 InpNextBttn.Enabled := True;
                                 InpBackBttn.Enabled := true;
                               end;

                             if cur_input = 1 then
                               begin
                                 InpNextBttn.Enabled := True;
                                 InpBackBttn.Enabled := False;
                               end;
                           end;
                   end;
               end;
           end;
       end;

  if tot_trial_types > 1 then
    TrialTypeDelBttn.Enabled := True
  else
    TrialTypeDelBttn.Enabled := False;

  If cur_trial_type < tot_trial_types then
     TrialTypeNextBttn.Enabled := True
  else
      TrialTypeNextBttn.Enabled := False;

  if cur_trial_type > 1 then
     TrialTypeBackBttn.Enabled := True
  else
      TrialTypeBackBttn.Enabled := False;

  TotOverallTrials := 0;

  for ctt := 1 to Tot_Trial_Types do
      TotOverallTrials := TotOverallTrials + Trial_Type[ctt].Tot_Trials;

  Str(TotOverallTrials,txt);
  StaticText5.Caption := 'Overall # of trials:  ' + txt;

  if cur_val <> prev_val then
    begin
      JustSaved := False;
      EditTotTrialTypes.Color := clYellow
    end else
      EditTotTrialTypes.Color := clWhite;
end;

procedure TForm3.EditTotInputsChange(Sender: TObject);
Var
   prev_val, cur_val, Code, i : Integer;
   txt : String[2];
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

                 with trial_type[cur_trial_type] do
                   with ts[cur_ts] do
                     begin
                       if cur_input > Tot_Inputs then
                         begin
                           cur_input := Tot_Inputs;

                           str(cur_input,txt);
                           statictext19.caption := txt;

                           EditConstInpAct.Text :=
                           const_inp_act_str[cur_input];

                           EditMinRandInpAct.Text :=
                           min_rand_inp_act_str[cur_input];

                           EditMaxRandInpAct.Text :=
                           max_rand_inp_act_str[cur_input];
                         end;

                       if (cur_input < tot_inputs) then
                         InpNextBttn.Enabled := True
                       else
                         InpNextBttn.Enabled := False;

                       if cur_input > 1 then
                         InpBackBttn.Enabled := True
                       else
                         InpBackBttn.Enabled := False;
                     end;
            end;

     if cur_val <> prev_val then
        begin
             JustSaved := False;
             EditTotInputs.Color := clYellow
        end else
            EditTotInputs.Color := clWhite;
end;


procedure TForm3.EditDurationChange(Sender: TObject);
Var
   Code, prev_val, cur_val, pi : Integer;
   txt : String[5];
begin
  prev_val := Trial_Type[cur_trial_type].Duration;
  Val(EditDuration.Text,cur_val,Code);

  if code <> 0 then
    begin
      MessageDlg('Only whole positive numeric values.',mtError,[mbOk],0);
      str(Trial_Type[cur_trial_type].Duration,txt);
      EditDuration.Text := txt;
      EditDuration.SetFocus;
    end else
      with Trial_Type[cur_trial_type] do
        begin
          if cur_val < 1 then
            Duration := 1;

          if cur_val > Max_Duration then
            Duration := Max_Duration;

          if (cur_val >= 1) and (cur_val <= Max_Duration) then
            Duration := cur_val;

          Str(Duration,txt);
          EditDuration.Text := txt;

          if duration > 1 then
            tsDelBttn.Enabled := True
          else
            tsDelBttn.Enabled := False;

          if cur_ts > duration then
            begin
              cur_ts := Duration;
              str(cur_ts,txt);
              statictext11.caption := txt;
              EditDuration.Text := txt;
              tsNextBttn.Enabled := False;

              with ts[cur_ts] do
                begin
                   Case RDependent[cur_input] of
                       0: begin
                            RDependentCheckBox.Checked := False;
                            DisableGroupBox3(sender);
                          end;

                       1: begin
                            RDependentCheckBox.Checked := True;
                            EnableGroupBox3(sender);
                          end;
                   end{case};

                  Case InpActMode[cur_input] of
                      0: begin
                              ConstInpActBttn.Checked := True;
                              EditConstInpAct.Enabled := True;
                              EditMinRandInpAct.Enabled := False;
                              EditMaxRandInpAct.Enabled := False;
                         end;

                      1: begin
                              RandInpActBttn.Checked := True;
                              EditConstInpAct.Enabled := False;
                              EditMinRandInpAct.Enabled := True;
                              EditMaxRandInpAct.Enabled := True;
                         end;
                  end{case};

                  Case USActMode of
                      0: begin
                              ConstUSActBttn.Checked := True;
                              EditConstUSAct.Enabled := True;
                              EditMinRandUSAct.Enabled := False;
                              EditMaxRandUSAct.Enabled := False;
                         end;

                      1: begin
                              RandUSActBttn.Checked := True;
                              EditConstUSAct.Enabled := False;
                              EditMinRandUSAct.Enabled := True;
                              EditMaxRandUSAct.Enabled := True;
                         end;

                      2: begin
                              ConstUS2ActBttn.Checked := True;
                              EditConstUS2Act.Enabled := True;
                              EditMinRandUS2Act.Enabled := False;
                              EditMaxRandUS2Act.Enabled := False;
                         end;

                      3: begin
                              RandUS2ActBttn.Checked := True;
                              EditConstUS2Act.Enabled := False;
                              EditMinRandUS2Act.Enabled := True;
                              EditMaxRandUS2Act.Enabled := True;
                         end;
                  end{case};

                  EditConstInpAct.Text := const_Inp_Act_Str[cur_input];
                  EditMinRandInpAct.Text := min_rand_Inp_Act_Str[cur_input];
                  EditMaxRandInpAct.Text := max_rand_Inp_Act_Str[cur_input];
                  EditConstUSAct.Text := const_US_Act_Str;
                  EditMinRandUSAct.Text := min_rand_US_Act_Str;
                  EditMaxRandUSAct.Text := max_rand_US_Act_Str;
                  EditConstUS2Act.Text := const_US2_Act_Str;
                  EditMinRandUS2Act.Text := min_rand_US2_Act_Str;
                  EditMaxRandUS2Act.Text := max_rand_US2_Act_Str;

                  Case Contingency of
                    0: begin
                         Pavlovian1Bttn.Checked := True;

                         if (not RDependentCheckBox.Checked) then
                           DisableGroupBox3(sender)
                         else
                            EnableGroupBox3(sender);
                       end;

                  1,2: begin
                         str(Tot_Op_Targets,txt);
                         EditTargets.Text := txt;
                         str(Cur_Op_Target,txt);
                         StaticText7.Caption := txt;

                         if Contingency = 1 then
                           OperantBttn.Checked := True
                         else
                            OmissionBttn.Checked := True;

                         EnableGroupBox3(sender);

                         str(Op_Target[cur_op_target].op_npe,txt);

                         EditNPE.Text := txt;

                         EditMinOpAct.Text := Op_Target[cur_op_target].
                                              min_Op_Act_str;

                         EditMaxOpAct.Text := Op_Target[cur_op_target].
                                              max_Op_Act_str;

                         if Tot_Op_Targets = 1 then
                           begin
                             TargetNextBttn.Enabled := False;
                             TargetBackBttn.Enabled := False;
                           end else
                             begin
                               if (Cur_Op_Target >= Tot_Op_Targets) and
                                  (tot_op_targets > 0) then
                                 begin
                                   TargetNextBttn.Enabled := False;
                                   TargetBackBttn.Enabled := True;
                                 end;

                               if (cur_op_target<tot_op_targets) and
                                  (cur_op_target > 1) then
                                 begin
                                   TargetNextBttn.Enabled := True;
                                   TargetBackBttn.Enabled := true;
                                 end;

                               if cur_op_target = 1 then
                                 begin
                                   TargetNextBttn.Enabled := True;
                                   TargetBackBttn.Enabled := False;
                                 end;
                             end;
                       end;
                  end{case};
                end;
            end;

          If cur_ts < duration then
            tsNextBttn.Enabled := True
          else
            tsNextBttn.Enabled := False;

          if cur_ts > 1 then
            tsBackBttn.Enabled := True
          else
            tsBackBttn.Enabled := False;
        end;

  if cur_val <> prev_val then
    begin
      JustSaved := False;
      EditDuration.Color := clYellow
    end else
      EditDuration.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditTotTrialsChange(Sender: TObject);
Var
   Code, prev_val, cur_val, i, ctt : Integer;
   txt : String[5];
begin
  prev_val := Trial_Type[Cur_Trial_Type].Tot_Trials;
  Val(EditTotTrials.Text,cur_val,Code);

  if code <> 0 then
    begin
      MessageDlg('Only one or larger values.', mtError,[mbOk],0);
      str(Trial_Type[Cur_Trial_Type].Tot_Trials,txt);
      EditTotTrials.Text := txt;
      EditTotTrials.SetFocus;
    end else
      begin
        if cur_val <= 1 then
          begin
            Trial_Type[Cur_Trial_Type].Tot_Trials := 1;
            EditTotTrials.Text := '1';
          end;

        if cur_val >= Max_Tot_Trials then
          begin
            Trial_Type[Cur_Trial_Type].tot_trials := Max_Tot_Trials;
            str(Trial_Type[Cur_Trial_Type].tot_trials,txt);
            EditTotTrials.Text := txt;
          end;

        if (cur_val > 1) and (cur_val < Max_Tot_Trials) then
          begin
            Trial_Type[Cur_Trial_Type].tot_trials := cur_val;
            str(Trial_Type[Cur_Trial_Type].tot_trials,txt);
            EditTotTrials.Text := txt;
          end;
      end;

  TotOverallTrials := 0;

  for ctt := 1 to Tot_Trial_Types do
    TotOverallTrials := TotOverallTrials + Trial_Type[ctt].Tot_Trials;

  Str(TotOverallTrials,txt);
  StaticText5.Caption := 'Overall # of trials:  ' + txt;

  if cur_val <> prev_val then
    begin
      JustSaved := False;
      EditTotTrials.Color := clYellow
    end else
      EditTotTrials.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditTrialTypeLabelChange(Sender: TObject);
Var
   Code : Integer;
   prev_str, cur_str : String;
begin
  prev_str := Trial_Type[cur_trial_type].lab;
  cur_str := EditTrialTypeLabel.Text;

  Trial_Type[cur_trial_type].Lab := cur_str;

  if cur_str <> prev_str then
    begin
      JustSaved := False;
      EditTrialTypeLabel.Color := clYellow
    end else
      EditTrialTypeLabel.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditConstInpActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := const_inp_Act[cur_input];
        prev_str := const_inp_Act_Str[cur_input];

        Val(EditConstInpAct.Text,cur_val,Code);

        cur_str := EditConstInpAct.Text;

        if ((code <> 0) or (EditConstInpAct.Text = '.')) and
           (EditConstInpAct.Text <> '')  then
          begin
            MessageDlg('Only numeric values between 0 and 1.',mtError,[mbOk],0);
            EditConstInpAct.Text := prev_str;
            EditConstInpAct.SetFocus;
          end else
            begin
              if cur_val <= 0 then
                begin
                  const_inp_Act[cur_input] := 0;
                  const_inp_Act_str[cur_input] := '0';
                  EditConstInpAct.Text := '0';
                  cur_str := '0';
                end;

              if cur_val >= 1 then
                begin
                  const_inp_Act[cur_input] := 1;
                  const_inp_Act_str[cur_input] := '1';
                  EditConstInpAct.Text := '1';
                  cur_str := '1';
                end;

              if (cur_val > 0) and (cur_val < 1) then
                begin
                  const_inp_Act[cur_input] := cur_val;
                  const_inp_Act_str[cur_input] := cur_str;
                end;
            end;
      end;

  if cur_str <> prev_str then
    begin
      JustSaved := False;
      EditConstInpAct.Color := clYellow
    end else
      EditConstInpAct.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditMinRandInpActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := min_rand_inp_Act[cur_input];
        prev_str := min_rand_inp_Act_Str[cur_input];

        Val(EditMinRandInpAct.Text,cur_val,Code);

        cur_str := EditMinRandInpAct.Text;

        if ((code <> 0) or (EditMinRandInpAct.Text = '.')) and
           (EditMinRandInpAct.Text <> '')  then
          begin
            MessageDlg('Only numeric values between 0 and 1.',
                        mtError,[mbOk],0);
            EditMinRandInpAct.Text := prev_str;
            EditMinRandInpAct.SetFocus;
          end else
            if cur_val >= Max_Rand_Inp_Act[cur_input] then
              begin
                MessageDlg('Only numbers smaller than maximum value.',
                            mtError, [mbOk],0);
                EditMinRandInpAct.Text := Min_Rand_Inp_Act_Str[cur_input];
                EditMinRandInpAct.SetFocus;
              end else
                begin
                  if cur_val <= 0 then
                    begin
                      min_rand_inp_Act[cur_input] := 0;
                      min_rand_inp_Act_str[cur_input] := '0';
                      EditMinRandInpAct.Text := '0';
                      cur_str := '0';
                    end;

                  if cur_val >= 1 then
                    begin
                      min_rand_inp_Act[cur_input] := 1;
                      min_rand_inp_Act_str[cur_input] := '1';
                      EditMinRandInpAct.Text := '1';
                      cur_str := '1';
                    end;

                  if (cur_val > 0) and (cur_val < 1) then
                    begin
                      min_rand_inp_Act[cur_input] := cur_val;
                      min_rand_inp_Act_str[cur_input] := cur_str;
                    end;

                  if min_rand_inp_act[cur_input] <=
                     min_rand_inp_act[cur_input] then
                end;
      end;

  if cur_str <> prev_str then
    begin
      JustSaved := False;
      EditMinRandInpAct.Color := clYellow
    end else
      EditMinRandInpAct.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditMaxRandInpActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := max_rand_inp_Act[cur_input];
        prev_str := max_rand_inp_Act_Str[cur_input];

        Val(EditMaxRandInpAct.Text,cur_val,Code);

        cur_str := EditMaxRandInpAct.Text;

        if ((code <> 0) or (EditMaxRandInpAct.Text = '.')) and
           (EditMaxRandInpAct.Text <> '')  then
          begin
            MessageDlg('Only numeric values between 0 and 1.',
                        mtError,[mbOk],0);
            EditMaxRandInpAct.Text := prev_str;
            EditMaxRandInpAct.SetFocus;
          end else
            if cur_val <= Min_Rand_Inp_Act[cur_input] then
              begin
                MessageDlg('Only numbers larger than minimum value.',
                            mtError, [mbOk],0);
                EditMaxRandInpAct.Text := Max_Rand_Inp_Act_Str[cur_input];
                EditMaxRandInpAct.SetFocus;
              end else
                begin
                  if cur_val <= 0 then
                    begin
                      max_rand_inp_Act[cur_input] := 0;
                      max_rand_inp_Act_str[cur_input] := '0';
                      EditMaxRandInpAct.Text := '0';
                      cur_str := '0';
                    end;

                  if cur_val >= 1 then
                    begin
                      max_rand_inp_Act[cur_input] := 1;
                      max_rand_inp_Act_str[cur_input] := '1';
                      EditMaxRandInpAct.Text := '1';
                      cur_str := '1';
                    end;

                  if (cur_val > 0) and (cur_val < 1) then
                    begin
                      max_rand_inp_Act[cur_input] := cur_val;
                      max_rand_inp_Act_str[cur_input] := cur_str;
                    end;
                end;
      end;

  if cur_str <> prev_str then
    begin
      JustSaved := False;
      EditMaxRandInpAct.Color := clYellow
    end else
      EditMaxRandInpAct.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditConstUSActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
     prev_val := Trial_Type[cur_trial_type].
                 ts[Trial_Type[cur_trial_type].cur_ts].const_US_Act;

     prev_str := Trial_Type[cur_trial_type].
                 ts[Trial_Type[cur_trial_type].cur_ts].const_US_Act_Str;

     Val(EditConstUSAct.Text,cur_val,Code);

     cur_str := EditConstUSAct.Text;

     if code <> 0 then
        begin
            MessageDlg('Only value between 0 and 1.',
                        mtError,[mbOk],0);
            EditConstUSAct.Text := prev_str;
            EditConstUSAct.SetFocus;
        end else
            begin
                 if cur_val <= 0 then
                    begin
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act := 0;
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act_str := '0';
                         EditConstUSAct.Text := '0';
                         cur_str := '0';
                    end;

                 if cur_val >= 1 then
                    begin
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act := 1;
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act_str := '1';
                         EditConstUSAct.Text := '1';
                         cur_str := '1';
                    end;

                 if (cur_val > 0) and (cur_val < 1) then
                    begin
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act := cur_val;
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act_str := cur_str;
                    end;
            end;

     if cur_str <> prev_str then
        begin
             JustSaved := False;
             EditConstUSAct.Color := clYellow
        end else
            EditConstUSAct.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditMinRandUSActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := min_rand_US_Act;
        prev_str := min_rand_US_Act_Str;
        Val(EditMinRandUSAct.Text,cur_val,Code);
        cur_str := EditMinRandUSAct.Text;

        if code <> 0 then
          begin
            MessageDlg('Only numeric values between 0 and 1.',
                        mtError,[mbOk],0);
            EditMinRandUSAct.Text := prev_str;
            EditMinRandUSAct.SetFocus;
          end else
            if cur_val >= Max_Rand_US_Act then
              begin
                MessageDlg('Only numbers smaller than maximum value.',
                            mtError, [mbOk],0);
                EditMinRandUSAct.Text := Min_Rand_US_Act_Str;
                EditMinRandUSAct.SetFocus;
              end else
                begin
                  if cur_val <= 0 then
                    begin
                         min_Rand_US_Act := 0;
                         Min_Rand_US_Act_str := '0';
                         EditMinRandUSAct.Text := '0';
                         cur_str := '0';
                    end;

                 if cur_val >= 1 then
                    begin
                         min_rand_US_Act := 1;
                         min_rand_US_Act_str := '1';
                         EditMinRandUSAct.Text := '1';
                         cur_str := '1';
                    end;

                 if (cur_val > 0) and
                    (cur_val < 1) then
                    begin
                         min_rand_US_Act := cur_val;
                         min_rand_US_Act_str := cur_str;
                    end;
            end;
      end;

     if cur_str <> prev_str then
        begin
             JustSaved := False;
             EditMinRandUSAct.Color := clYellow
        end else
            EditMinRandUSAct.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditMaxRandUSActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := max_rand_US_Act;
        prev_str := max_rand_US_Act_Str;
        Val(EditMaxRandUSAct.Text,cur_val,Code);
        cur_str := EditMaxRandUSAct.Text;

        if code <> 0 then
          begin
            MessageDlg('Only numeric values between 0 and 1.',
                        mtError,[mbOk],0);
            EditMaxRandUSAct.Text := prev_str;
            EditMaxRandUSAct.SetFocus;
          end else
            if cur_val <= Min_Rand_US_Act then
              begin
                MessageDlg('Only numbers larger than minimum value.',
                            mtError, [mbOk],0);
                EditMaxRandUSAct.Text := Max_Rand_US_Act_Str;
                EditMaxRandUSAct.SetFocus;
              end else
                begin
                  if cur_val <= 0 then
                    begin
                         max_Rand_US_Act := 0;
                         Max_Rand_US_Act_str := '0';
                         EditMaxRandUSAct.Text := '0';
                         cur_str := '0';
                    end;

                 if cur_val >= 1 then
                    begin
                         max_rand_US_Act := 1;
                         max_rand_US_Act_str := '1';
                         EditMaxRandUSAct.Text := '1';
                         cur_str := '1';
                    end;

                 if (cur_val > 0) and
                    (cur_val < 1) then
                    begin
                         max_rand_US_Act := cur_val;
                         max_rand_US_Act_str := cur_str;
                    end;
            end;
      end;

  if cur_str <> prev_str then
    begin
      JustSaved := False;
      EditMaxRandUSAct.Color := clYellow
    end else
        EditMaxRandUSAct.Color := clWhite;

  BuildHint(sender);
End;

procedure TForm3.EditConstUS2ActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
     prev_val := Trial_Type[cur_trial_type].
                 ts[Trial_Type[cur_trial_type].cur_ts].const_US2_Act;

     prev_str := Trial_Type[cur_trial_type].
                 ts[Trial_Type[cur_trial_type].cur_ts].const_US2_Act_Str;

     Val(EditConstUS2Act.Text,cur_val,Code);

     cur_str := EditConstUS2Act.Text;

     if code <> 0 then
        begin
            MessageDlg('Only value between 0 and 1.',
                        mtError,[mbOk],0);
            EditConstUS2Act.Text := prev_str;
            EditConstUS2Act.SetFocus;
        end else
            begin
                 if cur_val <= 0 then
                    begin
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US2_Act := 0;
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US2_Act_str := '0';
                         EditConstUS2Act.Text := '0';
                         cur_str := '0';
                    end;

                 if cur_val >= 1 then
                    begin
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act := 0;

                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act_str := '0';
                         EditConstUSAct.Text := '0';

                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US2_Act := 1;

                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US2_Act_str := '1';

                         EditConstUS2Act.Text := '1';
                         cur_str := '1';
                    end;

                 if (cur_val > 0) and
                    (cur_val < 1) then
                    begin
                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act := 0;

                         EditConstUSAct.Text := '1';

                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US_Act_str := '0';

                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US2_Act := cur_val;

                         Trial_Type[cur_trial_type].
                         ts[Trial_Type[cur_trial_type].cur_ts].
                         const_US2_Act_str := cur_str;
                    end;
            end;

     if cur_str <> prev_str then
        begin
             JustSaved := False;
             EditConstUS2Act.Color := clYellow
        end else
            EditConstUS2Act.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditMinRandUS2ActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := min_rand_US2_Act;
        prev_str := min_rand_US2_Act_Str;
        Val(EditMinRandUS2Act.Text,cur_val,Code);
        cur_str := EditMinRandUS2Act.Text;

        if code <> 0 then
          begin
            MessageDlg('Only numeric values between 0 and 1.',
                        mtError,[mbOk],0);
            EditMinRandUS2Act.Text := prev_str;
            EditMinRandUS2Act.SetFocus;
          end else
            if cur_val >= Max_Rand_US2_Act then
              begin
                MessageDlg('Only numbers smaller than maximum value.',
                            mtError, [mbOk],0);
                EditMinRandUS2Act.Text := Min_Rand_US2_Act_Str;
                EditMinRandUS2Act.SetFocus;
              end else
                begin
                  if cur_val <= 0 then
                    begin
                         min_Rand_US2_Act := 0;
                         Min_Rand_US2_Act_str := '0';
                         EditMinRandUS2Act.Text := '0';
                         cur_str := '0';
                    end;

                 if cur_val >= 1 then
                    begin
                         min_rand_US2_Act := 1;
                         min_rand_US2_Act_str := '1';
                         EditMinRandUS2Act.Text := '1';
                         cur_str := '1';
                    end;

                 if (cur_val > 0) and
                    (cur_val < 1) then
                    begin
                         min_rand_US2_Act := cur_val;
                         min_rand_US2_Act_str := cur_str;
                    end;
            end;
      end;

     if cur_str <> prev_str then
        begin
             JustSaved := False;
             EditMinRandUS2Act.Color := clYellow
        end else
            EditMinRandUS2Act.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditMaxRandUS2ActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := max_rand_US2_Act;
        prev_str := max_rand_US2_Act_Str;
        Val(EditMaxRandUS2Act.Text,cur_val,Code);
        cur_str := EditMaxRandUS2Act.Text;

        if code <> 0 then
          begin
            MessageDlg('Only values between 0 and 1.',
                        mtError,[mbOk],0);
            EditMaxRandUS2Act.Text := prev_str;
            EditMaxRandUS2Act.SetFocus;
          end else
            if cur_val <= Min_Rand_US2_Act then
              begin
                MessageDlg('Only numbers larger than minimum value.',
                            mtError, [mbOk],0);
                EditMaxRandUS2Act.Text := Max_Rand_US2_Act_Str;
                EditMaxRandUS2Act.SetFocus;
              end else
                begin
                  if cur_val <= 0 then
                    begin
                         max_Rand_US2_Act := 0;
                         Max_Rand_US2_Act_str := '0';
                         EditMaxRandUS2Act.Text := '0';
                         cur_str := '0';
                    end;

                 if cur_val >= 1 then
                    begin
                         max_rand_US2_Act := 1;
                         max_rand_US2_Act_str := '1';
                         EditMaxRandUS2Act.Text := '1';
                         cur_str := '1';
                    end;

                 if (cur_val > 0) and (cur_val < 1) then
                    begin
                         max_rand_US2_Act := cur_val;
                         max_rand_US2_Act_str := cur_str;
                    end;
            end;
      end;

  if cur_str <> prev_str then
    begin
      JustSaved := False;
      EditMaxRandUS2Act.Color := clYellow
    end else
        EditMaxRandUS2Act.Color := clWhite;

  BuildHint(sender);
End;

procedure TForm3.EditTargetsChange(Sender: TObject);
Var
  txt : String[3];
  code, prev_val, cur_val, i : Integer;
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := Tot_Op_Targets;
        Val(EditTargets.Text,cur_val,Code);

        if code <> 0 then
          begin
            MessageDlg('Only whole values larger than 0', mtError,[mbOk],0);
            str(Tot_Op_Targets,txt);
            EditTargets.Text := txt;
            EditTargets.SetFocus;
          end else
            begin
              if cur_op_target > Tot_Op_Targets then
                begin
                  cur_op_target := Tot_Op_Targets;

                  TargetNextBttn.Enabled := False;

                  with Op_Target[cur_op_target] do
                    begin
                      str(op_npe,txt);

                      EditNPE.Text := txt;

                      EditMinOpAct.Text := min_Op_Act_str;
                      EditMaxOpAct.Text := max_Op_Act_str;
                    end;
                end;

              if Tot_Op_Targets = 1 then
                begin
                  cur_op_target := 1;
                  TargetNextBttn.Enabled := False;
                  TargetBackBttn.Enabled := False;
                end;

              if cur_op_target < Tot_Op_Targets then
                TargetNextBttn.Enabled := True;

              if cur_op_target > 1 then
                TargetBackBttn.Enabled := True
              else
                TargetBackBttn.Enabled := False;

              if (cur_val = 1) then
                begin
                  Tot_Op_Targets := 1;
                  cur_op_target := 1;
                  EditTargets.Text := '1';
                  TargetNextBttn.Enabled := False;
                  TargetBackBttn.Enabled := False;
                  statictext7.caption := '1';

                  with Op_Target[cur_op_target] do
                    begin
                      str(op_npe,txt);

                      EditNPE.Text := txt;

                      EditMinOpAct.Text := min_Op_Act_str;
                      EditMaxOpAct.Text := max_Op_Act_str;
                    end;
                end;

              if (cur_val > Max_Op_Targets) then
                begin
                  Tot_Op_Targets := Max_Op_Targets;

                  str(max_op_targets,txt);
                  EditTargets.Text := txt;

                  If cur_op_target < tot_op_targets then
                    TargetNextBttn.Enabled := True
                  else
                    TargetNextBttn.Enabled := False;

                  if cur_op_target > 1 then
                    TargetBackBttn.Enabled := True
                  else
                    TargetBackBttn.Enabled := False;
                end;

              if (cur_val >= 1) and (cur_val <= Max_Op_Targets) then
                begin
                  Tot_Op_Targets := cur_val;

                  if cur_op_target < Tot_Op_Targets then
                    TargetNextBttn.Enabled := True;

                  if cur_op_target > Tot_Op_Targets then
                    begin
                      if Tot_Op_Targets > 1 then
                        TargetBackBttn.Enabled := True;

                        cur_op_target := Tot_Op_Targets;

                        str(cur_op_target,txt);
                        statictext7.caption := txt;

                        with Op_Target[cur_op_target] do
                          begin
                            str(op_npe,txt);

                            EditNPE.Text := txt;

                            EditMinOpAct.Text := min_Op_Act_str;
                            EditMaxOpAct.Text := max_Op_Act_str;
                          end;

                        TargetNextBttn.Enabled := False;
                    end;
                end;
            end;
        end;

  if cur_val <> prev_val then
    with Trial_Type[cur_trial_type] do
      with ts[cur_ts] do
        begin
          JustSaved := False;
          str(Tot_Op_Targets,txt);

          EditTargets.Text := txt;
          EditTargets.Color := clYellow
        end else
            EditTargets.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditNPEChange(Sender: TObject);
Var
   Code, prev_val, cur_val : Integer;
   txt : String[3];
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := Op_Target[cur_op_target].op_npe;
        Val(EditNPE.Text,cur_val,Code);

        if (code <> 0) then
          begin
            MessageDlg('Only values greater than 0.', mtError,[mbOk],0);
            str(prev_val,txt);
            EditNPE.Text := txt;
            EditNPE.SetFocus;
          end else
            begin
              if cur_val >= Max_NPEs+Max_Inputs then
                begin
                  Op_Target[cur_op_target].op_npe := Max_NPEs+Max_Inputs;
                  str(max_npes+max_inputs,txt);
                  EditNPE.Text := txt;
                end;

              if (cur_val >= 1) and (cur_val < Max_NPEs+Max_Inputs) then
                begin
                  Op_Target[cur_op_target].op_npe := cur_val;
                  str(Op_Target[cur_op_target].op_npe,txt);
                  EditNPE.Text := txt;
                end;
            end;
      end;

  if cur_val <> prev_val then
    begin
      JustSaved := False;
      EditNPE.Color := clYellow
    end else
        EditNPE.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditMinOpActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := Op_Target[cur_op_target].min_Op_Act;
        prev_str := Op_Target[cur_op_target].min_Op_Act_str;

        Val(EditMinOpAct.Text,cur_val,Code);

        cur_str := EditMinOpAct.Text;

        if (code <> 0) then
          begin
             MessageDlg('Only numeric values between 0 and 1.',
                        mtError,[mbOk],0);
             EditMinOpAct.Text := prev_str;
             EditMinOpAct.SetFocus;
          end else
            if cur_val >= Op_Target[cur_op_target].max_Op_Act then
              begin
                MessageDlg('Only numbers smaller than maximum value.',
                            mtError, [mbOk],0);
                EditMinOpAct.Text := Op_Target[cur_op_target].
                                     Min_Op_Act_Str;
                EditMinOpAct.SetFocus;
              end;

        if cur_val <= 0 then
          begin
             Op_Target[cur_op_target].min_Op_Act := 0;
             Op_Target[cur_op_target].min_Op_Act_str := '0';

             EditMinOpAct.Text := '0';
             cur_str := '0';
          end;

        if cur_val >= 1 then
          begin
             Op_Target[cur_op_target].min_Op_Act := 1;
             Op_Target[cur_op_target].min_Op_Act_str := '1';

             EditMinOpAct.Text := '1';

             cur_str := '1';
          end;

        if (cur_val > 0) and (cur_val < 1) then
          begin
             Op_Target[cur_op_target].min_Op_Act := cur_val;
             Op_Target[cur_op_target].min_Op_Act_str := cur_str;
          end;
      end;

     if cur_str <> prev_str then
        begin
             JustSaved := False;
             EditMinOpAct.Color := clYellow
        end else
            EditMinOpAct.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.EditMaxOpActChange(Sender: TObject);
Var
   Code : Integer;
   prev_val, cur_val : extended;
   prev_str, cur_str : String;
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        prev_val := Op_Target[cur_op_target].max_Op_Act;
        prev_str := Op_Target[cur_op_target].max_Op_Act_str;

        Val(EditMaxOpAct.Text,cur_val,Code);

        cur_str := EditMaxOpAct.Text;

        if (code <> 0) then
          begin
             MessageDlg('Only numeric values between 0 and 1.',
                        mtError,[mbOk],0);
             EditMaxOpAct.Text := prev_str;
             EditMaxOpAct.SetFocus;
          end else
            if cur_val <= Op_Target[cur_op_target].min_Op_Act then
              begin
                MessageDlg('Only numbers larger than minimum value.',
                            mtError, [mbOk],0);
                EditMaxOpAct.Text := Op_Target[cur_op_target].
                                     Max_Op_Act_Str;
                EditMaxOpAct.SetFocus;
              end else
            begin
              if cur_val <= 0 then
                begin
                  Op_Target[cur_op_target].max_Op_Act := 0;
                  Op_Target[cur_op_target].max_Op_Act_str := '0';

                  EditMaxOpAct.Text := '0';
                  cur_str := '0';
                end;

              if cur_val >= 1 then
                begin
                  Op_Target[cur_op_target].max_Op_Act := 1;
                  Op_Target[cur_op_target].max_Op_Act_str := '1';

                  EditMaxOpAct.Text := '1';

                  cur_str := '1';
                end;

              if (cur_val > 0) and (cur_val < 1) then
                begin
                  Op_Target[cur_op_target].max_Op_Act := cur_val;
                  Op_Target[cur_op_target].max_Op_Act_str := cur_str;
                end;
            end;
      end;

     if cur_str <> prev_str then
    begin
         JustSaved := False;
         EditMaxOpAct.Color := clYellow
    end else
         EditMaxOpAct.Color := clWhite;

  BuildHint(sender);
end;

procedure TForm3.TrialTypeNextBttnClick(Sender: TObject);
var
   txt : String;
   pi, tot_lines : Integer;
begin
  EditTotTrialTypesChange(sender);
  EditTotTrialsChange(sender);
  EditTrialTypeLabelChange(sender);

  EditTotInputsChange(sender);
  EditDurationChange(sender);

  EditConstInpActChange(Sender);
  EditMinRandInpActChange(Sender);
  EditMaxRandInpActChange(Sender);

  EditConstUSActChange(Sender);
  EditMinRandUSActChange(Sender);
  EditMaxRandUSActChange(Sender);
  EditConstUS2ActChange(Sender);
  EditMinRandUS2ActChange(Sender);
  EditMaxRandUS2ActChange(Sender);

  EditTargetsChange(sender);
  EditNPEChange(Sender);
  EditMinOpActChange(Sender);
  EditMaxOpActChange(Sender);

  if TrainBttn.Checked then
    Trial_Type[cur_trial_type].Mode := 0
  else
    Trial_Type[cur_trial_type].Mode := 1;

  Trial_Type[cur_trial_type].Cue := 0; {phasic cue; 10/07/01}

  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if RDependentCheckBox.Checked then
          RDependent[cur_input] := 1
        else
           RDependent[cur_input] := 0;

        If ConstInpActBttn.Checked then
          InpActMode[cur_input] := 0
        else
          InpActMode[cur_input] := 1;

        If ConstUSActBttn.Checked then
          USActMode := 0;

        If RandUSActBttn.Checked then
          USActMode := 1;

        If ConstUS2ActBttn.Checked then
          USActMode := 2;

        If RandUS2ActBttn.Checked then
          USActMode := 3;

        if Pavlovian1Bttn.Checked then
          Contingency := 0;

        if OperantBttn.Checked then
            Contingency := 1;

        if OmissionBttn.Checked then
            Contingency := 2;
      end;

  Cur_Trial_Type := Cur_Trial_Type + 1;

  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        ColorDialog1.Color := Color;
        WhiteAll(sender);

        Str(Cur_Trial_Type,txt);
        statictext3.caption := txt;

        Str(cur_ts,txt);
        statictext11.caption := txt;

        str(duration,txt);
        EditDuration.Text := txt;

        EditTrialTypeLabel.Text := Lab;

        str(Tot_Trials,txt);
        EditTotTrials.Text := txt;

        Str(cur_input,txt);
        statictext19.caption := txt;

        EditConstInpAct.Text := const_inp_Act_Str[cur_input];
        EditMinRandInpAct.Text := min_rand_inp_Act_Str[cur_input];
        EditMaxRandInpAct.Text := max_rand_inp_Act_Str[cur_input];

        EditConstUSAct.Text := const_US_Act_Str;
        EditMinRandUSAct.Text := min_rand_US_Act_Str;
        EditMaxRandUSAct.Text := max_rand_US_Act_Str;

        Case Mode of
          0: TrainBttn.Checked := True;
          1: ProbeBttn.Checked := True;
        end{case};

        Case RDependent[cur_input] of
          0: begin
               RDependentCheckBox.Checked := False;
               EditTargets.Text := '1';
               StaticText7.Caption := '1';
               EditNPE.Text := '1';
               EditMinOpAct.Text := '0';
               EditMaxOpAct.Text := '1';
               DisableGroupBox3(sender);
             end;

          1: begin
               RDependentCheckBox.Checked := True;
               EnableGroupBox3(sender);
 
               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
              end;
        end{case};

        Case InpActMode[cur_input] of
          0: begin
               ConstInpActBttn.Checked := True;
               EditConstInpAct.Enabled := True;
               EditMinRandInpAct.Enabled := False;
               EditMaxRandInpAct.Enabled := False;
             end;

          1: begin
               RandInpActBttn.Checked := True;
               EditConstInpAct.Enabled := False;
               EditMinRandInpAct.Enabled := True;
               EditMaxRandInpAct.Enabled := True;
             end;
        end{case};

        Case USActMode of
          0: begin
               ConstUSActBttn.Checked := True;
               EditConstUSAct.Enabled := True;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          1: begin
               RandUSActBttn.Checked := True;
               EditConstUSAct.Enabled := False;
               EditMinRandUSAct.Enabled := True;
               EditMaxRandUSAct.Enabled := True;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          2: begin
               ConstUSActBttn.Checked := False;
               EditConstUSAct.Enabled := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := True;
               EditConstUS2Act.Enabled := True;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          3: begin
               ConstUSActBttn.Checked := False;
               EditConstUSAct.Enabled := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := True;
               EditMinRandUS2Act.Enabled := True;
               EditMaxRandUS2Act.Enabled := True;
             end;
        end{case};

        Case Contingency of
          0: begin
               Pavlovian1Bttn.Checked := True;
               StaticText6.Enabled := False;
               StaticText7.Enabled := False;

               if (not RDependentCheckBox.Checked) then
                 DisableGroupBox3(sender)
               else
                  EnableGroupBox3(sender);
             end;

          1,2: begin
               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               if Contingency = 1 then
                 OperantBttn.Checked := True
               else
                  OmissionBttn.Checked := True;

               EnableGroupBox3(sender);

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets = 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target = Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};

        if Tot_Trial_Types = 1 then
          begin
            TrialTypeNextBttn.Enabled := False;
            TrialTypeBackBttn.Enabled := False;
          end else
             begin
               if Cur_trial_type >= tot_trial_types then
                 begin
                   TrialTypeNextBttn.Enabled := False;
                   TrialTypeBackBttn.Enabled := True;
                 end;

               if (cur_trial_type < tot_trial_types) and
                  (cur_trial_type > 1) then
                 begin
                   TrialTypeNextBttn.Enabled := True;
                   TrialTypeBackBttn.Enabled := true;
                 end;

               if cur_trial_type = 1 then
                 begin
                   TrialTypeNextBttn.Enabled := True;
                   TrialTypeBackBttn.Enabled := False;
                 end;
             end;

        if Duration = 1 then
          begin
            tsNextBttn.Enabled := False;
            tsBackBttn.Enabled := False;
          end else
             begin
               if Cur_ts >= Duration then
                 begin
                   tsNextBttn.Enabled := False;
                   tsBackBttn.Enabled := True;
                 end;

               if (cur_ts < Duration) and (cur_ts > 1) then
                 begin
                   tsNextBttn.Enabled := True;
                   tsBackBttn.Enabled := true;
                 end;

               if cur_ts = 1 then
                 begin
                   tsNextBttn.Enabled := True;
                   tsBackBttn.Enabled := False;
                 end;
             end;

        if Tot_Inputs = 1 then
          begin
            InpNextBttn.Enabled := False;
            InpBackBttn.Enabled := False;
          end else
             begin
               if Cur_input >= tot_inputs then
                 begin
                   InpNextBttn.Enabled := False;
                   InpBackBttn.Enabled := True;
                 end;

               if (cur_input < tot_inputs) and (cur_input > 1) then
                 begin
                   InpNextBttn.Enabled := True;
                   InpBackBttn.Enabled := true;
                 end;

               if cur_input = 1 then
                 begin
                   InpNextBttn.Enabled := True;
                   InpBackBttn.Enabled := False;
                 end;
             end;
      end;
end;

procedure TForm3.TrialTypeBackBttnClick(Sender: TObject);
var
   txt : String;
   pi, tot_lines : Integer;
begin
  EditTotTrialTypesChange(sender);
  EditTotTrialsChange(sender);
  EditTrialTypeLabelChange(sender);

  EditDurationChange(sender);
  EditTotInputsChange(sender);

  EditConstInpActChange(Sender);
  EditMinRandInpActChange(Sender);
  EditMaxRandInpActChange(Sender);

  EditConstUSActChange(Sender);
  EditMinRandUSActChange(Sender);
  EditMaxRandUSActChange(Sender);
  EditConstUS2ActChange(Sender);
  EditMinRandUS2ActChange(Sender);
  EditMaxRandUS2ActChange(Sender);

  EditTargetsChange(sender);
  EditNPEChange(Sender);
  EditMinOpActChange(Sender);
  EditMaxOpActChange(Sender);

  if TrainBttn.Checked then
    Trial_Type[cur_trial_type].Mode := 0
  else
    Trial_Type[cur_trial_type].Mode := 1;

  Trial_Type[cur_trial_type].Cue := 0;

  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if RDependentCheckBox.Checked then
          RDependent[cur_input] := 1
        else
           RDependent[cur_input] := 0;

        If ConstInpActBttn.Checked then
          InpActMode[cur_input] := 0
        else
          InpActMode[cur_input] := 1;

        If ConstUSActBttn.Checked then
          USActMode := 0;

        If RandUSActBttn.Checked then
          USActMode := 1;

        If ConstUS2ActBttn.Checked then
          USActMode := 2;

        If RandUS2ActBttn.Checked then
          USActMode := 3;

        if Pavlovian1Bttn.Checked then
          Contingency := 0;

        if OperantBttn.Checked then
            Contingency := 1;

        if OmissionBttn.Checked then
            Contingency := 2;
      end;

  Cur_Trial_Type := Cur_Trial_Type - 1;

  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        ColorDialog1.Color := Color;
        WhiteAll(sender);

        Str(Cur_Trial_Type,txt);
        statictext3.caption := txt;

        Str(cur_ts,txt);
        statictext11.caption := txt;

        str(duration,txt);
        EditDuration.Text := txt;

        EditTrialTypeLabel.Text := Lab;

        str(Tot_Trials,txt);
        EditTotTrials.Text := txt;

        Str(cur_input,txt);
        statictext19.caption := txt;

        EditConstInpAct.Text := const_inp_Act_Str[cur_input];
        EditMinRandInpAct.Text := min_rand_inp_Act_Str[cur_input];
        EditMaxRandInpAct.Text := max_rand_inp_Act_Str[cur_input];

        EditConstUSAct.Text := const_US_Act_Str;
        EditMinRandUSAct.Text := min_rand_US_Act_Str;
        EditMaxRandUSAct.Text := max_rand_US_Act_Str;

        Case Mode of
          0: TrainBttn.Checked := True;
          1: ProbeBttn.Checked := True;
        end{case};

        Case RDependent[cur_input] of
          0: begin
               RDependentCheckBox.Checked := False;
               DisableGroupBox3(sender);
               EditTargets.Text := '1';
               StaticText7.Caption := '1';
               EditNPE.Text := '1';
               EditMinOpAct.Text := '0';
               EditMaxOpAct.Text := '1';
             end;

          1: begin
               RDependentCheckBox.Checked := True;
               EnableGroupBox3(sender);

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
              end;
        end{case};

        Case InpActMode[cur_input] of
          0: begin
               ConstInpActBttn.Checked := True;
               EditConstInpAct.Enabled := True;
               EditMinRandInpAct.Enabled := False;
               EditMaxRandInpAct.Enabled := False;
             end;

          1: begin
               RandInpActBttn.Checked := True;
               EditConstInpAct.Enabled := False;
               EditMinRandInpAct.Enabled := True;
               EditMaxRandInpAct.Enabled := True;
             end;
        end{case};

        Case USActMode of
          0: begin
               ConstUSActBttn.Checked := True;
               EditConstUSAct.Enabled := True;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          1: begin
               RandUSActBttn.Checked := True;
               EditConstUSAct.Enabled := False;
               EditMinRandUSAct.Enabled := True;
               EditMaxRandUSAct.Enabled := True;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          2: begin
               ConstUSActBttn.Checked := False;
               EditConstUSAct.Enabled := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := True;
               EditConstUS2Act.Enabled := True;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          3: begin
               ConstUSActBttn.Checked := False;
               EditConstUSAct.Enabled := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := True;
               EditMinRandUS2Act.Enabled := True;
               EditMaxRandUS2Act.Enabled := True;
             end;
        end{case};

        Case Contingency of
          0: begin
               Pavlovian1Bttn.Checked := True;
               StaticText6.Enabled := False;
               StaticText7.Enabled := False;

               if (not RDependentCheckBox.Checked) then
                  DisableGroupBox3(sender)
               else
                   EnableGroupBox3(sender);
             end;

          1,2: begin
               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               if Contingency = 1 then
                 OperantBttn.Checked := True
               else
                  OmissionBttn.Checked := True;

               EnableGroupBox3(sender);

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets = 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target = Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};

        if Tot_Trial_Types = 1 then
          begin
            TrialTypeNextBttn.Enabled := False;
            TrialTypeBackBttn.Enabled := False;
          end else
             begin
               if Cur_trial_type >= tot_trial_types then
                 begin
                   TrialTypeNextBttn.Enabled := False;
                   TrialTypeBackBttn.Enabled := True;
                 end;

               if (cur_trial_type < tot_trial_types) and
                  (cur_trial_type > 1) then
                 begin
                   TrialTypeNextBttn.Enabled := True;
                   TrialTypeBackBttn.Enabled := true;
                 end;

               if cur_trial_type = 1 then
                 begin
                   TrialTypeNextBttn.Enabled := True;
                   TrialTypeBackBttn.Enabled := False;
                 end;
             end;

        if Duration = 1 then
          begin
            tsNextBttn.Enabled := False;
            tsBackBttn.Enabled := False;
          end else
             begin
               if Cur_ts >= Duration then
                 begin
                   tsNextBttn.Enabled := False;
                   tsBackBttn.Enabled := True;
                 end;

               if (cur_ts < Duration) and (cur_ts > 1) then
                 begin
                   tsNextBttn.Enabled := True;
                   tsBackBttn.Enabled := true;
                 end;

               if cur_ts = 1 then
                 begin
                   tsNextBttn.Enabled := True;
                   tsBackBttn.Enabled := False;
                 end;
             end;

        if Tot_Inputs = 1 then
          begin
            InpNextBttn.Enabled := False;
            InpBackBttn.Enabled := False;
          end else
             begin
               if Cur_input >= tot_inputs then
                 begin
                   InpNextBttn.Enabled := False;
                   InpBackBttn.Enabled := True;
                 end;

               if (cur_input < tot_inputs) and (cur_input > 1) then
                 begin
                   InpNextBttn.Enabled := True;
                   InpBackBttn.Enabled := true;
                 end;

               if cur_input = 1 then
                 begin
                   InpNextBttn.Enabled := True;
                   InpBackBttn.Enabled := False;
                 end;
             end;
      end;
end;

procedure TForm3.TrialTypeDelBttnClick(Sender: TObject);
var
  tr_t : integer;
  txt : String[5];
begin
  if MessageDlg('Delete current trial-type?',
                 mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin
      if cur_trial_type = tot_trial_types then
        begin
          with trial_type[cur_trial_type] do
            begin
              tot_trials := Trial_Type[cur_trial_type-1].Tot_Trials;
              Duration := Trial_Type[cur_trial_type-1].Duration;
              Lab := Trial_Type[cur_trial_type-1].Lab;
              Color := Trial_Type[cur_trial_type-1].Color;
              cur_ts := Trial_Type[cur_trial_type-1].cur_ts;

              with ts[cur_ts] do
                begin
                  cur_input := Trial_type[cur_trial_type-1].
                               ts[Trial_type[cur_trial_type-1].cur_ts].
                               Cur_Input;

                  RDependent := Trial_Type[cur_trial_type-1].
                                ts[Trial_type[cur_trial_type-1].cur_ts].RDependent;

                  InpActMode := Trial_type[cur_trial_type-1].
                                ts[Trial_type[cur_trial_type-1].cur_ts].
                                InpActMode;

                  const_Inp_Act := Trial_type[cur_trial_type-1].
                                   ts[Trial_type[cur_trial_type-1].cur_ts].
                                   const_Inp_Act;

                  Min_Rand_Inp_Act := Trial_type[cur_trial_type-1].
                                      ts[Trial_type[cur_trial_type-1].cur_ts].
                                      min_rand_Inp_Act;

                  Max_Rand_Inp_Act := Trial_type[cur_trial_type-1].
                                      ts[Trial_type[cur_trial_type-1].cur_ts].
                                      max_rand_Inp_Act;

                  USActMode := Trial_type[cur_trial_type-1].
                               ts[Trial_type[cur_trial_type-1].cur_ts].
                               USActMode;

                  const_US_Act := Trial_type[cur_trial_type-1].
                                  ts[Trial_type[cur_trial_type-1].cur_ts].
                                  const_US_Act;

                  Min_Rand_US_Act := Trial_type[cur_trial_type-1].
                                      ts[Trial_type[cur_trial_type-1].cur_ts].
                                      min_rand_US_Act;

                  Max_Rand_US_Act := Trial_type[cur_trial_type-1].
                                     ts[Trial_type[cur_trial_type-1].cur_ts].
                                     max_rand_US_Act;


                  const_US2_Act := Trial_type[cur_trial_type-1].
                                  ts[Trial_type[cur_trial_type-1].cur_ts].
                                  const_US2_Act;

                  Min_Rand_US2_Act := Trial_type[cur_trial_type-1].
                                      ts[Trial_type[cur_trial_type-1].cur_ts].
                                      min_rand_US2_Act;

                  Max_Rand_US2_Act := Trial_type[cur_trial_type-1].
                                     ts[Trial_type[cur_trial_type-1].cur_ts].
                                     max_rand_US2_Act;

                  const_Inp_Act_str := Trial_type[cur_trial_type-1].
                                       ts[Trial_type[cur_trial_type-1].cur_ts].
                                       const_Inp_Act_str;

                  Min_Rand_Inp_Act_str := Trial_type[cur_trial_type-1].
                                          ts[Trial_type[cur_trial_type-1].cur_ts].
                                          min_rand_Inp_Act_str;

                  Max_Rand_Inp_Act_str := Trial_type[cur_trial_type-1].
                                          ts[Trial_type[cur_trial_type-1].cur_ts].
                                          max_rand_Inp_Act_str;

                  const_US_Act_str := Trial_type[cur_trial_type-1].
                                      ts[Trial_type[cur_trial_type-1].cur_ts].
                                      const_US_Act_str;

                  Min_Rand_US_Act_str := Trial_type[cur_trial_type-1].
                                         ts[Trial_type[cur_trial_type-1].cur_ts].
                                         min_rand_US_Act_str;

                  Max_Rand_US_Act_str := Trial_type[cur_trial_type-1].
                                         ts[Trial_type[cur_trial_type-1].cur_ts].
                                         max_rand_US_Act_str;

                  Contingency := Trial_type[cur_trial_type-1].
                                 ts[Trial_type[cur_trial_type-1].cur_ts].
                                 Contingency;

                  Tot_Op_Targets := Trial_type[cur_trial_type-1].
                                    ts[Trial_type[cur_trial_type-1].cur_ts].
                                    Tot_Op_Targets;

                  Cur_Op_Target := Trial_type[cur_trial_type-1].
                                   ts[Trial_type[cur_trial_type-1].cur_ts].
                                   Cur_Op_Target;

                  op_target := Trial_type[cur_trial_type-1].
                               ts[Trial_type[cur_trial_type-1].cur_ts].
                               Op_Target;
                end;
            end;
        end else
          begin
            for tr_t := cur_trial_type to tot_trial_types - 1 do
              with trial_type[tr_t] do
                begin
                  tot_trials := Trial_Type[tr_t+1].Tot_Trials;
                  Duration := Trial_Type[tr_t+1].Duration;
                  Lab := Trial_Type[tr_t+1].Lab;
                  Color := Trial_Type[tr_t+1].Color;
                  cur_ts := Trial_Type[tr_t+1].cur_ts;

                  with ts[cur_ts] do
                    begin
                      cur_input := Trial_type[tr_t+1].
                                   ts[Trial_type[tr_t+1].cur_ts].
                                   Cur_Input;

                      RDependent := Trial_type[tr_t+1].
                                    ts[Trial_type[tr_t+1].cur_ts].
                                    RDependent;  

                      InpActMode := Trial_type[tr_t+1].
                                    ts[Trial_type[tr_t+1].cur_ts].
                                    InpActMode;

                      const_Inp_Act := Trial_type[tr_t+1].
                                       ts[Trial_type[tr_t+1].cur_ts].
                                       const_Inp_Act;

                      Min_Rand_Inp_Act := Trial_type[tr_t+1].
                                          ts[Trial_type[tr_t+1].cur_ts].
                                          min_rand_Inp_Act;

                      Max_Rand_Inp_Act := Trial_type[tr_t+1].
                                          ts[Trial_type[tr_t+1].cur_ts].
                                          max_rand_Inp_Act;

                      USActMode := Trial_type[tr_t+1].
                                   ts[Trial_type[tr_t+1].cur_ts].
                                   USActMode;

                      const_US_Act := Trial_type[tr_t+1].
                                      ts[Trial_type[tr_t+1].cur_ts].
                                      const_US_Act;

                      Min_Rand_US_Act := Trial_type[tr_t+1].
                                         ts[Trial_type[tr_t+1].cur_ts].
                                         min_rand_US_Act;

                      Max_Rand_US_Act := Trial_type[tr_t+1].
                                         ts[Trial_type[tr_t+1].cur_ts].
                                         max_rand_US_Act;

                      const_US2_Act := Trial_type[tr_t+1].
                                      ts[Trial_type[tr_t+1].cur_ts].
                                      const_US2_Act;

                      Min_Rand_US2_Act := Trial_type[tr_t+1].
                                         ts[Trial_type[tr_t+1].cur_ts].
                                         min_rand_US2_Act;

                      Max_Rand_US2_Act := Trial_type[tr_t+1].
                                         ts[Trial_type[tr_t+1].cur_ts].
                                         max_rand_US2_Act;

                      const_Inp_Act_str := Trial_type[tr_t+1].
                                           ts[Trial_type[tr_t+1].cur_ts].
                                           const_Inp_Act_str;

                      Min_Rand_Inp_Act_str := Trial_type[tr_t+1].
                                              ts[Trial_type[tr_t+1].cur_ts].
                                              min_rand_Inp_Act_str;

                      Max_Rand_Inp_Act_str := Trial_type[tr_t+1].
                                              ts[Trial_type[tr_t+1].cur_ts].
                                              max_rand_Inp_Act_str;

                      const_US_Act_str := Trial_type[tr_t+1].
                                          ts[Trial_type[tr_t+1].cur_ts].
                                          const_US_Act_str;

                      Min_Rand_US_Act_str := Trial_type[tr_t+1].
                                             ts[Trial_type[tr_t+1].cur_ts].
                                             min_rand_US_Act_str;

                      Max_Rand_US_Act_str := Trial_type[tr_t+1].
                                             ts[Trial_type[tr_t+1].cur_ts].
                                             max_rand_US_Act_str;

                      Contingency := Trial_type[tr_t+1].
                                     ts[Trial_type[tr_t+1].cur_ts].
                                     Contingency;

                      Tot_Op_Targets := Trial_type[tr_t+1].
                                        ts[Trial_type[tr_t+1].cur_ts].
                                        Tot_Op_Targets;

                      Cur_Op_Target := Trial_type[tr_t+1].
                                       ts[Trial_type[tr_t+1].cur_ts].
                                       Cur_Op_Target;

                      op_target := Trial_type[tr_t+1].
                                   ts[Trial_type[tr_t+1].cur_ts].
                                   Op_Target;
                    end;
                end;
          end;
    end;

  Tot_trial_types := Tot_trial_types - 1;

  If tot_trial_types = 1 then
    TrialTypeDelBttn.Enabled := False;

  Str(Tot_Trial_Types,txt);
  EditTotTrialTypes.Text := txt;

  with Trial_Type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        WhiteAll(sender);

        Str(Tot_Trials,txt);
        EditTotTrials.Text := txt;

        Str(Duration,txt);
        EditDuration.Text := txt;

        EditTrialTypeLabel.Text := Lab;

        ColorDialog1.Color := Color;

        Str(Cur_Trial_Type,txt);
        statictext3.caption := txt;

        Str(cur_ts,txt);
        statictext11.caption := txt;

        Str(cur_input,txt);
        statictext19.caption := txt;

        EditConstInpAct.Text := const_inp_Act_Str[cur_input];
        EditMinRandInpAct.Text := min_rand_inp_Act_Str[cur_input];
        EditMaxRandInpAct.Text := max_rand_inp_Act_Str[cur_input];

        EditConstUSAct.Text := const_US_Act_Str;
        EditMinRandUSAct.Text := min_rand_US_Act_Str;
        EditMaxRandUSAct.Text := max_rand_US_Act_Str;

        Case Mode of
          0: TrainBttn.Checked := True;
          1: ProbeBttn.Checked := True;
        end{case};

        if Tot_Trial_Types = 1 then
          begin
            TrialTypeNextBttn.Enabled := False;
            TrialTypeBackBttn.Enabled := False;
          end else
             begin
               if Cur_trial_type >= tot_trial_types then
                 begin
                   TrialTypeNextBttn.Enabled := False;
                   TrialTypeBackBttn.Enabled := True;
                 end;

               if (cur_trial_type < tot_trial_types) and
                  (cur_trial_type > 1) then
                 begin
                   TrialTypeNextBttn.Enabled := True;
                   TrialTypeBackBttn.Enabled := true;
                 end;

               if cur_trial_type = 1 then
                 begin
                   TrialTypeNextBttn.Enabled := True;
                   TrialTypeBackBttn.Enabled := False;
                 end;
             end;

        if Duration = 1 then
          begin
            tsNextBttn.Enabled := False;
            tsBackBttn.Enabled := False;
          end else
             begin
               if Cur_ts >= Duration then
                 begin
                   tsNextBttn.Enabled := False;
                   tsBackBttn.Enabled := True;
                 end;

               if (cur_ts < Duration) and (cur_ts > 1) then
                 begin
                   tsNextBttn.Enabled := True;
                   tsBackBttn.Enabled := true;
                 end;

               if cur_ts = 1 then
                 begin
                   tsNextBttn.Enabled := True;
                   tsBackBttn.Enabled := False;
                 end;
             end;

        if Tot_Inputs = 1 then
          begin
            InpNextBttn.Enabled := False;
            InpBackBttn.Enabled := False;
          end else
             begin
               if Cur_input >= tot_inputs then
                 begin
                   InpNextBttn.Enabled := False;
                   InpBackBttn.Enabled := True;
                 end;

               if (cur_input < tot_inputs) and (cur_input > 1) then
                 begin
                   InpNextBttn.Enabled := True;
                   InpBackBttn.Enabled := true;
                 end;

               if cur_input = 1 then
                 begin
                   InpNextBttn.Enabled := True;
                   InpBackBttn.Enabled := False;
                 end;
             end;

        Case RDependent[cur_input] of
          0: begin
               RDependentCheckBox.Checked := False;
               DisableGroupBox3(sender);
             end;

          1: begin
               RDependentCheckBox.Checked := True;
               EnableGroupBox3(sender);
             end;
        end{case};

        Case InpActMode[cur_input] of
          0: begin
               ConstInpActBttn.Checked := True;
               EditConstInpAct.Enabled := True;
               EditMinRandInpAct.Enabled := False;
               EditMaxRandInpAct.Enabled := False;
             end;

          1: begin
               RandInpActBttn.Checked := True;
               EditConstInpAct.Enabled := False;
               EditMinRandInpAct.Enabled := True;
               EditMaxRandInpAct.Enabled := True;
             end;
        end{case};

        Case USActMode of
          0: begin
               ConstUSActBttn.Checked := True;
               EditConstUSAct.Enabled := True;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
             end;

          1: begin
               RandUSActBttn.Checked := True;
               EditConstUSAct.Enabled := False;
               EditMinRandUSAct.Enabled := True;
               EditMaxRandUSAct.Enabled := True;
             end;

          2: begin
               ConstUS2ActBttn.Checked := True;
               EditConstUS2Act.Enabled := True;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          3: begin
               RandUS2ActBttn.Checked := True;
               EditConstUS2Act.Enabled := False;
               EditMinRandUS2Act.Enabled := True;
               EditMaxRandUS2Act.Enabled := True;
             end;
        end{case};

        Case Contingency of
          0: begin
               Pavlovian1Bttn.Checked := True;

               if (not RDependentCheckBox.Checked) then
                  DisableGroupBox3(sender)
               else
                   EnableGroupBox3(sender);
             end;

          1,2: begin
               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               if Contingency = 1 then
                 OperantBttn.Checked := True
               else
                  OmissionBttn.Checked := True;

               EnableGroupBox3(sender);

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets = 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};
      end;

  BuildHint(sender);
end;

procedure TForm3.tsNextBttnClick(Sender: TObject);
var
   txt : String;
   pi, tot_lines : Integer;
begin
  EditConstInpAct.Color := clWhite;
  EditMinRandInpAct.Color := clWhite;
  EditMaxRandInpAct.Color := clWhite;

  EditConstUSAct.Color := clWhite;
  EditMinRandUSAct.Color := clWhite;
  EditMaxRandUSAct.Color := clWhite;

  EditConstUS2Act.Color := clWhite;
  EditMinRandUS2Act.Color := clWhite;
  EditMaxRandUS2Act.Color := clWhite;

  EditConstInpActChange(Sender);
  EditMinRandInpActChange(Sender);
  EditMaxRandInpActChange(Sender);
  EditConstUSActChange(sender);
  EditMinRandUSActChange(sender);
  EditMaxRandUSActChange(sender);
  EditConstUS2ActChange(sender);
  EditMinRandUS2ActChange(sender);
  EditMaxRandUS2ActChange(sender);

  EditTargetsChange(sender);
  EditNPEChange(sender);
  EditMinOpActChange(sender);
  EditMaxOpActChange(sender);

  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if RDependentCheckBox.Checked then
          RDependent[cur_input] := 1
        else
           RDependent[cur_input] := 0;

        if ConstInpActBttn.Checked then
          InpActMode[cur_input] := 0
        else
          InpActMode[cur_input] := 1;

        if ConstUSActBttn.Checked then
          USActMode := 0;

        if RandUSActBttn.Checked then
          USActMode := 1;

        if ConstUS2ActBttn.Checked then
          USActMode := 2;

        if RandUS2ActBttn.Checked then
          USActMode := 3;

        if Pavlovian1Bttn.Checked then
          Contingency := 0;

        if OperantBttn.Checked then
          Contingency := 1;

        if OmissionBttn.Checked then
          Contingency := 2;

        Cur_ts := Cur_ts + 1;

        Str(Cur_ts,txt);
        StaticText11.caption := txt;
      end;

  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        Str(Cur_Input,txt);
        StaticText19.caption := txt;

        EditConstInpAct.Text := const_inp_Act_Str[cur_input];
        EditMinRandInpAct.Text := min_rand_inp_Act_Str[cur_input];
        EditMaxRandInpAct.Text := max_rand_inp_Act_Str[cur_input];

        (*US1 update*)
        EditConstUSAct.Text := const_US_Act_Str;
        EditMinRandUSAct.Text := min_rand_US_Act_Str;
        EditMaxRandUSAct.Text := max_rand_US_Act_Str;

        (*US2 update*)
        EditConstUS2Act.Text := const_US2_Act_Str;
        EditMinRandUS2Act.Text := min_rand_US2_Act_Str;
        EditMaxRandUS2Act.Text := max_rand_US2_Act_Str;

        Case RDependent[cur_input] of
          0: begin
               RDependentCheckBox.Checked := False;

               if Contingency = 0 then
                 begin
                   Pavlovian1Bttn.Checked := True;
                   EditTargets.Text := '1';
                   StaticText7.Caption := '1';
                   EditNPE.Text := '1';
                   EditMinOpAct.Text := '0';
                   EditMaxOpAct.Text := '1';
                   DisableGroupBox3(sender);
                 end else
                    begin
                      EnableGroupBox3(sender);

                      if Contingency = 1 then OperantBttn.Checked := True
                      else OmissionBttn.Checked := True;

                      str(Tot_Op_Targets,txt);
                      EditTargets.Text := txt;
                      str(Cur_Op_Target,txt);
                      StaticText7.Caption := txt;

                      str(Op_Target[cur_op_target].op_npe,txt);
                      EditNPE.Text := txt;

                      EditMinOpAct.Text := Op_Target[cur_op_target].
                                           min_Op_Act_str;

                      EditMaxOpAct.Text := Op_Target[cur_op_target].
                                           max_Op_Act_str;

                      if Tot_Op_Targets <= 1 then
                        begin
                          TargetNextBttn.Enabled := False;
                          TargetBackBttn.Enabled := False;
                        end else
                          begin
                            if (Cur_Op_Target >= Tot_Op_Targets) and
                               (tot_op_targets > 0) then
                              begin
                                TargetNextBttn.Enabled := False;
                                TargetBackBttn.Enabled := True;
                              end;

                            if (cur_op_target<tot_op_targets) and
                               (cur_op_target > 1) then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := true;
                              end;

                            if cur_op_target = 1 then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := False;
                              end;
                          end;
                    end;
             end;

          1: begin
               RDependentCheckBox.Checked := True;
               EnableGroupBox3(sender);

               if Contingency = 0 then Pavlovian1Bttn.Checked := True;
               if Contingency = 1 then OperantBttn.Checked := True;
               if Contingency = 2 then OmissionBttn.Checked := True;

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
              end;
        end{case};

        Case InpActMode[cur_input] of
          0: begin
               ConstInpActBttn.Checked := True;
               EditConstInpAct.Enabled := True;
               EditMinRandInpAct.Enabled := False;
               EditMaxRandInpAct.Enabled := False;
             end;

          1: begin
               RandInpActBttn.Checked := True;
               EditConstInpAct.Enabled := False;
               EditMinRandInpAct.Enabled := True;
               EditMaxRandInpAct.Enabled := True;
             end;
        end{case};

        Case USActMode of
          0: begin    (*constant US1 activation*)
               ConstUSActBttn.Checked := True;
               EditConstUSAct.Enabled := True;
               RandUSActBttn.Checked := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          1: begin  (*random US1 activation*)
               ConstUSActBttn.Checked := False;
               RandUSActBttn.Checked := True;
               EditConstUSAct.Enabled := False;
               EditMinRandUSAct.Enabled := True;
               EditMaxRandUSAct.Enabled := True;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          2: begin  (*constant US2 activation*)
               ConstUSActBttn.Checked := False;
               EditConstUSAct.Enabled := False;
               RandUSActBttn.Checked := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := True;
               EditConstUS2Act.Enabled := True;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          3: begin  (*random US2 activation*)
               ConstUSActBttn.Checked := False;
               EditConstUSAct.Enabled := False;
               RandUSActBttn.Checked := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := True;
               EditMinRandUS2Act.Enabled := True;
               EditMaxRandUS2Act.Enabled := True;
             end;
        end{case};

        Case Contingency of
          0: begin
               Pavlovian1Bttn.Checked := True;
               OperantBttn.Checked := False;
               OmissionBttn.Checked := False;

               if RDependent[cur_input] = 0 then
                  begin
                      DisableGroupBox3(sender);
                      RDependentCheckBox.Checked := False;

                      EditTargets.Text := '1';
                      StaticText7.Caption := '1';
                      EditNPE.Text := '1';
                      EditMinOpAct.Text := '0';
                      EditMaxOpAct.Text := '1';
                  end else
                     begin
                        EnableGroupBox3(sender);
                        RDependentCheckBox.Checked := True;

                        str(Tot_Op_Targets,txt);
                        EditTargets.Text := txt;
                        str(Cur_Op_Target,txt);
                        StaticText7.Caption := txt;

                        str(Op_Target[cur_op_target].op_npe,txt);
                        EditNPE.Text := txt;

                        EditMinOpAct.Text := Op_Target[cur_op_target].
                                             min_Op_Act_str;

                        EditMaxOpAct.Text := Op_Target[cur_op_target].
                                             max_Op_Act_str;

                        if Tot_Op_Targets <= 1 then
                          begin
                            TargetNextBttn.Enabled := False;
                            TargetBackBttn.Enabled := False;
                          end else
                            begin
                              if (Cur_Op_Target >= Tot_Op_Targets) and
                                 (tot_op_targets > 0) then
                                begin
                                  TargetNextBttn.Enabled := False;
                                  TargetBackBttn.Enabled := True;
                                end;

                              if (cur_op_target<tot_op_targets) and
                                 (cur_op_target > 1) then
                                begin
                                  TargetNextBttn.Enabled := True;
                                  TargetBackBttn.Enabled := true;
                                end;

                              if cur_op_target = 1 then
                                begin
                                  TargetNextBttn.Enabled := True;
                                  TargetBackBttn.Enabled := False;
                                end;
                            end;
                     end;
             end;

        1,2: begin
               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               if RDependent[cur_input] = 0 then
                  RDependentCheckBox.Checked := False
               else
                    RDependentCheckBox.Checked := True;

               if Contingency = 1 then
                 OperantBttn.Checked := True
               else
                  OmissionBttn.Checked := True;

               EnableGroupBox3(sender);

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};

        if Duration = 1 then
          begin
            tsNextBttn.Enabled := False;
            tsBackBttn.Enabled := False;
          end else
            begin
              if Cur_ts >= Duration then
                begin
                  tsNextBttn.Enabled := False;
                  tsBackBttn.Enabled := True;
                end;

              if (cur_ts < Duration) and (cur_ts > 1) then
                begin
                  tsNextBttn.Enabled := True;
                  tsBackBttn.Enabled := true;
                end;

              if cur_ts = 1 then
                begin
                  tsNextBttn.Enabled := True;
                  tsBackBttn.Enabled := False;
                end;
            end;

        if Tot_Inputs = 1 then
          begin
            InpNextBttn.Enabled := False;
            InpBackBttn.Enabled := False;
          end else
            begin
              if cur_input = tot_inputs then
                begin
                  InpNextBttn.Enabled := False;
                  InpBackBttn.Enabled := True;
                end;

              if (cur_input < Tot_Inputs) and (cur_input > 1) then
                begin
                  InpNextBttn.Enabled := True;
                  InpBackBttn.Enabled := true;
                end;

              if (cur_input = 1) and (tot_inputs > 1) then
                begin
                  InpNextBttn.Enabled := True;
                  InpBackBttn.Enabled := False;
                end;
            end;
      end;
end;

procedure TForm3.tsBackBttnClick(Sender: TObject);
var
   txt : String;
   pi, tot_lines : Integer;
begin
  EditConstInpAct.Color := clWhite;
  EditMinRandInpAct.Color := clWhite;
  EditMaxRandInpAct.Color := clWhite;

  EditConstUSAct.Color := clWhite;
  EditMinRandUSAct.Color := clWhite;
  EditMaxRandUSAct.Color := clWhite;
  EditConstUS2Act.Color := clWhite;
  EditMinRandUS2Act.Color := clWhite;
  EditMaxRandUS2Act.Color := clWhite;

  EditConstInpActChange(Sender);
  EditMinRandInpActChange(Sender);
  EditMaxRandInpActChange(Sender);

  EditConstUSActChange(sender);
  EditMinRandUSActChange(sender);
  EditMaxRandUSActChange(sender);

  EditConstUS2ActChange(sender);
  EditMinRandUS2ActChange(sender);
  EditMaxRandUS2ActChange(sender);

  EditTargetsChange(sender);
  EditNPEChange(sender);
  EditMinOpActChange(sender);
  EditMaxOpActChange(sender);

  with trial_type[cur_trial_type] do (* first get everything from current ts *)
    with ts[cur_ts] do
      begin
        if ConstInpActBttn.Checked then
          InpActMode[cur_input] := 0
        else
          InpActMode[cur_input] := 1;

        if ConstUSActBttn.Checked then
          USActMode := 0;

        if RandUSActBttn.Checked then
          USActMode := 1;

        if ConstUS2ActBttn.Checked then
          USActMode := 2;

        if RandUS2ActBttn.Checked then
          USActMode := 3;

        if Pavlovian1Bttn.Checked then
          Contingency := 0;

        if OperantBttn.Checked then
          Contingency := 1;

        if OmissionBttn.Checked then
          Contingency := 2;

        Cur_ts := Cur_ts - 1;  (* now go to the immediately previous ts *)

        Str(Cur_ts,txt);
        StaticText11.caption := txt;
      end;

  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        Str(Cur_Input,txt);
        StaticText19.caption := txt;

        EditConstInpAct.Text := const_inp_Act_Str[cur_input];
        EditMinRandInpAct.Text := min_rand_inp_Act_Str[cur_input];
        EditMaxRandInpAct.Text := max_rand_inp_Act_Str[cur_input];

        (*US1 update*)
        EditConstUSAct.Text := const_US_Act_Str;
        EditMinRandUSAct.Text := min_rand_US_Act_Str;
        EditMaxRandUSAct.Text := max_rand_US_Act_Str;

        (*US2 update*)
        EditConstUS2Act.Text := const_US2_Act_Str;
        EditMinRandUS2Act.Text := min_rand_US2_Act_Str;
        EditMaxRandUS2Act.Text := max_rand_US2_Act_Str;

        Case RDependent[cur_input] of
          0: begin
               RDependentCheckBox.Checked := False;

               if Contingency = 0 then
                 begin
                   DisableGroupBox3(sender);
                   Pavlovian1Bttn.Checked := True;
                   EditTargets.Text := '1';
                   StaticText7.Caption := '1';
                   EditNPE.Text := '1';
                   EditMinOpAct.Text := '0';
                   EditMaxOpAct.Text := '1';
                   DisableGroupBox3(sender);
                 end else
                    begin
                      EnableGroupBox3(sender);

                      if Contingency = 1 then OperantBttn.Checked := True
                        else OmissionBttn.Checked := True;

                      str(Tot_Op_Targets,txt);
                      EditTargets.Text := txt;
                      str(Cur_Op_Target,txt);
                      StaticText7.Caption := txt;

                      str(Op_Target[cur_op_target].op_npe,txt);
                      EditNPE.Text := txt;

                      EditMinOpAct.Text := Op_Target[cur_op_target].
                                           min_Op_Act_str;

                      EditMaxOpAct.Text := Op_Target[cur_op_target].
                                           max_Op_Act_str;

                      if Tot_Op_Targets <= 1 then
                        begin
                          TargetNextBttn.Enabled := False;
                          TargetBackBttn.Enabled := False;
                        end else
                          begin
                            if (Cur_Op_Target >= Tot_Op_Targets) and
                               (tot_op_targets > 0) then
                              begin
                                TargetNextBttn.Enabled := False;
                                TargetBackBttn.Enabled := True;
                              end;

                            if (cur_op_target<tot_op_targets) and
                               (cur_op_target > 1) then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := true;
                              end;

                            if cur_op_target = 1 then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := False;
                              end;
                          end;
                    end;
             end;

          1: begin
               RDependentCheckBox.Checked := True;
               EnableGroupBox3(sender);

               if Contingency = 0 then
                begin
                  Pavlovian1Bttn.Checked := True;
                  OperantBttn.Checked := False;
                  OmissionBttn.Checked := False;
                end;

               if Contingency = 1 then
                begin
                  Pavlovian1Bttn.Checked := False;
                  OperantBttn.Checked := True;
                end;

               if Contingency = 2 then
                begin
                  Pavlovian1Bttn.Checked := False;
                  OmissionBttn.Checked := True;
                end;

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
              end;
        end{case};

        Case InpActMode[cur_input] of
          0: begin
               ConstInpActBttn.Checked := True;
               EditConstInpAct.Enabled := True;
               EditMinRandInpAct.Enabled := False;
               EditMaxRandInpAct.Enabled := False;
             end;

          1: begin
               RandInpActBttn.Checked := True;
               EditConstInpAct.Enabled := False;
               EditMinRandInpAct.Enabled := True;
               EditMaxRandInpAct.Enabled := True;
             end;
        end{case};

        Case USActMode of
          0: begin    (*constant US1 activation*)
               ConstUSActBttn.Checked := True;
               EditConstUSAct.Enabled := True;
               RandUSActBttn.Checked := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          1: begin  (*random US1 activation*)
               ConstUSActBttn.Checked := False;
               EditConstUSAct.Enabled := False;
               RandUSActBttn.Checked := True;
               EditMinRandUSAct.Enabled := True;
               EditMaxRandUSAct.Enabled := True;
               ConstUS2ActBttn.Checked := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          2: begin  (*constant US2 activation*)
               ConstUSActBttn.Checked := False;
               EditConstUSAct.Enabled := False;
               RandUSActBttn.Checked := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               ConstUS2ActBttn.Checked := True;
               EditConstUS2Act.Enabled := True;
               RandUS2ActBttn.Checked := False;
               EditMinRandUS2Act.Enabled := False;
               EditMaxRandUS2Act.Enabled := False;
             end;

          3: begin  (*random US2 activation*)
               ConstUSActBttn.Checked := False;
               EditConstUSAct.Enabled := False;
               RandUSActBttn.Checked := False;
               EditMinRandUSAct.Enabled := False;
               EditMaxRandUSAct.Enabled := False;
               EditConstUS2Act.Enabled := False;
               RandUS2ActBttn.Checked := True;
               EditMinRandUS2Act.Enabled := True;
               EditMaxRandUS2Act.Enabled := True;
             end;
        end{case};

        Case Contingency of
          0: begin
               Pavlovian1Bttn.Checked := True;
               OperantBttn.Checked := False;
               OmissionBttn.Checked := False;

               if RDependent[cur_input] = 0 then
                  begin
                      DisableGroupBox3(sender);
                      RDependentCheckBox.Checked := False;

                      EditTargets.Text := '1';
                      StaticText7.Caption := '1';
                      EditNPE.Text := '1';
                      EditMinOpAct.Text := '0';
                      EditMaxOpAct.Text := '1';
                  end else
                     begin
                        EnableGroupBox3(sender);
                        RDependentCheckBox.Checked := True;

                        str(Tot_Op_Targets,txt);
                        EditTargets.Text := txt;
                        str(Cur_Op_Target,txt);
                        StaticText7.Caption := txt;

                        str(Op_Target[cur_op_target].op_npe,txt);
                        EditNPE.Text := txt;

                        EditMinOpAct.Text := Op_Target[cur_op_target].
                                             min_Op_Act_str;

                        EditMaxOpAct.Text := Op_Target[cur_op_target].
                                             max_Op_Act_str;

                        if Tot_Op_Targets <= 1 then
                          begin
                            TargetNextBttn.Enabled := False;
                            TargetBackBttn.Enabled := False;
                          end else
                            begin
                              if (Cur_Op_Target >= Tot_Op_Targets) and
                                 (tot_op_targets > 0) then
                                begin
                                  TargetNextBttn.Enabled := False;
                                  TargetBackBttn.Enabled := True;
                                end;

                              if (cur_op_target<tot_op_targets) and
                                 (cur_op_target > 1) then
                                begin
                                  TargetNextBttn.Enabled := True;
                                  TargetBackBttn.Enabled := true;
                                end;

                              if cur_op_target = 1 then
                                begin
                                  TargetNextBttn.Enabled := True;
                                  TargetBackBttn.Enabled := False;
                                end;
                            end;
                     end;
             end;

        1,2: begin
               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               if RDependent[cur_input] = 0 then
                  RDependentCheckBox.Checked := False
               else
                    RDependentCheckBox.Checked := True;

               if Contingency = 1 then
                 OperantBttn.Checked := True
               else
                  OmissionBttn.Checked := True;

               EnableGroupBox3(sender);

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};

        if Duration = 1 then
          begin
            tsNextBttn.Enabled := False;
            tsBackBttn.Enabled := False;
          end else
             begin
               if Cur_ts >= Duration then
                 begin
                   tsNextBttn.Enabled := False;
                   tsBackBttn.Enabled := True;
                 end;

               if (cur_ts < Duration) and (cur_ts > 1) then
                 begin
                   tsNextBttn.Enabled := True;
                   tsBackBttn.Enabled := true;
                 end;

               if cur_ts = 1 then
                 begin
                   tsNextBttn.Enabled := True;
                   tsBackBttn.Enabled := False;
                 end;
             end;

        if Tot_Inputs = 1 then
          begin
            InpNextBttn.Enabled := False;
            InpBackBttn.Enabled := False;
          end else
             begin
               if Cur_input >= tot_inputs then
                 begin
                   InpNextBttn.Enabled := False;
                   InpBackBttn.Enabled := True;
                 end;

               if (cur_input < tot_inputs) and (cur_input > 1) then
                 begin
                   InpNextBttn.Enabled := True;
                   InpBackBttn.Enabled := true;
                 end;

               if cur_input = 1 then
                 begin
                   InpNextBttn.Enabled := True;
                   InpBackBttn.Enabled := False;
                 end;
             end;
      end;
end;

procedure TForm3.tsInsBttnClick(Sender: TObject);
var
   t, i : integer;
   txt : String[4];
begin
  with trial_type[cur_trial_type] do
    begin
      if Duration < Max_Duration  then
        Duration := Duration + 1
      else
         tsInsBttn.Enabled := False;

      tsDelBttn.Enabled := True;

      Str(Duration,txt);
      EditDuration.Text := txt;

      if cur_ts = 1 then
        begin
          tsNextBttn.Enabled := True;
          tsBackBttn.Enabled := False;
        end;

      if Trial_Type[Cur_Trial_Type].cur_ts > 1 then
         tsBackBttn.Enabled := True;

      if cur_ts = duration then
        begin
          tsNextBttn.Enabled := False;
          tsBackBttn.Enabled := True;
        end;

     if (cur_ts > 1) and (cur_ts < duration) then
       begin
         tsNextBttn.Enabled := True;
         tsBackBttn.Enabled := True;
       end;

     for t := Duration downto cur_ts + 1 do
       with ts[t] do
         begin
           RDependent := ts[t-1].RDependent;
           InpActMode := ts[t-1].InpActMode;
           const_Inp_Act := ts[t-1].const_Inp_Act;
           min_rand_Inp_Act := ts[t-1].min_rand_Inp_Act;
           max_rand_Inp_Act := ts[t-1].max_rand_Inp_Act;
           const_Inp_Act_Str := ts[t-1].const_Inp_Act_Str;
           min_rand_Inp_Act_Str := ts[t-1].min_rand_Inp_Act_Str;
           max_rand_Inp_Act_Str := ts[t-1].max_rand_Inp_Act_Str;

           USActMode := ts[t-1].USActMode;
           const_US_Act := ts[t-1].const_US_Act;
           min_rand_US_Act := ts[t-1].min_rand_US_Act;
           max_rand_US_Act := ts[t-1].max_rand_US_Act;
           const_US_Act_str := ts[t-1].const_US_Act_str;
           min_rand_US_Act_str := ts[t-1].min_rand_US_Act_str;
           max_rand_US_Act_str := ts[t-1].max_rand_US_Act_str;
           const_US2_Act := ts[t-1].const_US2_Act;
           min_rand_US2_Act := ts[t-1].min_rand_US2_Act;
           max_rand_US2_Act := ts[t-1].max_rand_US2_Act;
           const_US2_Act_str := ts[t-1].const_US2_Act_str;
           min_rand_US2_Act_str := ts[t-1].min_rand_US2_Act_str;
           max_rand_US2_Act_str := ts[t-1].max_rand_US2_Act_str;

           contingency := ts[t-1].contingency;
           Tot_Op_Targets := ts[t-1].Tot_Op_Targets;
           Cur_Op_Target := ts[t-1].Cur_Op_Target;
           Op_Target := ts[t-1].op_Target;
         end;

         with ts[cur_ts] do
           begin
             for i := 1 to Max_Inputs do
               begin
                 RDependent[i] := 0;
                 InpActMode[i] := 0;
                 const_Inp_Act[i] := 0;
                 min_rand_Inp_Act[i] := 0;
                 max_rand_Inp_Act[i] := 1;
                 const_Inp_Act_Str[i] := '0';
                 min_rand_Inp_Act_Str[i] := '0';
                 max_rand_Inp_Act_Str[i] := '1';
               end;

             USActMode := 0;
             Const_US_Act := 0;
             Min_Rand_US_Act := 0;
             Max_Rand_US_Act := 1;
             Const_US2_Act_str := '0';
             Min_Rand_US2_Act_str := '0';
             Max_Rand_US2_Act_str := '1';
             Const_US2_Act := 0;
             Min_Rand_US2_Act := 0;
             Max_Rand_US2_Act := 1;
             Const_US2_Act_str := '0';
             Min_Rand_US2_Act_str := '0';
             Max_Rand_US2_Act_str := '1';

             contingency := 0;
             Tot_Op_Targets := 1;
             Cur_Op_Target := 1;

             for i := 1 to Max_Op_Targets do
               with op_target[i] do
                 begin
                    Op_NPE := 0;
                    Min_Op_Act := 0;
                    Max_Op_Act := 1;
                    Min_Op_Act_str := '0';
                    Max_Op_Act_str := '1';
                 end;
           end;

         RDependentCheckBox.Checked := False;
         ConstInpActBttn.Checked := True;
         EditConstInpAct.Enabled := True;
         EditMinRandInpAct.Enabled := False;
         EditMaxRandInpAct.Enabled := False;
         EditConstInpAct.Text := '0';
         EditMinRandInpAct.Text := '0';
         EditMaxRandInpAct.Text := '1';

         ConstUSActBttn.Checked := True;
         EditConstUSAct.Enabled := True;
         EditMinRandUSAct.Enabled := False;
         EditMaxRandUSAct.Enabled := False;
         EditConstUSAct.Text := '0';
         EditMinRandUSAct.Text := '0';
         EditMaxRandUSAct.Text := '1';

         Pavlovian1Bttn.Checked := True;

       { operant box... }
         EditTargets.Text := '1';

         TargetNextBttn.Enabled := False;
         TargetBackBttn.Enabled := False;
    end;

  BuildHint(sender);
end;

procedure TForm3.tsDelBttnClick(Sender: TObject);
var
   i, t : integer;
   txt : String[2];
begin
  if MessageDlg('Delete current time-step?',
                 mtConfirmation,[mbYes, mbNo],0) = mrYes then
  with trial_type[cur_trial_type] do
    begin
      if cur_ts = duration then
        with ts[cur_ts] do
          begin
           RDependent := ts[cur_ts-1].RDependent;
           InpActMode := ts[cur_ts-1].InpActMode;
           const_Inp_Act := ts[cur_ts-1].const_Inp_Act;
           min_rand_Inp_Act := ts[cur_ts-1].min_rand_Inp_Act;
           max_rand_Inp_Act := ts[cur_ts-1].max_rand_Inp_Act;
           const_Inp_Act_Str := ts[cur_ts-1].const_Inp_Act_Str;
           min_rand_Inp_Act_Str := ts[cur_ts-1].min_rand_Inp_Act_Str;
           max_rand_Inp_Act_Str := ts[cur_ts-1].max_rand_Inp_Act_Str;

           const_US_Act := ts[cur_ts-1].const_US_Act;
           const_US_Act_Str := ts[cur_ts-1].const_US_Act_Str;
           min_rand_US_Act := ts[cur_ts-1].min_rand_US_Act;
           min_rand_US_Act_Str := ts[cur_ts-1].min_rand_US_Act_Str;
           max_rand_US_Act := ts[cur_ts-1].max_rand_US_Act;
           max_rand_US_Act_Str := ts[cur_ts-1].max_rand_US_Act_Str;

           Contingency := ts[cur_ts-1].Contingency;
           Tot_Op_Targets := ts[cur_ts-1].Tot_Op_Targets;
           Op_Target := ts[cur_ts-1].Op_Target;

           EditConstInpAct.Text := ts[cur_ts-1].
                                   const_Inp_Act_Str[cur_input];

           EditMinRandInpAct.Text := ts[cur_ts-1].
                                     min_rand_Inp_Act_Str[cur_input];

           EditMaxRandInpAct.Text := ts[cur_ts-1].
                                     max_rand_Inp_Act_Str[cur_input];

           EditConstUSAct.Text := ts[cur_ts-1].const_US_Act_Str;
           EditMinRandUSAct.Text := ts[cur_ts-1].Min_Rand_US_Act_Str;
           EditMaxRandUSAct.Text := ts[cur_ts-1].Max_Rand_US_Act_Str;

           case ts[cur_ts-1].contingency of
             0: Pavlovian1Bttn.Checked := True;
             1: OperantBttn.Checked := True;
             2: OmissionBttn.Checked := True;
           end;

           str(ts[cur_ts-1].tot_op_targets, txt);
           EditTargets.Text := txt;
         end else
            begin
              EditConstInpAct.Text := ts[cur_ts+1].
                                      const_inp_Act_Str[ts[cur_ts+1].
                                                        cur_input];

              EditMinRandInpAct.Text := ts[cur_ts+1].
                                        min_rand_inp_Act_Str[ts[cur_ts+1].
                                                             cur_input];

              EditMaxRandInpAct.Text := ts[cur_ts+1].
                                        max_rand_inp_Act_Str[ts[cur_ts+1].
                                                             cur_input];

              EditConstUSAct.Text := ts[cur_ts+1].const_US_Act_Str;
              EditMinRandUSAct.Text := ts[cur_ts+1].min_rand_US_Act_Str;
              EditMaxRandUSAct.Text := ts[cur_ts+1].min_rand_US_Act_Str;

              case ts[cur_ts+1].contingency of
                0: Pavlovian1Bttn.Checked := True;
                1: OperantBttn.Checked := True;
                2: OmissionBttn.Checked := True;
              end;

              str(ts[cur_ts+1].tot_op_targets, txt);
              EditTargets.Text := txt;

              for t := cur_ts to Duration - 1 do
                with ts[t] do
                   begin
                     RDependent := ts[t+1].RDependent;
                     InpActMode := ts[t+1].InpActMode;
                     const_Inp_Act := ts[t+1].const_Inp_Act;
                     const_Inp_Act_Str := ts[t+1].const_Inp_Act_Str;
                     min_rand_Inp_Act := ts[t+1].min_rand_Inp_Act;
                     max_rand_Inp_Act_Str := ts[t+1].max_rand_Inp_Act_Str;

                     const_US_Act := ts[t+1].const_US_Act;
                     const_US_Act_Str := ts[t+1].const_US_Act_Str;
                     min_rand_US_Act := ts[t+1].min_rand_US_Act;
                     min_rand_US_Act_Str := ts[t+1].min_rand_US_Act_Str;
                     max_rand_US_Act := ts[t+1].max_rand_US_Act;
                     max_rand_US_Act_Str := ts[t+1].max_rand_US_Act_Str;

                     Contingency := ts[t+1].Contingency;
                     Tot_Op_Targets := ts[t+1].Tot_Op_Targets;
                     Op_Target := ts[t+1].Op_Target;
                end;
            end;

      with Trial_Type[cur_trial_type] do
        begin
          tot_inputs := 1;
          ts[duration].cur_input := 1;

          for i := 1 to Max_Inputs do
             with ts[duration] do
               begin
                 const_Inp_Act[i] := 0;
                 const_Inp_Act_Str[i] := '';
                 min_rand_Inp_Act[i] := 0;
                 min_rand_Inp_Act_Str[i] := '';
                 max_rand_Inp_Act[i] := 0;
                 max_rand_Inp_Act_Str[i] := '';
               end;

          with ts[duration] do
             begin
               const_US_Act := 0;
               const_US_Act_Str := '';
               min_rand_US_Act := 0;
               max_rand_US_Act_Str := '';

               contingency := 0;
               Tot_Op_Targets := 1;
               cur_op_target := 1;
             end;

          for i := 1 to Max_Op_Targets do
            with ts[duration].Op_Target[i] do
              begin
                op_npe := 0; { what should this default be...? hmmm...}
                Min_Op_Act := 0;
                Max_Op_Act := 1;
                Min_Op_Act_Str := '0';
                Max_Op_Act_Str := '1';
              end;

          if duration > 1 then
            duration := duration - 1
          else
            begin
              tsDelBttn.Enabled := False;
              tsInsBttn.Enabled := True;
            end;

          Str(duration,txt);
          EditDuration.Text := txt;

          if duration = 1 then
            begin
              cur_ts := 1;
              StaticText11.Caption := '1';
              tsNextBttn.Enabled := False;
              tsBackBttn.Enabled := False;
              tsDelBttn.Enabled := False;
              tsInsBttn.Enabled := True;
            end else
              begin
                if cur_ts = 1 then
                  begin
                    tsNextBttn.Enabled := True;
                    tsBackBttn.Enabled := False;
                  end;

                if cur_ts > 1 then
                  tsBackBttn.Enabled := True;

                if cur_ts = duration then
                  begin
                    tsNextBttn.Enabled := False;
                    tsBackBttn.Enabled := True;
                  end;

                if cur_ts > duration then
                  begin
                    cur_ts := duration;
                    str(cur_ts,txt);
                    StaticText11.Caption := txt;
                    tsNextBttn.Enabled := False;
                  end;
              end;

          if (cur_ts > 1) and (cur_ts < duration) then
            begin
              tsNextBttn.Enabled := True;
              tsBackBttn.Enabled := True;
            end;

          Pavlovian1Bttn.Checked := True;
        end;
   end;

  BuildHint(sender);
end;

procedure TForm3.InpNextBttnClick(Sender: TObject);
var
   txt : String;
   pi, tot_lines : Integer;
begin
  EditConstInpAct.Color := clWhite;
  EditMinRandInpAct.Color := clWhite;
  EditMaxRandInpAct.Color := clWhite;

  EditConstInpActChange(Sender);
  EditMinRandInpActChange(Sender);
  EditMaxRandInpActChange(Sender);

  if (RDependentCheckBox.Checked) or
     (OperantBttn.Checked) or
     (OmissionBttn.Checked) then
    begin
      EditTargetsChange(sender);
      EditNPEChange(sender);
      EditMinOpActChange(sender);
      EditMaxOpActChange(sender);
    end;

   with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if RDependentCheckBox.Checked then
          begin
            RDependent[cur_input] := 1;
          end else
           RDependent[cur_input] := 0;

        If ConstInpActBttn.Checked then
          InpActMode[cur_input] := 0
        else
           InpActMode[cur_input] := 1;

        if Pavlovian1Bttn.Checked then
          Contingency := 0;

        if OperantBttn.Checked then
          Contingency := 1;

        if OmissionBttn.Checked then
          Contingency := 2;

        if cur_input < tot_inputs then
           cur_input := cur_input + 1;

        Str(cur_input,txt);
        StaticText19.caption := txt;

        EditConstInpAct.Text := const_inp_act_str[cur_input];
        EditMinRandInpAct.Text := min_rand_inp_act_str[cur_input];
        EditMaxRandInpAct.Text := max_rand_inp_act_str[cur_input];

        Case RDependent[cur_input] of
          0: begin
               RDependentCheckBox.Checked := False;

               if Contingency = 0 then
                 begin
                   Pavlovian1Bttn.Checked := True;
                   EditTargets.Text := '1';
                   StaticText7.Caption := '1';
                   EditNPE.Text := '1';
                   EditMinOpAct.Text := '0';
                   EditMaxOpAct.Text := '1';
                   DisableGroupBox3(sender);
                 end else
                    begin
                      EnableGroupBox3(sender);

                      if Contingency = 1 then OperantBttn.Checked := True
                      else OmissionBttn.Checked := True;

                      str(Tot_Op_Targets,txt);
                      EditTargets.Text := txt;
                      str(Cur_Op_Target,txt);
                      StaticText7.Caption := txt;

                      str(Op_Target[cur_op_target].op_npe,txt);
                      EditNPE.Text := txt;

                      EditMinOpAct.Text := Op_Target[cur_op_target].
                                           min_Op_Act_str;

                      EditMaxOpAct.Text := Op_Target[cur_op_target].
                                           max_Op_Act_str;

                      if Tot_Op_Targets <= 1 then
                        begin
                          TargetNextBttn.Enabled := False;
                          TargetBackBttn.Enabled := False;
                        end else
                          begin
                            if (Cur_Op_Target >= Tot_Op_Targets) and
                               (tot_op_targets > 0) then
                              begin
                                TargetNextBttn.Enabled := False;
                                TargetBackBttn.Enabled := True;
                              end;

                            if (cur_op_target<tot_op_targets) and
                               (cur_op_target > 1) then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := true;
                              end;

                            if cur_op_target = 1 then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := False;
                              end;
                          end;
                    end;
             end;

          1: begin
               EnableGroupBox3(sender);
               RDependentCheckBox.Checked := True;

               if Contingency = 0 then Pavlovian1Bttn.Checked := True;
               if Contingency = 1 then OperantBttn.Checked := True;
               if Contingency = 2 then OmissionBttn.Checked := True;

               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};

        Case InpActMode[cur_input] of
          0: begin
               ConstInpActBttn.Checked := True;
               EditConstInpAct.Enabled := True;
               EditMinRandInpAct.Enabled := False;
               EditMaxRandInpAct.Enabled := False;
             end;

          1: begin
               RandInpActBttn.Checked := True;
               EditConstInpAct.Enabled := False;
               EditMinRandInpAct.Enabled := True;
               EditMaxRandInpAct.Enabled := True;
             end;
        end{case};

       Case Contingency of
          0: begin
               Pavlovian1Bttn.Checked := True;
               OperantBttn.Checked := False;
               OmissionBttn.Checked := False;

               if RDependent[cur_input] = 0 then
                  begin
                      DisableGroupBox3(sender);
                      RDependentCheckBox.Checked := False;

                      EditTargets.Text := '1';
                      StaticText7.Caption := '1';
                      EditNPE.Text := '1';
                      EditMinOpAct.Text := '0';
                      EditMaxOpAct.Text := '1';
                  end else
                     begin
                        EnableGroupBox3(sender);
                        RDependentCheckBox.Checked := True;

                        str(Tot_Op_Targets,txt);
                        EditTargets.Text := txt;
                        str(Cur_Op_Target,txt);
                        StaticText7.Caption := txt;

                        str(Op_Target[cur_op_target].op_npe,txt);
                        EditNPE.Text := txt;

                        EditMinOpAct.Text := Op_Target[cur_op_target].
                                             min_Op_Act_str;

                        EditMaxOpAct.Text := Op_Target[cur_op_target].
                                             max_Op_Act_str;

                        if Tot_Op_Targets <= 1 then
                          begin
                            TargetNextBttn.Enabled := False;
                            TargetBackBttn.Enabled := False;
                          end else
                            begin
                              if (Cur_Op_Target >= Tot_Op_Targets) and
                                 (tot_op_targets > 0) then
                                begin
                                  TargetNextBttn.Enabled := False;
                                  TargetBackBttn.Enabled := True;
                                end;

                              if (cur_op_target<tot_op_targets) and
                                 (cur_op_target > 1) then
                                begin
                                  TargetNextBttn.Enabled := True;
                                  TargetBackBttn.Enabled := true;
                                end;

                              if cur_op_target = 1 then
                                begin
                                  TargetNextBttn.Enabled := True;
                                  TargetBackBttn.Enabled := False;
                                end;
                            end;
                     end;
             end;

          1: begin
               Pavlovian1Bttn.Checked := False;
               OperantBttn.Checked := True;
               OmissionBttn.Checked := False;

               if RDependent[cur_input] = 0 then
                  RDependentCheckBox.Checked := False
               else
                    RDependentCheckBox.Checked := True;

               EnableGroupBox3(sender);

               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;

          2: begin
               Pavlovian1Bttn.Checked := False;
               OperantBttn.Checked := False;
               OmissionBttn.Checked := True;

               if RDependent[cur_input] = 0 then
                  RDependentCheckBox.Checked := False
               else
                    RDependentCheckBox.Checked := True;

               EnableGroupBox3(sender);

               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};

       if Tot_Inputs = 1 then
          begin
            InpNextBttn.Enabled := False;
            InpBackBttn.Enabled := False;
          end;

       if cur_input = tot_inputs then
          begin
            InpNextBttn.Enabled := False;

            if tot_inputs>1 then
              InpBackBttn.Enabled := True
            else
             InpBackBttn.Enabled := False;
          end;

       if (cur_input < Tot_Inputs) and (cur_input > 1) then
         begin
           InpNextBttn.Enabled := True;
           InpBackBttn.Enabled := true;
         end;

       if (cur_input = 1) and (tot_inputs > 1) then
         begin
           InpNextBttn.Enabled := True;
           InpBackBttn.Enabled := False;
         end;
      end;
end;

procedure TForm3.InpBackBttnClick(Sender: TObject);
var
   txt : String;
begin
  EditConstInpAct.Color := clWhite;
  EditMinRandInpAct.Color := clWhite;
  EditMaxRandInpAct.Color := clWhite;

  EditConstInpActChange(Sender);
  EditMinRandInpActChange(Sender);
  EditMaxRandInpActChange(Sender);

  if (RDependentCheckBox.Checked) or
     (OperantBttn.Checked) or
     (OmissionBttn.Checked) then
    begin
      EditTargetsChange(sender);
      EditNPEChange(sender);
      EditMinOpActChange(sender);
      EditMaxOpActChange(sender);
    end;

  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if RDependentCheckBox.Checked then
          begin
            RDependent[cur_input] := 1;
          end else
             RDependent[cur_input] := 0;

        If ConstInpActBttn.Checked then
          InpActMode[cur_input] := 0
        else
           InpActMode[cur_input] := 1;

        if Pavlovian1Bttn.Checked then
          Contingency := 0;

        if OperantBttn.Checked then
          Contingency := 1;

        if OmissionBttn.Checked then
          Contingency := 2;

        if cur_input > 1 then
           cur_input := cur_input - 1;

        Str(cur_input,txt);
        StaticText19.caption := txt;

        EditConstInpAct.Text := const_inp_act_str[cur_input];
        EditMinRandInpAct.Text := min_rand_inp_act_str[cur_input];
        EditMaxRandInpAct.Text := max_rand_inp_act_str[cur_input];

        Case RDependent[cur_input] of
          0: begin
               RDependentCheckBox.Checked := False;

               if Contingency = 0 then
                 begin
                   Pavlovian1Bttn.Checked := True;
                   EditTargets.Text := '1';
                   StaticText7.Caption := '1';
                   EditNPE.Text := '1';
                   EditMinOpAct.Text := '0';
                   EditMaxOpAct.Text := '1';
                   DisableGroupBox3(sender);
                 end else
                    begin
                      EnableGroupBox3(sender);

                      if Contingency = 1 then OperantBttn.Checked := True
                      else OmissionBttn.Checked := True;

                      str(Tot_Op_Targets,txt);
                      EditTargets.Text := txt;
                      str(Cur_Op_Target,txt);
                      StaticText7.Caption := txt;

                      str(Op_Target[cur_op_target].op_npe,txt);
                      EditNPE.Text := txt;

                      EditMinOpAct.Text := Op_Target[cur_op_target].
                                           min_Op_Act_str;

                      EditMaxOpAct.Text := Op_Target[cur_op_target].
                                           max_Op_Act_str;

                      if Tot_Op_Targets <= 1 then
                        begin
                          TargetNextBttn.Enabled := False;
                          TargetBackBttn.Enabled := False;
                        end else
                          begin
                            if (Cur_Op_Target >= Tot_Op_Targets) and
                               (tot_op_targets > 0) then
                              begin
                                TargetNextBttn.Enabled := False;
                                TargetBackBttn.Enabled := True;
                              end;

                            if (cur_op_target<tot_op_targets) and
                               (cur_op_target > 1) then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := true;
                              end;

                            if cur_op_target = 1 then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := False;
                              end;
                          end;
                    end;
             end;

          1: begin
               RDependentCheckBox.Checked := True;
               EnableGroupBox3(sender);

               if Contingency = 0 then Pavlovian1Bttn.Checked := True;
               if Contingency = 1 then OperantBttn.Checked := True;
               if Contingency = 2 then OmissionBttn.Checked := True;

               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};

        Case InpActMode[cur_input] of
          0: begin
               ConstInpActBttn.Checked := True;
               EditConstInpAct.Enabled := True;
               EditMinRandInpAct.Enabled := False;
               EditMaxRandInpAct.Enabled := False;
             end;

          1: begin
               RandInpActBttn.Checked := True;
               EditConstInpAct.Enabled := False;
               EditMinRandInpAct.Enabled := True;
               EditMaxRandInpAct.Enabled := True;
             end;
        end{case};

       Case Contingency of
          0: begin
               Pavlovian1Bttn.Checked := True;
               OperantBttn.Checked := False;
               OmissionBttn.Checked := False;

               if RDependent[cur_input] = 0 then
                  begin
                      DisableGroupBox3(sender);
                      RDependentCheckBox.Checked := False;

                      EditTargets.Text := '1';
                      StaticText7.Caption := '1';
                      EditNPE.Text := '1';
                      EditMinOpAct.Text := '0';
                      EditMaxOpAct.Text := '1';
                  end else
                     begin
                        EnableGroupBox3(sender);
                        RDependentCheckBox.Checked := True;

                        str(Tot_Op_Targets,txt);
                        EditTargets.Text := txt;
                        str(Cur_Op_Target,txt);
                        StaticText7.Caption := txt;

                        str(Op_Target[cur_op_target].op_npe,txt);
                        EditNPE.Text := txt;

                        EditMinOpAct.Text := Op_Target[cur_op_target].
                                             min_Op_Act_str;

                        EditMaxOpAct.Text := Op_Target[cur_op_target].
                                             max_Op_Act_str;

                        if Tot_Op_Targets <= 1 then
                          begin
                            TargetNextBttn.Enabled := False;
                            TargetBackBttn.Enabled := False;
                          end else
                            begin
                              if (Cur_Op_Target >= Tot_Op_Targets) and
                                 (tot_op_targets > 0) then
                                begin
                                  TargetNextBttn.Enabled := False;
                                  TargetBackBttn.Enabled := True;
                                end;

                              if (cur_op_target<tot_op_targets) and
                                 (cur_op_target > 1) then
                                begin
                                  TargetNextBttn.Enabled := True;
                                  TargetBackBttn.Enabled := true;
                                end;

                              if cur_op_target = 1 then
                                begin
                                  TargetNextBttn.Enabled := True;
                                  TargetBackBttn.Enabled := False;
                                end;
                            end;
                     end;
             end;

          1: begin
               Pavlovian1Bttn.Checked := False;
               OperantBttn.Checked := True;
               OmissionBttn.Checked := False;

               EnableGroupBox3(sender);

               if RDependent[cur_input] = 0 then
                  RDependentCheckBox.Checked := False
               else
                    RDependentCheckBox.Checked := True;

               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;

          2: begin
               Pavlovian1Bttn.Checked := False;
               OperantBttn.Checked := False;
               OmissionBttn.Checked := True;

               EnableGroupBox3(sender);

               if RDependent[cur_input] = 0 then
                  RDependentCheckBox.Checked := False
               else
                    RDependentCheckBox.Checked := True;

               str(Tot_Op_Targets,txt);
               EditTargets.Text := txt;
               str(Cur_Op_Target,txt);
               StaticText7.Caption := txt;

               str(Op_Target[cur_op_target].op_npe,txt);
               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets <= 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if (Cur_Op_Target >= Tot_Op_Targets) and
                        (tot_op_targets > 0) then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};

        if Tot_Inputs = 1 then
          begin
            InpNextBttn.Enabled := False;
            InpBackBttn.Enabled := False;
          end;

        if cur_input = tot_inputs then
          begin
            InpNextBttn.Enabled := False;
            if Tot_Inputs > 1 then
              InpBackBttn.Enabled := True
            else
               InpBackBttn.Enabled := False;
          end;

       if (cur_input < Tot_Inputs) and (cur_input > 1) then
         begin
           InpNextBttn.Enabled := True;
           InpBackBttn.Enabled := true;
         end;

       if (cur_input = 1) and (tot_inputs > 1) then
         begin
           InpNextBttn.Enabled := True;
           InpBackBttn.Enabled := False;
         end;
      end;
end;

procedure TForm3.InpInsBttnClick(Sender: TObject);
var
   i : integer;
   txt : String[4];
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if Tot_Inputs < Max_Inputs  then
          Tot_Inputs := Tot_inputs + 1;

        Str(Tot_Inputs,txt);
        EditTotInputs.Text := txt;

        if cur_input = 1 then
          begin
            InpNextBttn.Enabled := True;
            InpBackBttn.Enabled := False;
          end;

        if cur_input > 1 then
          InpBackBttn.Enabled := True;

        if cur_input = tot_inputs then
          begin
             InpNextBttn.Enabled := False;
             InpBackBttn.Enabled := True;
          end;

        if (cur_input > 1) and (cur_input < tot_inputs) then
          begin
             InpNextBttn.Enabled := True;
             InpBackBttn.Enabled := True;
          end;

        for i := Tot_Inputs downto cur_input + 1 do
          begin
            RDependent[i] := RDependent[i-1];
            const_Inp_Act[i] := const_Inp_Act[i-1];
            const_Inp_Act_Str[i] := const_Inp_Act_Str[i-1];
            min_rand_Inp_Act[i] := min_rand_Inp_Act[i-1];
            min_rand_Inp_Act_Str[i] := min_rand_Inp_Act_Str[i-1];
            max_rand_Inp_Act[i] := max_rand_Inp_Act[i-1];
            max_rand_Inp_Act_Str[i] := max_rand_Inp_Act_Str[i-1];

            RDependent [i-1] := 0;
            const_Inp_Act[i-1] := 1;
            const_Inp_Act_Str[i-1] := '1';
            min_rand_Inp_Act[i-1] := 0;
            min_rand_Inp_Act_Str[i-1] := '0';
            max_rand_Inp_Act[i-1] := 1;
            max_rand_Inp_Act_Str[i-1] := '1';
          end;
      end;

  BuildHint(sender);
end;


procedure TForm3.TargetNextBttnClick(Sender: TObject);
var
   txt : String;
begin
  EditNPE.Color := clWhite;
  EditMinOpAct.Color := clWhite;
  EditMaxOpAct.Color := clWhite;

  EditTargetsChange(sender);
  EditNPEChange(sender);
  EditMinOpActChange(sender);
  EditMaxOpActChange(sender);

  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        Cur_Op_Target := Cur_Op_Target + 1;

        Str(Cur_Op_Target,txt);
        statictext7.caption := txt;

        if Op_Target[cur_op_target].op_npe > 0 then
          str(Op_Target[cur_op_target].op_npe,txt)
        else
          txt := '1';

        EditNPE.Text := txt;

        EditMinOpAct.Text := Op_Target[cur_op_target].min_Op_Act_str;
        EditMaxOpAct.Text := Op_Target[cur_op_target].max_Op_Act_str;

        if Tot_Op_Targets = 1 then
          begin
            TargetNextBttn.Enabled := False;
            TargetBackBttn.Enabled := False;
          end else
            begin
              if Cur_Op_Target >= Tot_Op_Targets then
                begin
                  TargetNextBttn.Enabled := False;
                  TargetBackBttn.Enabled := True;
                end;

              if (cur_op_target < tot_op_targets) and
                 (cur_op_target > 1) then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := true;
                end;

              if cur_op_target = 1 then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := False;
                end;
            end;
      end;
end;

procedure TForm3.TargetBackBttnClick(Sender: TObject);
var
   txt : String;
begin
  EditTargetsChange(sender);
  EditNPEChange(sender);
  EditMinOpActChange(sender);
  EditMaxOpActChange(sender);

  EditNPE.Color := clWhite;
  EditMinOpAct.Color := clWhite;
  EditMaxOpAct.Color := clWhite;

  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        Cur_Op_Target := Cur_Op_Target - 1;
        Str(Cur_Op_Target,txt);
        statictext7.caption := txt;

        if Op_Target[cur_op_target].op_npe > 0 then
          str(Op_Target[cur_op_target].op_npe,txt)
        else
          txt := '1';

        EditNPE.Text := txt;

        EditMinOpAct.Text := Op_Target[cur_op_target].min_Op_Act_str;
        EditMaxOpAct.Text := Op_Target[cur_op_target].max_Op_Act_str;

        if Tot_Op_Targets = 1 then
          begin
            TargetNextBttn.Enabled := False;
            TargetBackBttn.Enabled := False;
          end else
            begin
              if Cur_Op_Target >= Tot_Op_Targets then
                begin
                  TargetNextBttn.Enabled := False;
                  TargetBackBttn.Enabled := True;
                end;

              if (cur_op_target < tot_op_targets) and
                 (cur_op_target > 1) then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := true;
                end;

              if cur_op_target = 1 then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := False;
                end;
            end;
      end;
end;

procedure TForm3.DelTargetBttnClick(Sender: TObject);
var
   i : integer;
   txt : String[2];
begin
 if MessageDlg('Delete current target NPE?',
                mtConfirmation,[mbYes, mbNo],0) = mrYes then
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if cur_op_target = tot_op_targets then
          begin
            str(Op_Target[cur_op_target-1].op_npe,txt);
            EditNPE.Text := txt;

            EditMinOpAct.Text := Op_Target[cur_op_target-1].
                                 min_op_Act_Str;

            EditMaxOpAct.Text := Op_Target[cur_op_target-1].
                                 max_op_Act_Str;

            Op_Target[cur_op_target].
                      op_npe := Op_Target[cur_op_target-1].op_npe;

            Op_Target[cur_op_target].
                      min_op_act := Op_Target[cur_op_target-1].min_op_act;

            Op_Target[cur_op_target].
                      max_op_act := Op_Target[cur_op_target-1].max_op_act;
          end else
            begin
              str(Op_Target[cur_op_target+1].op_npe,txt);
              EditNPE.Text := txt;

              EditMinOpAct.Text := Op_Target[cur_op_target+1].
                                   min_op_Act_Str;

              EditMaxOpAct.Text := Op_Target[cur_op_target+1].
                                   max_op_Act_Str;

              for i := cur_op_target to Tot_Op_Targets - 1 do
                begin
                  Op_Target[i].Op_NPE := Op_Target[i+1].Op_NPE;
                  Op_Target[i].Min_Op_Act := Op_Target[i+1].Min_Op_Act;
                  Op_Target[i].Max_Op_Act := Op_Target[i+1].Max_Op_Act;
                end;
            end;

        if tot_op_targets > 1 then
          tot_op_targets := tot_op_targets - 1;

        Str(tot_op_targets,txt);
        EditTargets.Text := txt;

        if tot_op_targets = 1 then
          begin
            cur_op_target := 1;
            StaticText7.Caption := '1';
            TargetNextBttn.Enabled := False;
            TargetBackBttn.Enabled := False;
          end else
            begin
              if cur_op_target = 1 then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := False;
                end;

              if cur_op_target > 1 then
                TargetBackBttn.Enabled := True;

              if cur_op_target = tot_op_targets then
                begin
                  TargetNextBttn.Enabled := False;
                  TargetBackBttn.Enabled := True;
                end;

              if cur_op_target > tot_op_targets then
                begin
                  cur_op_target := tot_op_targets;
                  str(cur_op_target,txt);
                  StaticText7.Caption := txt;
                  TargetNextBttn.Enabled := False;
                end;

              if (cur_op_target > 1) and
                 (cur_op_target < tot_op_targets) then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := True;
                end;
            end;
      end;

  BuildHint(sender);
end;

procedure TForm3.TrainBttnClick(Sender: TObject);
begin
  Trial_Type[cur_trial_type].Mode := 0;
  BuildHint(sender);
end;

procedure TForm3.ProbeBttnClick(Sender: TObject);
begin
  Trial_Type[cur_trial_type].Mode := 1;
  BuildHint(sender);
end;

{the following two procedures were added on 10/06/01}
procedure TForm3.PhasicCueBttnClick(Sender: TObject);
begin
  Trial_Type[cur_trial_type].Cue := 0 {phasic cue};
  BuildHint(sender);
end;

procedure TForm3.TonicCueBttnClick(Sender: TObject);
begin
  Trial_Type[cur_trial_type].Cue := 1 {tonic cue};
  BuildHint(sender);
end;

procedure TForm3.Pavlovian1BttnClick(Sender: TObject);
var
  cur_cont : 0..2;
begin
     cur_cont := Trial_Type[cur_trial_type].
                 ts[Trial_Type[cur_trial_type].cur_ts].Contingency;

     Trial_Type[cur_trial_type].
     ts[Trial_Type[cur_trial_type].cur_ts].Contingency := 0;

     OperantBttn.Checked := False;
     OmissionBttn.Checked := False;

     if cur_cont <> Trial_Type[cur_trial_type].
                    ts[Trial_Type[cur_trial_type].cur_ts].Contingency then
        JustSaved := false;

     if (RDependentCheckBox.Checked) then
       EnableGroupBox3(sender)
     else
        DisableGroupBox3(sender);

     BuildHint(sender);
end;

procedure TForm3.Pavlovian2BttnClick(Sender: TObject);
var
  cur_cont : 0..2;
begin
     cur_cont := Trial_Type[cur_trial_type].
                 ts[Trial_Type[cur_trial_type].cur_ts].Contingency;

     Trial_Type[cur_trial_type].
     ts[Trial_Type[cur_trial_type].cur_ts].Contingency := 0;

     OperantBttn.Checked := False;
     OmissionBttn.Checked := False;

     if cur_cont <> Trial_Type[cur_trial_type].
                    ts[Trial_Type[cur_trial_type].cur_ts].Contingency then
        JustSaved := false;

     if (RDependentCheckBox.Checked) then
       EnableGroupBox3(sender)
     else
        DisableGroupBox3(sender);

     BuildHint(sender);
end;

procedure TForm3.Operant1BttnClick(Sender: TObject);
var
  cur_cont : 0..2;
begin
  cur_cont := Trial_Type[cur_trial_type].
              ts[Trial_Type[cur_trial_type].cur_ts].
              Contingency;

  Pavlovian1Bttn.Checked := False;
  OmissionBttn.Checked := False;

  Trial_Type[cur_trial_type].
  ts[Trial_Type[cur_trial_type].cur_ts].Contingency := 1;

  if cur_cont <> Trial_Type[cur_trial_type].
                 ts[Trial_Type[cur_trial_type].cur_ts].Contingency then
    JustSaved := false;

  StaticText6.Enabled := True;
  StaticText7.Enabled := True;
  StaticText21.Enabled := True;
  {StaticText22.Enabled:=true;}

  TarOutLabel.Enabled := True;
  EditTargets.Enabled := True;

  {EditTargets.SetFocus;}

  EditMinOpAct.Enabled := True;
  EditMaxOpAct.Enabled := True;
  EditTargetGoto.Enabled := true;
  EditNPE.Enabled := true;

  TarOutLabel.Enabled := True;

  NPELabel.Enabled := True;
  MinLabel.Enabled := True;
  MaxLabel.Enabled := True;
  GotoLabel.Enabled := True;

  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if Tot_Op_Targets = 1 then
          begin
             TargetNextBttn.Enabled := False;
             TargetBackBttn.Enabled := False;
          end else
            begin
              if Cur_Op_Target = Tot_Op_Targets then
                begin
                  TargetNextBttn.Enabled := False;

                  if Tot_Op_Targets > 1 then
                     TargetBackBttn.Enabled := True
                  else
                     TargetBackBttn.Enabled := True;
                end;

              if (cur_op_target < tot_op_targets) and
                 (cur_op_target > 1) then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := true;
                end;

              if (Cur_op_target = 1) and (Tot_op_targets > 1) then
                begin
                  TargetNextBttn.Enabled := true;
                  TargetBackBttn.Enabled := false;
                end;

              if (Cur_OP_Target < Tot_Op_Targets) and
                 (Cur_Op_Target > 1) then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := true;
                end;
            end;
      end;

  BuildHint(sender);
end;

procedure TForm3.Omission1BttnClick(Sender: TObject);
var
  cur_cont : 0..2;
begin
  cur_cont := Trial_Type[cur_trial_type].
              ts[Trial_Type[cur_trial_type].cur_ts].
              Contingency;

  Trial_Type[cur_trial_type].
  ts[Trial_Type[cur_trial_type].cur_ts].Contingency := 2;

  Pavlovian1Bttn.Checked := False;
  OperantBttn.Checked := False;

  if cur_cont <> Trial_Type[cur_trial_type].
                 ts[Trial_Type[cur_trial_type].cur_ts].Contingency then
    JustSaved := false;

  StaticText6.Enabled := True;
  StaticText7.Enabled := True;
  StaticText21.Enabled := True;

  TarOutLabel.Enabled := True;
  EditTargets.Enabled := True;

  {EditTargets.SetFocus;}

  EditMinOpAct.Enabled := True;
  EditMaxOpAct.Enabled := True;
  EditTargetGoto.Enabled := true;
  EditNPE.Enabled := true;

  TarOutLabel.Enabled := True;

  NPELabel.Enabled := True;
  MinLabel.Enabled := True;
  MaxLabel.Enabled := True;
  GotoLabel.Enabled := True;

  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if Tot_Op_Targets = 1 then
          begin
             TargetNextBttn.Enabled := False;
             TargetBackBttn.Enabled := False;
          end else
            begin
              if Cur_Op_Target = Tot_Op_Targets then
                begin
                  TargetNextBttn.Enabled := False;

                  if Tot_Op_Targets > 1 then
                     TargetBackBttn.Enabled := True
                  else
                     TargetBackBttn.Enabled := True;
                end;

              if (cur_op_target < tot_op_targets) and
                 (cur_op_target > 1) then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := true;
                end;

              if (Cur_op_target = 1) and (Tot_op_targets > 1) then
                begin
                  TargetNextBttn.Enabled := true;
                  TargetBackBttn.Enabled := false;
                end;

              if (Cur_OP_Target < Tot_Op_Targets) and
                 (Cur_Op_Target > 1) then
                begin
                  TargetNextBttn.Enabled := True;
                  TargetBackBttn.Enabled := true;
                end;
            end;
      end;

  BuildHint(sender);
end;


procedure TForm3.EditTrialTypeGoToChange(Sender: TObject);
var
   value, code, pi : integer;
   txt : string[3];
begin
  EditTotTrialTypesChange(sender);
  EditTotTrialsChange(sender);
  EditTrialTypeLabelChange(sender);
  EditConstInpActChange(sender);
  EditDurationChange(sender);
  EditConstUSActChange(Sender);

  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      begin
        if TrainBttn.Checked then
          Mode := 0
        else
          Mode := 1;

        Cue := 0;

        if Pavlovian1Bttn.Checked then
          Contingency := 0;

        if OperantBttn.Checked then
          Contingency := 1;

        if OmissionBttn.Checked then
          Contingency := 2;

        if (OperantBttn.Checked) or (OmissionBttn.Checked) or
           (RDependentCheckBox.Checked) then
          begin
            EditTargetsChange(sender);
            EditNPEChange(sender);
            EditMinOpActChange(sender);
            EditMaxOpActChange(sender);
          end;

        val(EditTrialTypeGoto.Text,value,code);

        if code <> 0 then
           begin
             str(cur_trial_type,txt);
             EditTrialTypeGoto.Text := txt;
           end else
             begin
              if value <= 1 then
                begin
                  Cur_Trial_Type := 1;
                  StaticText3.Caption := '1';

                  EditTrialTypeGoto.Text := '1';

                  if tot_trial_types > 1 then
                    TrialTypeNextBttn.Enabled := True;

                  TrialTypeBackBttn.Enabled := False;
                end;

              if value >= tot_trial_types then
                begin
                  Cur_Trial_Type := tot_trial_types;
                  str(tot_trial_types,txt);
                  StaticText3.Caption := txt;
                  EditTrialTypeGoto.Text := txt;

                  if tot_trial_types > 1 then
                    TrialTypebackbttn.enabled := True;

                  TrialTypenextbttn.enabled := False;
                end;

              if (value >= 1) and (value <= tot_trial_types) then
                Cur_Trial_Type := value;

              if (value > 1) and
                 (value < tot_trial_types) and
                 (tot_trial_types > 1) then
                begin
                  TrialTypenextbttn.enabled := true;
                  TrialTypebackbttn.enabled := true;
                end;
             end;

        ColorDialog1.Color := Trial_Type[cur_trial_type].Color;

        WhiteAll(sender);

        Str(Cur_Trial_Type,txt);
        statictext3.caption := txt;

        Str(cur_ts,txt);
        statictext11.caption := txt;

        str(duration,txt);
        EditDuration.Text := txt;

        EditTrialTypeLabel.Text := Lab;

        EditConstUSAct.Text := const_US_Act_Str;

        Case Mode of
          0: TrainBttn.Checked := True;
          1: ProbeBttn.Checked := True;
        end{case};

        Case Contingency of
          0: begin
               Pavlovian1Bttn.Checked := True;

               if (not RDependentCheckBox.Checked) then
                  DisableGroupBox3(sender)
	       else
                  EnableGroupBox3(sender);
             end;

        1,2: begin
               str(Tot_Op_Targets,txt);

               EditTargets.Text := txt;

               str(Cur_Op_Target,txt);

               StaticText7.Caption := txt;

               if Contingency = 1 then
                 OperantBttn.Checked := True
               else
                  OmissionBttn.Checked := True;

               EnableGroupBox3(sender);

               if Op_Target[cur_op_target].op_npe > 0 then
                 str(Op_Target[cur_op_target].op_npe,txt)
               else
                 txt := '1';

               EditNPE.Text := txt;

               EditMinOpAct.Text := Op_Target[cur_op_target].
                                    min_Op_Act_str;

               EditMaxOpAct.Text := Op_Target[cur_op_target].
                                    max_Op_Act_str;

               if Tot_Op_Targets = 1 then
                 begin
                   TargetNextBttn.Enabled := False;
                   TargetBackBttn.Enabled := False;
                 end else
                   begin
                     if Cur_Op_Target >= Tot_Op_Targets then
                       begin
                         TargetNextBttn.Enabled := False;
                         TargetBackBttn.Enabled := True;
                       end;

                     if (cur_op_target<tot_op_targets) and
                        (cur_op_target > 1) then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := true;
                       end;

                     if cur_op_target = 1 then
                       begin
                         TargetNextBttn.Enabled := True;
                         TargetBackBttn.Enabled := False;
                       end;
                   end;
             end;
        end{case};

        if (Cur_Trial_Type >= Tot_Trial_Types) and
           (tot_trial_types > 1) then
          begin
            TrialTypeNextBttn.Enabled := False;
            TrialTypeBackBttn.Enabled := True;
          end;

        if (cur_trial_type < tot_trial_types) and
           (cur_trial_type > 1) then
          begin
            TrialTypeNextBttn.Enabled := True;
            TrialTypeBackBttn.Enabled := true;
          end;

        if Duration = 1 then
          begin
            tsNextBttn.Enabled := False;
            tsBackBttn.Enabled := False;
          end else
            begin
              if Cur_ts >= Duration then
                begin
                  tsNextBttn.Enabled := False;
                  tsBackBttn.Enabled := True;
                end;

              if (cur_ts < Duration) and (cur_ts > 1) then
                begin
                  tsNextBttn.Enabled := True;
                  tsBackBttn.Enabled := true;
                end;

              if cur_ts = 1 then
                begin
                  tsNextBttn.Enabled := True;
                  tsBackBttn.Enabled := False;
                end;
            end;
      end;
end;

procedure TForm3.EdittsGotoChange (Sender: TObject);
Var
   value, code, pi : Integer;
   txt : String[3];
begin
     EditConstInpAct.Color := clWhite;
     EditConstUSAct.Color := clWhite;

     EditConstInpActChange(sender);
     EditConstUSActChange(Sender);

     val(EdittsGoto.Text,value,code);

     with Trial_Type[Cur_Trial_Type] do
          with ts[Cur_ts] do
               if code <> 0 then
                  begin
                       str(cur_ts,txt);
                       EdittsGoto.Text := txt;
                  end else
                      begin
                           if value <= 1 then
                              begin
                                   Cur_ts := 1;
                                   StaticText11.Caption := '1';

                                   EdittsGoto.Text := '1';

                                   if Duration > 1 then
                                      tsNextBttn.Enabled := True;

                                   tsBackBttn.Enabled := False;
                              end;

                           if value >= duration then
                              begin
                                   Cur_ts := duration;
                                   str(duration,txt);
                                   StaticText11.Caption := txt;
                                   EdittsGoto.Text := txt;

                                   if duration > 1 then
                                      tsbackbttn.enabled := True;

                                   tsnextbttn.enabled := False;
                              end;

                           if (value >= 1) and
                              (value <= duration) then
                              Cur_ts := value;

                           if (value > 1) and
                              (value < duration) and
                              (duration > 1) then
                              begin
                                   tsnextbttn.enabled := true;
                                   tsbackbttn.enabled := true;
                              end;
                      end;

     Str(Trial_Type[Cur_Trial_Type].cur_ts,txt);
     statictext11.caption := txt;

     with Trial_Type[Cur_Trial_Type] do
          with ts[cur_ts] do
                  EditConstUSAct.Text := ts[cur_ts].const_US_Act_Str;

     EditConstUSAct.Text := Trial_Type[cur_trial_type].
                            ts[Trial_Type[cur_trial_type].cur_ts].
                            const_US_Act_Str;

     if Trial_Type[cur_trial_type].cur_ts >=
        Trial_Type[cur_trial_type].duration then
        begin
             tsNextBttn.Enabled := False;
             tsBackBttn.Enabled := True;
        end;

     if (Trial_Type[cur_trial_type].cur_ts <
         Trial_Type[cur_trial_type].duration) and
        (Trial_Type[cur_trial_type].cur_ts > 1) then
        begin
             tsNextBttn.Enabled := True;
             tsBackBttn.Enabled := true;
        end;

     if Trial_Type[cur_trial_type].Duration = 1 then
        begin
             tsNextBttn.Enabled := False;
             tsBackBttn.Enabled := False;
        end else
            begin
                 if Trial_Type[cur_trial_type].Cur_ts >=
                    Trial_Type[cur_trial_type].Duration then
                    begin
                         tsNextBttn.Enabled := False;
                         tsBackBttn.Enabled := True;
                    end;

                 if (Trial_Type[cur_trial_type].cur_ts <
                     Trial_Type[cur_trial_type].Duration) and
                    (Trial_Type[cur_trial_type].cur_ts > 1) then
                    begin
                         tsNextBttn.Enabled := True;
                         tsBackBttn.Enabled := true;
                    end;

                 if Trial_Type[cur_trial_type].cur_ts = 1 then
                    begin
                         tsNextBttn.Enabled := True;
                         tsBackBttn.Enabled := False;
                    end;
            end;
end;

procedure TForm3.EditInputGotoChange (Sender: TObject);
Var
  value, code, pi : Integer;
  txt : String[3];
begin
  EditConstInpAct.Color := clWhite;
  EditMinRandInpAct.Color := clWhite;
  EditMaxRandInpAct.Color := clWhite;

  EditConstInpActChange(sender);
  EditMinRandInpActChange(sender);
  EditMaxRandInpActChange(sender);

  val(EditInputGoto.Text,value,code);

  with Trial_Type[Cur_Trial_Type] do
    with ts[cur_ts] do
      begin
        if code <> 0 then
          begin
            str(cur_input,txt);
            EditInputGoto.Text := txt;
            EditInputGoto.SetFocus;
          end else
            begin
              if value <= 1 then
                begin
                  cur_input := 1;
                  StaticText19.Caption := '1';

                  EditInputGoto.Text := '1';

                  if Tot_Inputs > 1 then
                    InpNextBttn.Enabled := True;

                  InpBackBttn.Enabled := False;
                end;

              if value >= tot_inputs then
                begin
                  Cur_ts := tot_inputs;
                  str(tot_inputs,txt);
                  StaticText19.Caption := txt;
                  EditInputGoto.Text := txt;

                  if tot_inputs > 1 then
                    InpBackBttn.enabled := True;

                  InpNextBttn.enabled := False;
                end;

              if (value >= 1) and (value <= tot_inputs) then
                Cur_input := value;

              if (value > 1) and (value < tot_inputs) and
                 (tot_inputs > 1) then
                begin
                  InpNextBttn.enabled := true;
                  InpBackBttn.enabled := true;
                end;
            end;

        Str(cur_input,txt);
        statictext19.caption := txt;

        EditConstInpAct.Text := const_inp_Act_Str[cur_input];
        EditMinRandInpAct.Text := min_rand_inp_Act_Str[cur_input];
        EditMaxRandInpAct.Text := max_rand_inp_Act_Str[cur_input];

        if cur_input >= tot_inputs then
          begin
            InpNextBttn.Enabled := False;
            InpBackBttn.Enabled := True;
          end;

        if (cur_input < tot_inputs) and (cur_input > 1) then
          begin
            InpNextBttn.Enabled := True;
            InpBackBttn.Enabled := true;
          end;

        if Tot_Inputs = 1 then
          begin
            InpNextBttn.Enabled := False;
            InpBackBttn.Enabled := False;
          end else
            begin
              if Cur_Input >= Tot_Inputs then
                begin
                  InpNextBttn.Enabled := False;
                  InpBackBttn.Enabled := True;
                end;

              if (cur_input < Tot_Inputs) and (cur_input > 1) then
                begin
                  InpNextBttn.Enabled := True;
                  InpBackBttn.Enabled := true;
                end;

              if cur_input = 1 then
                begin
                  InpNextBttn.Enabled := True;
                  InpBackBttn.Enabled := False;
                end;
            end;
        end;
end;

procedure TForm3.EditTargetGotoChange (Sender: TObject);
Var
   value, code, pi : Integer;
   txt : String[3];
begin
     EditTargetsChange(sender);
     EditNPEChange(sender);
     EditMinOpActChange(sender);
     EditMaxOpActChange(sender);

     EditNPE.Color := clWhite;
     EditMinOpAct.Color := clWhite;
     EditMaxOpAct.Color := clWhite;

     val(EditTargetGoto.Text,value,code);

     with Trial_Type[Cur_Trial_Type] do
       with ts[cur_ts] do
         begin
           if code <> 0 then
             begin
                  str(cur_op_target,txt);
                  EditTargetGoto.Text := txt;
             end else
                 begin
                      if value <= 1 then
                         begin
                              Cur_op_Target := 1;
                              StaticText7.Caption := '1';

                              EditTargetGoto.Text := '1';

                              if Tot_Op_Targets > 1 then
                                 TargetNextBttn.Enabled := True;

                              TargetBackBttn.Enabled := False;
                         end;

                      if value >= tot_op_targets then
                         begin
                              Cur_op_Target := tot_op_targets;
                              str(tot_op_targets,txt);
                              StaticText7.Caption := txt;
                              EditTargetGoto.Text := txt;

                              if tot_op_targets > 1 then
                                 targetbackbttn.enabled := True;

                              targetnextbttn.enabled := False;
                         end;

                      if (value >= 1) and
                         (value <= tot_op_targets) then
                         Cur_OP_Target := value;

                      if (value > 1) and
                         (value < tot_op_targets) and
                         (tot_op_targets > 1) then
                         begin
                              targetnextbttn.enabled := true;
                              targetbackbttn.enabled := true;
                         end;
                 end;

           Str(Cur_Op_Target,txt);
           statictext7.caption := txt;

           if Op_Target[cur_op_target].op_npe > 0 then
             str(Op_Target[cur_op_target].op_npe,txt)
           else
             txt := '1';

           EditNPE.Text := txt;

           EditMinOpAct.Text := Op_Target[cur_op_target].min_Op_Act_str;
           EditMaxOpAct.Text := Op_Target[cur_op_target].max_Op_Act_str;

           if Tot_Op_Targets = 1 then
             begin
                  TargetNextBttn.Enabled := False;
                  TargetBackBttn.Enabled := False;
             end else
                 begin
                      if Cur_Op_Target >= Tot_Op_Targets then
                         begin
                              TargetNextBttn.Enabled := False;
                              TargetBackBttn.Enabled := True;
                         end;

                         if (cur_op_target < tot_op_targets) and
                            (cur_op_target > 1) then
                            begin
                                 TargetNextBttn.Enabled := True;
                                 TargetBackBttn.Enabled := true;
                            end;

                         if cur_op_target = 1 then
                            begin
                                 TargetNextBttn.Enabled := True;
                                 TargetBackBttn.Enabled := False;
                            end;
                 end;
         end;
end;

procedure TForm3.SaveSchClick(Sender: TObject);
begin
     if SaveDialog1.Execute then
        SaveSchFile(Sender);
end;

procedure TForm3.SaveSchFile(Sender: TObject);
var
   ctt, ot, i, d : integer;
begin
   EditTotTrialTypesChange(sender);
   EditTotInputsChange(sender);
   EditTotTrialsChange(sender);
   If ResetActsCheckBox.Checked then RstActs := 1 else RstActs := 0;
   EditDurationChange(sender);
   EditTrialTypeLabelChange(sender);

   EditConstInpActChange(sender);
   EditMinRandInpActChange(sender);
   EditMaxRandInpActChange(sender);
   EditConstUSActChange(Sender);
   EditMinRandUSActChange(Sender);
   EditMaxRandUSActChange(Sender);
   EditConstUS2ActChange(Sender);
   EditMinRandUS2ActChange(Sender);
   EditMaxRandUS2ActChange(Sender);

  If (RDependentCheckBox.Checked) or (OperantBttn.Checked) or
     (OmissionBttn.Checked) then
    begin
      EditTargetsChange(sender);
      EditNPEChange(Sender);
      EditMinOpActChange(Sender);
      EditMaxOpActChange(Sender);
    end else
      begin
        EditTargets.Text := '1';
        StaticText7.Caption := '1';
        EditNPE.Text := '1';
        EditMinOpAct.Text := '0';
        EditMaxOpAct.Text := '1';
      end;

   with trial_type[cur_trial_type] do
     with ts[cur_ts] do
       begin
         if TrainBttn.Checked then
           Mode := 0
         else
           Mode := 1;

         Cue := 0;

         if Pavlovian1Bttn.Checked then
           begin
              Contingency := 0;
              Tot_Op_Targets := 1;
           end;

         if (RDependentCheckBox.Checked) or (OperantBttn.Checked) then
             begin
               if OperantBttn.Checked then
                 Contingency := 1;

               if OmissionBttn.Checked then
                 Contingency := 2;
             end;

         if RDependentCheckBox.Checked then
           RDependent[cur_input] := 1
         else
            RDependent[cur_input] := 0;

         if ConstInpActBttn.Checked then
           InpActMode[cur_input] := 0
         else
           InpActMode[cur_input] := 1;

         if ConstUSActBttn.Checked then
           USActMode := 0;     (*constant US1 activation*)

         if RandUSActBttn.Checked then
           USActMode := 1;    (*random US1 activation*)

         if ConstUS2ActBttn.Checked then
           USActMode := 2;     (*constant US2 activation*)

         if RandUS2ActBttn.Checked then
           USActMode := 3;    (*random US2 activation*)
       end;

  Sch_FileName := SaveDialog1.FileName;
  AssignFile(Sf,Sch_FileName);

 {$I-}
  ReWrite(Sf);
 {$I+}

  If IOResult <> 0 then
    begin
      MessageDlg('Invalid writing operation.' +
                 'Your disk is either full or corrupted.',
                  mtError,[mbCancel],0);

      CloseFile(Sf);
      Exit;
    end else
      begin
        Writeln(Sf, Tot_Trial_Types);                               {1}
        Writeln(Sf, Tot_Inputs);                                    {2}
        Writeln(Sf, RstActs);                                       {3}

        For ctt := 1 to Tot_Trial_Types do
          with Trial_Type[ctt] do
            begin
              Number := ctt;
              Writeln(Sf, Number);                                  {4}
              Writeln(Sf, Tot_Trials);                              {5}
              Writeln(Sf, Color);                                   {6}
              Writeln(Sf, Lab);                                     {7}
              Writeln(Sf, Duration);                                {8}
              Writeln(Sf, Mode);                                    {9}
              Writeln(Sf, Cue);                                     {10}

              for d := 1 to Duration do
                with ts[d] do
                  begin
                    for i := 1 to Tot_Inputs do
                      begin
                        writeln(Sf, RDependent[i]);                 {11}

                        writeln(Sf, InpActMode[i]);                 {12}
                        case InpActMode[i] of
                          0: Writeln(Sf, const_Inp_Act_Str[i]);     {13}
                          1: begin
                               Writeln(Sf, min_rand_Inp_Act_Str[i]);
                               Writeln(Sf, max_rand_Inp_Act_Str[i]);
                             end;
                        end{case};
                      end;

                    writeln(Sf, USActMode);                         {1}

                    case USActMode of
                      0: Writeln(Sf, const_US_Act_Str);             {1}
                      1: begin
                           Writeln(Sf, min_rand_US_Act_Str);
                           Writeln(Sf, max_rand_US_Act_Str);
                         end;
                      2: Writeln(Sf, const_US2_Act_Str);             {1}
                      3: begin
                           Writeln(Sf, min_rand_US2_Act_Str);
                           Writeln(Sf, max_rand_US2_Act_Str);
                         end;
                    end{case};

                    Writeln(Sf, Contingency);                       {1}
                    Writeln(Sf, Tot_Op_Targets);                    {1}

                    for ot := 1 to Tot_Op_Targets do
                      with Op_Target[ot] do
                        begin
                          Writeln(Sf, op_npe);
                          Writeln(Sf, Min_Op_Act_Str);
                          Writeln(Sf, Max_Op_Act_Str);
                        end;
                  end;
            end;

        Form3.Caption := 'Contingency arrangement - ' +
                         SaveDialog1.FileName;

        CloseFile(Sf);
        JustSaved := True;
      end;
end;

procedure TForm3.OpenSchClick(Sender: TObject);
begin
   if JustSaved then
     begin
       if OpenDialog1.Execute then
          OpenSchFile(Sender)
     end else
       case MessageDlg('Save current arrangement?',mtConfirmation,
                     [mbYes, mbNo,mbCancel],0) of
         mrYes: begin
                  SaveSchClick(sender);

                  if OpenDialog1.Execute then
                    OpenSchFile(Sender)
                end;

         mrNo: if OpenDialog1.Execute then
                 OpenSchFile(Sender)
       end{case};
end;

procedure TForm3.OpenSchFile(Sender: TObject);
var
   ctt, ot, d, i, code : integer;
   txt1, txt2, str1 : String[255];
   Action: TCloseAction;
begin
  TotOverallTrials := 0;
  Sch_FileName := OpenDialog1.FileName;
  AssignFile(Sf,Sch_FileName);

 {$I-}
  ReSet(Sf);
 {$I+}

  if IOResult = 0 then
   begin
     Form3.Caption := 'Contingency arrangement - ' + OpenDialog1.FileName;

    {$I-}
     Readln(Sf, Tot_Trial_Types);
    {$I+}

     if (IOResult <> 0) or (tot_trial_types < 1) then
       begin
         MessageDlg('Invalid number of trial types.',mtError,[mbCancel],0);
         CloseFile(Sf);
         Exit;
       end;

     if (tot_trial_types > max_trial_types) then
       begin
         MessageDlg('Too many trial types.',mtError,[mbCancel],0);
         CloseFile(Sf);
         Exit;
       end;

    {$I-}
     Readln(Sf, Tot_Inputs);
    {$I+}

     if (IOResult <> 0) or (tot_inputs < 1) then
       begin
         MessageDlg('Invalid number of input units.',mtError,[mbCancel],0);
         CloseFile(Sf);
         Exit;
       end;

     if (tot_inputs > max_inputs) then
       begin
         MessageDlg('Too many input units.',mtError,[mbCancel],0);
         CloseFile(Sf);
         Exit;
       end;

    {$I-}
     Readln(Sf, RstActs); {05/14/2003 : Reset acts. check box added }
    {$I+}

     if (IOResult <> 0) or (RstActs < 0) or (RstActs > 1) then
       begin
         MessageDlg('Invalid reset-activations option.',mtError,[mbCancel],0);
         CloseFile(Sf);
         Exit;
       end;

     For ctt := 1 to Tot_Trial_Types do
       with Trial_Type[ctt] do
         begin
           str(ctt,txt1);

          {$I-}
           Readln(Sf, Number);
          {$I+}

           if (IOResult <> 0) or (number < 1) then
             begin
               str1 := 'Invalid input-unit number for trial type ' + txt1 + '.';
               MessageDlg(str1,mtError,[mbCancel],0);
               CloseFile(Sf);
               Exit;
             end;

          {$I-}
           Readln(Sf, Tot_Trials);
          {$I+}

           TotOverallTrials := TotOverallTrials + Tot_Trials;

           if (IOResult <> 0) or (Tot_Trials < 1) then
             begin
               str1 := 'Invalid number of trials for trial type ' +
                        txt1 + '.';

               MessageDlg(str1,mtError,[mbCancel],0);
               CloseFile(Sf);
               Exit;
             end;

           if Tot_Trials > Max_Tot_Trials then
             begin
               str1 := 'Too many instances for trial type ' + txt1 + '.';
               MessageDlg(str1,mtError,[mbCancel],0);
               CloseFile(Sf);
               Exit;
             end;

          {$I-}
           Readln(Sf, Color);
          {$I+}

           {if (IOResult <> 0) or (color < 1) then
             begin
               str1 := 'Invalid color number for trial type ' + txt1 + '.';
               MessageDlg(str1,mtError,[mbCancel],0);
               CloseFile(Sf);
               Exit;
             end;     }

           Readln(Sf, Lab);

          {$I-}
           Readln(Sf, Duration);
          {$I+}

           if (IOResult <> 0) or (Duration < 1) then
             begin
               str1 := 'Invalid duration for trial type ' + txt1 + '.';
               MessageDlg(str1,mtError,[mbCancel],0);
               CloseFile(Sf);
               Exit;
             end;

           if Duration > Max_Duration then
             begin
               str1 := 'Too many time-steps for trial type ' + txt1 + '.';
               MessageDlg(str1,mtError,[mbCancel],0);
               CloseFile(Sf);
               Exit;
             end;

          {$I-}
           Readln(Sf, Mode);
          {$I+}

           if (IOResult <> 0) or (mode < 0) or (mode > 2) then
             begin
               str1 := 'Invalid contingency mode for trial type ' + txt1 + '.';
               MessageDlg(str1,mtError,[mbCancel],0);
               CloseFile(Sf);
               Exit;
             end;

          {$I-}
           Readln(Sf, Cue);
          {$I+}

           if (IOResult <> 0) or (cue < 0) or (cue > 1) then
             begin
               str1 := 'Invalid cue for trial type ' + txt1 + '.';
               MessageDlg(str1,mtError,[mbCancel],0);
               CloseFile(Sf);
               Exit;
             end;

           cur_ts := 1;

           for d := 1 to Duration do
             with ts[d] do
               begin
                 cur_input := 1;

                 for i := 1 to Tot_Inputs do
                   begin
                    {$I-}
                     readln(Sf,RDependent[i]);
                    {$I+}

                     if (IOResult <> 0) or
                        (RDependent[i] < 0) or
                        (RDependent[i] > 1) then
                       begin
                         str1 := 'Invalid response-dependency parameter '
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
                         str1 := 'Invalid activation mode for input unit '
                                 + txt2 + ' in trial type ' + txt1 + '.';

                         MessageDlg(str1,mtError,[mbCancel],0);
                         CloseFile(Sf);
                         Exit;
                       end;

                     case InpActMode[i] of
                       0: begin
                            Readln(Sf, const_Inp_Act_Str[i]);

                            val(const_Inp_Act_Str[i],
                                const_Inp_Act[i],code);

                            if (code <> 0) or
                               (const_Inp_Act[i] < 0) or
                               (const_Inp_Act[i] > 1) then
                                begin
                                  str1 := 'Invalid constant activation for input unit '
                                  + txt2 + ' in trial type ' + txt1 + '.';
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
                                  str1 := 'Invalid minimum random activation for input unit '
                                  + txt2 + ' in trial type ' + txt1 + '.';
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
                                  str1 := 'Invalid maximum random activation for input unit '
                                  + txt2 + ' in trial type ' + txt1 + '.';
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

                 if (IOResult <> 0) or (mode < 0) or (mode > 3) then
                   begin
                     str1 := 'Invalid US activation mode for trial type '
                             + txt1 + '.';

                     MessageDlg(str1,mtError,[mbCancel],0);
                     CloseFile(Sf);
                     Exit;
                   end;

                 case USActMode of
                   0: begin     (*constant US1 activation*)
                        Readln(Sf, const_US_Act_Str);
                        val(const_US_Act_Str,const_US_Act,code);

                        if (code <> 0) or
                           (const_US_Act < 0) or
                           (const_US_Act > 1) then
                            begin
                              str1 := 'Invalid constant US1 activation for trial type '
                                      + txt1 + '.';
                              MessageDlg(str1,mtError,[mbCancel],0);
                              CloseFile(Sf);
                              Exit;
                            end;

                        min_rand_US_Act := 0;
                        max_rand_US_Act := 1;
                        min_rand_US_Act_str := '0';
                        max_rand_US_Act_str := '1';
                        Const_US2_Act:=0;
                        Const_US2_Act_str:='0';
                        min_rand_US2_Act := 0;
                        max_rand_US2_Act := 1;
                        min_rand_US2_Act_str := '0';
                        max_rand_US2_Act_str := '1';
                      end;

                   1: begin  (*random US1 activation*)
                        Readln(Sf, min_rand_US_Act_Str);
                        Readln(Sf, max_rand_US_Act_Str);
                        val(min_rand_US_Act_Str,min_rand_US_Act,code);

                        if (code <> 0) or
                           (min_rand_US_Act < 0) or
                           (min_rand_US_Act > 1) then
                            begin
                              str1 := 'Invalid minimum random US1 activation for trial type '
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
                              str1 := 'Invalid maximum random US1 activation for trial type '
                                      + txt1 + '.';
                              MessageDlg(str1,mtError,[mbCancel],0);
                              CloseFile(Sf);
                              Exit;
                            end;

                        Const_US_Act := 0;
                        Const_US_Act_str := '1';
                        Const_US2_Act:=0;
                        Const_US2_Act_str:='0';
                        min_rand_US2_Act := 0;
                        max_rand_US2_Act := 1;
                        min_rand_US2_Act_str := '0';
                        max_rand_US2_Act_str := '1';
                      end;
                      
                   2: begin   (*constant US2 activation*)
                        Readln(Sf, const_US2_Act_Str);
                        val(const_US2_Act_Str,const_US2_Act,code);

                        if (code <> 0) or
                           (const_US2_Act < 0) or
                           (const_US2_Act > 1) then
                            begin
                              str1 := 'Invalid constant US2 activation for trial type '
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

                   3: begin (*random US2 activation*)
                        const_US2_Act := 0;
                        const_US2_Act_str := '0';
                        Readln(Sf, min_rand_US2_Act_Str);
                        Readln(Sf, max_rand_US2_Act_Str);
                        val(min_rand_US2_Act_Str,min_rand_US2_Act,code);

                        if (code <> 0) or
                           (min_rand_US2_Act < 0) or
                           (min_rand_US2_Act > 1) then
                            begin
                              str1 := 'Invalid minimum random US2 activation for trial type '
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
                              str1 := 'Invalid maximum random US2 activation for trial type '
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
                      str1 := 'Invalid contingency mode for trial type '
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
                     str1 := 'Invalid number of operant target units for trial type '
                     + txt1 + '.';

                     MessageDlg(str1,mtError,[mbCancel],0);
                     CloseFile(Sf);
                     Exit;
                   end;

                 if Tot_Op_Targets > Max_Op_Targets then
                   begin
                     str1 := 'Too many operant target units for trial type '
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
                           str1 := 'Invalid NPE number for operant target ' +
                                   txt2 + ' in trial type ' + txt1 + '.';

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
                             str1 := 'Invalid minimum activation for operant target ' +
                                      txt2 + ' in trial type ' + txt1 + '.';

                             MessageDlg(str1,mtError,[mbCancel],0);
                             CloseFile(Sf);
                             Exit;
                           end;

                       val(Max_Op_Act_Str,Max_Op_Act,code);

                       if (code <> 0) or
                          (min_Op_Act < 0) or
                          (min_Op_Act > 1) then
                           begin
                             str1 := 'Invalid maximum activation for operant target ' +
                                      txt2 + ' in trial type ' + txt1 + '.';

                             MessageDlg(str1,mtError,[mbCancel],0);
                             CloseFile(Sf);
                             Exit;
                           end;
                     end;
               end;
         end;

     Panel2.Visible := True;
     Panel3.Visible := True;

     CloseFile(Sf);
     SaveDialog1.FileName := OpenDialog1.FileName;

     Cur_trial_type := 1;

     str(Cur_trial_type,txt1);
     StaticText3.Caption := txt1;
     str(TotOverallTrials,txt1);
     StaticText5.Caption := 'Overall # of trials:  ' + txt1;

     str(tot_trial_types,txt1);
     EditTotTrialTypes.text := txt1;

     str(tot_inputs,txt1);
     EditTotInputs.text := txt1;

     If RstActs = 1 then
        ResetActsCheckBox.Checked := True
     else
         ResetActsCheckBox.Checked := False;

     If tot_inputs > 1 then
        InpNextBttn.Enabled := True
     else
        InpNextBttn.Enabled := False;

     InpBackBttn.Enabled := True;

     with Trial_Type[cur_trial_type] do
       begin
         str(tot_trials,txt1);
         EditTotTrials.text := txt1;

         str(Duration,txt1);
         EditDuration.text := txt1;

         EditTrialTypeLabel.Text := Lab;

         ColorDialog1.Color := Color;

         case Trial_Type[cur_trial_type].Mode of
           0: TrainBttn.Checked := True;
           1: ProbeBttn.Checked := True;
         end{case};

         if tot_trial_types > 1 then
           begin
             TrialTypeNextBttn.Enabled := True;
             TrialTypeDelBttn.Enabled := True;
           end else
             begin
               TrialTypeNextBttn.Enabled := False;
               TrialTypeDelBttn.Enabled := False;
             end;

         TrialTypeBackBttn.Enabled := False;
         str(cur_ts,txt1);
         StaticText11.Caption := txt1;

         if Duration > 1 then
           tsNextBttn.Enabled := True
         else
           tsNextBttn.Enabled := False;

         tsBackBttn.Enabled := False;

         with ts[cur_ts] do
           begin
             str(cur_input,txt1);
             StaticText19.Caption := txt1;

             If tot_inputs > 1 then
               InpNextBttn.Enabled := True
             else
               InpNextBttn.Enabled := False;

             InpBackBttn.Enabled := False;

             if RDependent[cur_input] = 0 then
               RDependentCheckBox.Checked := False
             else
                RDependentCheckBox.Checked := True;

             case InpActMode[cur_input] of
               0: begin
                    EditConstInpAct.Text := const_inp_Act_Str[cur_input];
                    EditMinRandInpAct.Text := '0';
                    EditMaxRandInpAct.Text := '1';
                    ConstInpActBttn.Checked := True;
                    RandInpActBttn.Checked := False;
                    EditMinRandInpAct.Enabled := False;
                    EditMaxRandInpAct.Enabled := False;
                  end;

               1: begin
                    EditConstInpAct.Text := '0';
                    EditMinRandInpAct.Text := min_rand_inp_Act_str[cur_input];
                    EditMaxRandInpAct.Text := max_rand_inp_Act_str[cur_input];
                    ConstInpActBttn.Checked := False;
                    RandInpActBttn.Checked := True;
                    EditMinRandInpAct.Enabled := True;
                    EditMaxRandInpAct.Enabled := True;
                  end;
             end{case};

             case USActMode of
               0: begin
                    EditConstUSAct.Text := const_US_Act_Str;
                    EditMinRandUSAct.Text := '0';
                    EditMaxRandUSAct.Text := '1';
                    ConstUSActBttn.Checked := True;
                    RandUSActBttn.Checked := False;
                    EditMinRandUSAct.Enabled := False;
                    EditMaxRandUSAct.Enabled := False;
                  end;

               1: begin
                    EditConstUSAct.Text := '0';
                    EditMinRandUSAct.Text := min_rand_US_Act_str;
                    EditMaxRandUSAct.Text := max_rand_US_Act_str;
                    ConstUSActBttn.Checked := False;
                    RandUSActBttn.Checked := True;
                    EditMinRandUSAct.Enabled := True;
                    EditMaxRandUSAct.Enabled := True;
                  end;

               2: begin
                    EditConstUS2Act.Text := const_US2_Act_Str;
                    EditMinRandUS2Act.Text := '0';
                    EditMaxRandUS2Act.Text := '1';
                    ConstUS2ActBttn.Checked := True;
                    RandUS2ActBttn.Checked := False;
                    EditMinRandUS2Act.Enabled := False;
                    EditMaxRandUS2Act.Enabled := False;
                  end;

               3: begin
                    EditConstUS2Act.Text := '0';
                    EditMinRandUS2Act.Text := min_rand_US2_Act_str;
                    EditMaxRandUS2Act.Text := max_rand_US2_Act_str;
                    ConstUS2ActBttn.Checked := False;
                    RandUS2ActBttn.Checked := True;
                    EditMinRandUS2Act.Enabled := True;
                    EditMaxRandUS2Act.Enabled := True;
                  end;
             end{case};

             Case Contingency of
               0: begin
                    Pavlovian1Bttn.Checked := True;

                    if (not RDependentCheckBox.Checked) then
                      DisableGroupBox3(sender)
                    else
                       EnableGroupBox3(sender);
                  end;

             1,2: begin
                      if Contingency = 1 then
                        OperantBttn.Checked := True;
                      if Contingency = 2 then
                        OmissionBttn.Checked := True;

                      EnableGroupBox3(sender);

                      str(Tot_Op_Targets,txt1);
                      EditTargets.Text := txt1;

                      if Op_Target[cur_op_target].op_npe > 0 then
                        str(Op_Target[cur_op_target].op_npe,txt1);

                      EditNPE.Text := txt1;

                      EditMinOpAct.Text := Op_Target[cur_op_target].
                                           min_Op_Act_str;

                      EditMaxOpAct.Text := Op_Target[cur_op_target].
                                           max_Op_Act_str;

                      if Tot_Op_Targets = 1 then
                        begin
                          TargetNextBttn.Enabled := False;
                          TargetBackBttn.Enabled := False;
                        end else
                          begin
                            if Cur_Op_Target >= Tot_Op_Targets then
                              begin
                                TargetNextBttn.Enabled := False;
                                TargetBackBttn.Enabled := True;
                              end;

                            if (cur_op_target<tot_op_targets) and
                               (cur_op_target > 1) then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := true;
                              end;

                            if cur_op_target = 1 then
                              begin
                                TargetNextBttn.Enabled := True;
                                TargetBackBttn.Enabled := False;
                              end;
                          end;
                    end;
             end{case};
           end;
       end;

     BuildHint(sender);
    end else
      HandCraftSchedule(sender);
end;

procedure TForm3.EditTotTrialTypesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditTotTrialTypes.Text <> '' then
                      EditTotTrialTypes.Color := clYellow
                   else
                       EditTotTrialTypes.Color := clWhite;

                   EditTotTrialTypesChange(sender);
              end;

          33: if (Tot_Trial_Types > 1) and
                 (cur_trial_type > 1) then
                  TrialTypeBackBttnClick(Sender);

          34: if (Tot_Trial_Types > 1) and
                 (cur_trial_type < Tot_Trial_Types) then
                  TrialTypeNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditTotInputsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      Case Key of
          13: begin
                   if EditTotInputs.Text <> '' then
                      EditTotInputs.Color := clYellow
                   else
                       EditTotInputs.Color := clWhite;

                   EditTotInputsChange(sender);
              end;

          33: if (Tot_Inputs > 1) and (cur_input > 1) then
                  InpBackBttnClick(Sender);

          34: if (Tot_Inputs > 1) and (cur_input < Tot_Inputs) then
                  InpNextBttnClick(Sender);
      end{case};
end;

procedure TForm3.EditTotTrialsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditTotTrials.Text <> '' then
                      EditTotTrials.Color := clYellow
                   else
                       EditTotTrials.Color := clWhite;

                   EditTotTrialsChange(sender);
              end;

          33: if (Tot_Trial_Types > 1) and
                 (cur_trial_type > 1) then
                  TrialTypeBackBttnClick(Sender);

          34: if (Tot_Trial_Types > 1) and
                 (cur_trial_type < Tot_Trial_Types) then
                  TrialTypeNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditTrialTypeLabelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditTrialTypeLabel.Text <> '' then
                      EditTrialTypeLabel.Color := clYellow
                   else
                       EditTrialTypeLabel.Color := clWhite;

                   EditTrialTypeLabelChange(sender);
              end;

          33: if (Tot_Trial_Types > 1) and
                 (cur_trial_type > 1) then
                  TrialTypeBackBttnClick(Sender);

          34: if (Tot_Trial_Types > 1) and
                 (cur_trial_type < Tot_Trial_Types) then
                  TrialTypeNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditDurationKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditDuration.Text <> '' then
                      EditDuration.Color := clYellow
                   else
                       EditDuration.Color := clWhite;

                   EditDurationChange(sender);
              end;

          33: if (Tot_Trial_Types > 1) and
                 (cur_trial_type > 1) then
                  TrialTypeBackBttnClick(Sender);

          34: if (Tot_Trial_Types > 1) and
                 (cur_trial_type < Tot_Trial_Types) then
                  TrialTypeNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditConstInpActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     with trial_type[cur_trial_type] do
          with ts[cur_ts] do
               Case Key of
                    13: begin
                             if EditConstInpAct.Text <> '' then
                                EditConstInpAct.Color := clYellow
                             else
                                 EditConstInpAct.Color := clWhite;

                             EditConstInpActChange(sender);
                        end;


                    33: if (Tot_Inputs > 1) and (cur_input > 1) then
                        InpBackBttnClick(Sender);

                    34: if (Tot_Inputs > 1) and
                           (cur_input < Tot_Inputs) then
                           InpNextBttnClick(Sender);
               end{case};
end;

procedure TForm3.EditMinRandInpActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
     Case Key of
          13: begin
                   if EditMinRandInpAct.Text <> '' then
                      EditMinRandInpAct.Color := clYellow
                   else
                       EditMinRandInpAct.Color := clWhite;

                   EditMinRandInpActChange(sender);
              end;

          33: if (Tot_Inputs > 1) and (cur_input > 1) then
                  InpBackBttnClick(Sender);

          34: if (Tot_Inputs > 1) and (cur_input < Tot_Inputs) then
                  InpNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditMaxRandInpActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with trial_type[cur_trial_type] do
   with ts[cur_ts] do
     Case Key of
          13: begin
                   if EditMaxRandInpAct.Text <> '' then
                      EditMaxRandInpAct.Color := clYellow
                   else
                       EditMaxRandInpAct.Color := clWhite;

                   EditMaxRandInpActChange(sender);
              end;

          33: if (Tot_Inputs > 1) and (cur_input > 1) then
                  InpBackBttnClick(Sender);

          34: if (Tot_Inputs > 1) and (cur_input < Tot_Inputs) then
                  InpNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditConstUSActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditConstUSAct.Text <> '' then
                      EditConstUSAct.Color := clYellow
                   else
                       EditConstUSAct.Color := clWhite;

                   EditConstUSActChange(sender);
              end;

          33: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts > 1) then
                  tsBackBttnClick(Sender);

          34: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts <
                  Trial_Type[cur_trial_type].Duration) then
                  tsNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditMinRandUSActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditMinRandUSAct.Text <> '' then
                      EditMinRandUSAct.Color := clYellow
                   else
                       EditMinRandUSAct.Color := clWhite;

                   EditMinRandUSActChange(sender);
              end;

          33: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts > 1) then
                  tsBackBttnClick(Sender);

          34: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts <
                  Trial_Type[cur_trial_type].Duration) then
                  tsNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditMaxRandUSActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditMaxRandUSAct.Text <> '' then
                      EditMaxRandUSAct.Color := clYellow
                   else
                       EditMaxRandUSAct.Color := clWhite;

                   EditMaxRandUSActChange(sender);
              end;

          33: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts > 1) then
                  tsBackBttnClick(Sender);

          34: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts <
                  Trial_Type[cur_trial_type].Duration) then
                  tsNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditConstUS2ActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditConstUS2Act.Text <> '' then
                      begin
                          EditConstUSAct.Text := '0';
                          EditConstUSAct.Color := clYellow;
                          EditConstUS2Act.Color := clYellow;
                      end else
                          EditConstUS2Act.Color := clWhite;

                   EditConstUSAct.Text := '0';
                   EditConstUSAct.Color := clYellow;
                   EditConstUSActChange(sender);
                   EditConstUS2ActChange(sender);
              end;

          33: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts > 1) then
                  tsBackBttnClick(Sender);

          34: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts <
                  Trial_Type[cur_trial_type].Duration) then
                  tsNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditMinRandUS2ActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditMinRandUS2Act.Text <> '' then
                      EditMinRandUS2Act.Color := clYellow
                   else
                       EditMinRandUS2Act.Color := clWhite;

                   EditMinRandUS2ActChange(sender);
              end;

          33: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts > 1) then
                  tsBackBttnClick(Sender);

          34: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts <
                  Trial_Type[cur_trial_type].Duration) then
                  tsNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditMaxRandUS2ActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditMaxRandUS2Act.Text <> '' then
                      EditMaxRandUS2Act.Color := clYellow
                   else
                       EditMaxRandUS2Act.Color := clWhite;

                   EditMaxRandUS2ActChange(sender);
              end;

          33: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts > 1) then
                  tsBackBttnClick(Sender);

          34: if (Trial_Type[cur_trial_type].Duration > 1) and
                 (Trial_Type[cur_trial_type].cur_ts <
                  Trial_Type[cur_trial_type].Duration) then
                  tsNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditTargetsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
     Case Key of
          13: begin
                   if EditTargets.Text <> '' then
                      Edittargets.Color := clYellow
                   else
                       EditTargets.Color := clWhite;

                   EditTargetsChange(sender);
              end;

          33: if (Tot_Op_Targets > 1) and (cur_op_target > 1) then
                TargetBackBttnClick(Sender);

          34: if (Tot_Op_Targets > 1) and
                 (cur_op_target < tot_op_targets) then
                TargetNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EditNPEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      Case Key of
          13: begin
                   if EditNPE.Text <> '' then
                      EditNPE.Color := clYellow
                   else
                       EditNPE.Color := clWhite;

                   EditNPEChange(sender);
              end;

          33: if (Tot_Op_Targets > 1) and (cur_op_target > 1) then
                TargetBackBttnClick(Sender);

          34: if (Tot_Op_Targets > 1) and
                 (cur_op_target < tot_op_targets) then
                TargetNextBttnClick(Sender);
      end{case};
end;

procedure TForm3.EditMinOpActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      Case Key of
          13: begin
                   if EditMinOpAct.Text <> '' then
                      EditMinOpAct.Color := clYellow
                   else
                       EditMinOpAct.Color := clWhite;

                   EditMinOpActChange(sender);
              end;

          33: if (Tot_Op_Targets > 1) and (cur_op_target > 1) then
                TargetBackBttnClick(Sender);

          34: if (Tot_Op_Targets > 1) and
                 (cur_op_target < tot_op_targets) then
                TargetNextBttnClick(Sender);
      end{case};
end;

procedure TForm3.EditMaxOpActKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
      Case Key of
          13: begin
                   if EditMaxOpAct.Text <> '' then
                      EditMaxOpAct.Color := clYellow
                   else
                       EditMaxOpAct.Color := clWhite;

                   EditMaxOpActChange(sender);
              end;

          33: if (Tot_Op_Targets > 1) and (cur_op_target > 1) then
                TargetBackBttnClick(Sender);

          34: if (Tot_Op_Targets > 1) and
                 (cur_op_target < tot_op_targets) then
                TargetNextBttnClick(Sender);
      end{case};
end;

procedure TForm3.EditTrialTypeGoToKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case key of
          13: EditTrialTypeGoToChange(sender);

          33: if (tot_trial_types > 1) and (cur_trial_type > 1) then
                  TrialTypeBackBttnClick(Sender);

          34: if (Tot_Trial_types > 1) and
                 (cur_trial_type < tot_trial_types) then
                  TrialTypeNextBttnClick(Sender);
     end{case};
end;

procedure TForm3.EdittsGoToKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     with trial_type[cur_trial_type] do
          with ts[cur_ts] do
               case key of
                    13: EdittsGoToChange(sender);

                    33: if (duration > 1) and
                           (cur_ts > 1) then
                           tsBackBttnClick(Sender);

                    34: if (duration > 1) and
                           (cur_ts < duration) then
                           tsNextBttnClick(Sender);
               end{case};
end;

procedure TForm3.EditInputGoToKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     with trial_type[cur_trial_type] do
          with ts[cur_ts] do
               case key of
                    13: EditInputGoToChange(sender);

                    33: if (tot_inputs > 1) and
                           (cur_input > 1) then
                           InpBackBttnClick(Sender);

                    34: if (tot_inputs > 1) and
                           (cur_input < tot_inputs) then
                           InpNextBttnClick(Sender);
               end{case};
end;

procedure TForm3.EditTargetGoToKeyDown(Sender: TObject; var Key: Word;
          Shift: TShiftState);
begin
  with trial_type[cur_trial_type] do
    with ts[cur_ts] do
          case key of
               13: EditTargetGoToChange(sender);

               33: if (Tot_Op_Targets > 1) and
                      (cur_op_target > 1) then
                       TargetBackBttnClick(Sender);

               34: if (tot_op_targets > 1) and
                      (cur_op_target < tot_op_targets) then
                      TargetNextBttnClick(Sender);
          end{case};
end;

procedure TForm3.EditTotTrialTypesChCl(Sender: TObject);
begin
     EditTotTrialTypes.Color := clWhite;
end;

procedure TForm3.EditTotInputsChCl(Sender: TObject);
begin
     EditTotInputs.Color := clWhite;
end;

procedure TForm3.EditTotTrialsChCl(Sender: TObject);
begin
     EditTotTrials.Color := clWhite;
end;

procedure TForm3.EditTrialTypeLabelChCl(Sender: TObject);
begin
     EditTrialTypeLabel.Color := clWhite;
end;

procedure TForm3.EditDurationChCl(Sender: TObject);
begin
     EditDuration.Color := clWhite;
end;

procedure TForm3.EditConstInpActChCl(Sender: TObject);
begin
     EditConstInpAct.Color := clWhite;
end;

procedure TForm3.EditMinRandInpActChCl(Sender: TObject);
begin
     EditMinRandInpAct.Color := clWhite;
end;

procedure TForm3.EditMaxRandInpActChCl(Sender: TObject);
begin
     EditMaxRandInpAct.Color := clWhite;
end;

procedure TForm3.EditConstUSActChCl(Sender: TObject);
begin
     EditConstUSAct.Color := clWhite;
end;

procedure TForm3.EditMinRandUSActChCl(Sender: TObject);
begin
     EditMinRandUSAct.Color := clWhite;
end;

procedure TForm3.EditMaxRandUSActChCl(Sender: TObject);
begin
     EditMaxRandUSAct.Color := clWhite;
end;

procedure TForm3.EditConstUS2ActChCl(Sender: TObject);
begin
     EditConstUS2Act.Color := clWhite;
end;

procedure TForm3.EditMinRandUS2ActChCl(Sender: TObject);
begin
     EditMinRandUS2Act.Color := clWhite;
end;

procedure TForm3.EditMaxRandUS2ActChCl(Sender: TObject);
begin
     EditMaxRandUS2Act.Color := clWhite;
end;

procedure TForm3.EditTargetsChCl(Sender: TObject);
begin
     EditTargets.Color := clWhite;
end;

procedure TForm3.EditNPEChCl(Sender: TObject);
begin
     EditNPE.Color := clWhite;
end;

procedure TForm3.EditMinOpActChCl(Sender: TObject);
begin
     EditMinOpAct.Color := clWhite;
end;

procedure TForm3.EditMaxOpActChCl(Sender: TObject);
begin
     EditMaxOpAct.Color := clWhite;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caNone;

  if JustSaved then
    begin
      Form0.Caption := 'SelNet';
      Form0.Run1.Enabled := True;
      SaveSch.Enabled := False;
      Action := caFree;
      Form0.Schedule1.Enabled := True;
    end else
      case MessageDlg('Save current arrangement?',mtConfirmation,
                       [mbYes, mbNo, mbCancel],0) of
         mrYes: begin
                  SaveSchClick(sender);
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  SaveSch.Enabled := False;
                  Action := caFree;
                  Form0.Schedule1.Enabled := True;
                end;

          mrNo: begin
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  SaveSch.Enabled := False;
                  Action := caFree;
                  Form0.Schedule1.Enabled := True;
                end;
           end{case};
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
     if ColorDialog1.Execute then
        Trial_Type[cur_trial_type].Color := ColorDialog1.Color;
end;


procedure TForm3.Exit1Click(Sender: TObject);
begin
  if JustSaved then
    begin
      Form0.Caption := 'SelNet';
      Form0.Run1.Enabled := True;
      SaveSch.Enabled := False;
      Form0.Schedule1.Enabled := True;
    end else
      case MessageDlg('Save current arrangement?',mtConfirmation,
                       [mbYes, mbNo, mbCancel],0) of
         mrYes: begin
                  SaveSchClick(sender);
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  SaveSch.Enabled := False;
                  Form0.Schedule1.Enabled := True;
                end;

          mrNo: begin
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  SaveSch.Enabled := False;
                  Form0.Schedule1.Enabled := True;
                end;
           end{case};
end;

procedure TForm3.ConstInpActBttnClick(Sender: TObject);
begin
     with trial_type[cur_trial_type] do
       with ts[cur_ts] do
         InpActMode[cur_input] := 0;

     EditConstInpAct.Enabled := True;

     StaticText15.Enabled := False;
     StaticText16.Enabled := False;
     EditMinRandInpAct.Enabled := False;
     EditMaxRandInpAct.Enabled := False;

     BuildHint(sender);
end;

procedure TForm3.RandInpActBttnClick(Sender: TObject);
begin
     with trial_type[cur_trial_type] do
       with ts[cur_ts] do
            InpActMode[cur_input] := 1;

     EditConstInpAct.Enabled := False;

     StaticText15.Enabled := True;
     StaticText16.Enabled := True;
     EditMinRandInpAct.Enabled := True;
     EditMaxRandInpAct.Enabled := True;

     BuildHint(sender);
end;

procedure TForm3.ConstUSActBttnClick(Sender: TObject);
begin
     with trial_type[cur_trial_type] do
       with ts[cur_ts] do
         USActMode := 0;  (*US1 constant activation*)

     ConstUSActBttn.Checked := True;
     EditConstUSAct.Enabled := True;
     StaticText13.Enabled := False;
     EditMinRandUSAct.Enabled := False;
     StaticText14.Enabled := False;
     EditMaxRandUSAct.Enabled := False;

     ConstUS2ActBttn.Checked := False;
     EditConstUS2Act.Enabled := False;
     StaticText12.Enabled := False;
     RandUS2ActBttn.Checked := False;
     EditMinRandUS2Act.Enabled := False;
     StaticText20.Enabled := False;
     EditMaxRandUS2Act.Enabled := False;

     BuildHint(sender);
end;

procedure TForm3.RandUSActBttnClick(Sender: TObject);
begin
     with trial_type[cur_trial_type] do
       with ts[cur_ts] do
            USActMode := 1; (*US1 random activation*)

     ConstUSActBttn.Checked := False;
     RandUSActBttn.Enabled := True;
     EditConstUSAct.Enabled := False;

     ConstUS2ActBttn.Checked := False;   (*Only 1 US allowed at any ts*)
     EditConstUS2Act.Enabled := False;

     StaticText13.Enabled := True;
     StaticText14.Enabled := True;

     StaticText12.Enabled := False;
     StaticText20.Enabled := False;
     EditMinRandUSAct.Enabled := True;
     EditMaxRandUSAct.Enabled := True;

     RandUS2ActBttn.Checked := False;
     EditMinRandUS2Act.Enabled := False;
     EditMaxRandUS2Act.Enabled := False;

     BuildHint(sender);
end;

procedure TForm3.ConstUS2ActBttnClick(Sender: TObject);
begin
     with trial_type[cur_trial_type] do
       with ts[cur_ts] do
         USActMode := 2;   (*US2 constant activation (09/2020)*)

     ConstUSActBttn.Checked := False;   (*Only 1 US allowed at any ts*)
     EditConstUSAct.Enabled := False;
     RandUSActBttn.Checked := False;
     StaticText13.Enabled := False;
     EditMinRandUSAct.Enabled := False;
     StaticText14.Enabled := False;
     EditMaxRandUSAct.Enabled := False;

     EditConstUS2Act.Enabled := True;
     RandUS2ActBttn.Checked := False;

     StaticText12.Enabled := False;
     EditMinRandUS2Act.Enabled := False;
     StaticText20.Enabled := False;
     EditMaxRandUS2Act.Enabled := False;

     BuildHint(sender);
end;

procedure TForm3.RandUS2ActBttnClick(Sender: TObject);
begin
     with trial_type[cur_trial_type] do
       with ts[cur_ts] do
            USActMode := 3;    (*US2 random activation (09/2020)*)

     ConstUSActBttn.Checked := False;   (*Only 1 US allowed at any ts*)
     EditConstUSAct.Enabled := False;

     RandUSActBttn.Checked := False;
     StaticText13.Enabled := False;
     EditMinRandUSAct.Enabled := False;
     StaticText14.Enabled := False;
     EditMaxRandUSAct.Enabled := False;

     EditConstUS2Act.Enabled := True;
     StaticText12.Enabled := True;
     StaticText20.Enabled := True;
     EditMinRandUS2Act.Enabled := True;
     EditMaxRandUS2Act.Enabled := True;

     BuildHint(sender);
end;

procedure TForm3.Print1Click(Sender: TObject);
begin
   if printdialog1.execute then
     RichEdit1.Print('Contingency file: ' + OpenDialog1.FileName);
end;

procedure TForm3.RDependentCheckBoxClick(Sender: TObject);
begin
    If (RDependentCheckBox.Checked) or (OmissionBttn.Checked) then
       EnableGroupBox3(sender)
    else
      DisableGroupBox3(sender);
end;

end.

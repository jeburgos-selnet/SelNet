unit Sn_unit1;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls,
    Forms, Dialogs, Menus, StdCtrls, ExtCtrls, ComCtrls, Buttons, Grids,
    DirOutln;

Const
     Max_NPEs = 230;  { Maximum number of units (including inputs) }
     Max_Inputs = 25; { maximum number of input elements }
     Max_Pre_Inps = 25;   { maximum number of presynaptic inputs per NPE }
     Max_Time_Steps = 1000; { maximum number of time steps per trial }
     Max_Obs_NPEs = 300;  { maximum number of observed NPEs }
     Max_Sim_Types = 100; { maximum number of simulation types }
     Max_Tot_Sims  = 100; { maximum number of simulations per type }

type
    TForm1 = class (TForm)
    MainMenu1: TMainMenu;
    Main1: TMenuItem;
    Open1: TMenuItem;
    Panel2: TPanel;
    StaticText4: TStaticText;
    EditTotSimTypes: TEdit;
    StaticText5: TStaticText;
    EditTotSims: TEdit;
    Panel3: TPanel;
    EditMess: TEdit;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText11: TStaticText;
    GroupBox1: TGroupBox;
    ConstInitWgtBttn: TRadioButton;
    RandInitWgtBttn: TRadioButton;
    NoResetWgtBttn: TRadioButton;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    EditProcFileName: TEdit;
    EditNetFileName: TEdit;
    Label10: TLabel;
    EditGoTo: TEdit;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    BackBttn: TSpeedButton;
    NextBttn: TSpeedButton;
    StaticText9: TStaticText;
    InsBttn: TButton;
    DelBttn: TButton;
    Save1: TMenuItem;
    New1: TMenuItem;
    EditConstInitWgt: TEdit;
    GroupBox4: TGroupBox;
    ActCheckBox: TCheckBox;
    WgtCheckBox: TCheckBox;
    GroupBox5: TGroupBox;
    OpCheckBox: TCheckBox;
    EditOpCrit: TEdit;
    CRCheckBox: TCheckBox;
    EditCRCrit: TEdit;
    GroupBox6: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    EditNPEList: TEdit;
    EditTSList: TEdit;
    NPELabel: TLabel;
    TSLabel1: TLabel;
    TSLabel2: TLabel;
    EditNPEList2: TEdit;
    EditTSList2: TEdit;
    EditTSList3: TEdit;
    EditMinRandInitWgt: TEdit;
    EditMaxRandInitWgt: TEdit;
    MinRandInitWgtLabel: TLabel;
    MaxRandInitWgtLabel: TLabel;
    Browse: TButton;
    OpenDialog2: TOpenDialog;
    Exit1: TMenuItem;
    N1: TMenuItem;
    Print1: TMenuItem;
    RichEdit1: TRichEdit;
    PrintDialog1: TPrintDialog;
    RndAsync: TRadioButton;
    SeqAsync: TRadioButton;
    RndSync: TRadioButton;
    SeqSync: TRadioButton;
    RadioGroup1: TRadioGroup;
    CR2CheckBox: TCheckBox;
    EditCR2Crit: TEdit;

    procedure Exit1Click(Sender: TObject);
    procedure clear_cur_sim_panel(Sender: TObject);
    procedure CreateExpFile(Sender: TObject);
    procedure EditTotSimTypesChange(Sender: TObject);
    procedure EditTotSimTypesChCl(Sender: TObject);
    procedure EditTotSimsChange(Sender: TObject);
    procedure EditTotSimsChCl(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure EditCRCritChange(Sender: TObject);
    procedure EditCRCritChCl(Sender: TObject);
    procedure EditCR2CritChange(Sender: TObject);
    procedure EditCR2CritChCl(Sender: TObject);
    procedure EditMessChange(Sender: TObject);
    procedure EditMessChCl(Sender: TObject);
    procedure EditNetFileNameChange(Sender: TObject);
    procedure EditNetFileNameChCl(Sender: TObject);
    procedure EditProcFileNameChange(Sender: TObject);
    procedure EditProcFileNameChCl(Sender: TObject);
    procedure RandInitWgtBttnClick(Sender: TObject);
    procedure NoResetWgtBttnClick(Sender: TObject);
    procedure EditNPEListChange(Sender: TObject);
    procedure EditNPEListChCl(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure EditTSListChange(Sender: TObject);
    procedure EditTSListChCl(Sender: TObject);
    procedure EditConstInitWgtChange(Sender: TObject);
    procedure EditConstInitWgtChCl(Sender: TObject);
    procedure EditOpCritChange(Sender: TObject);
    procedure EditOpCritChCl(Sender: TObject);
    procedure EditGoToChange(Sender: TObject);
    procedure EditTotSimTypesKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditTotSimsKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditCR2CritKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditMessKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditNetFileNameKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditProcFileNameKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditConstInitWgtKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditNPEListKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditTSListKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditGoToKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure EditOpCritKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure Save1Click(Sender: TObject);
    procedure SaveExpFile(Sender: TObject);
    procedure OpenExpFile(Sender : TObject);
    procedure ReadExpFile(Sender : TObject);
    procedure NextBttnClick(Sender: TObject);
    procedure BackBttnClick(Sender: TObject);
    procedure InsBttnClick(Sender: TObject);
    procedure DelBttnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Open1Click(Sender: TObject);
    procedure ConstInitWgtBttnClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    Function AllFieldsFilled(Sender: TObject): Boolean;
    procedure OpCheckBoxClick(Sender: TObject);
    procedure CRCheckBoxClick(Sender: TObject);
    procedure CR2CheckBoxClick(Sender: TObject);
    procedure ActCheckBoxClick(Sender: TObject);
    procedure WgtCheckBoxClick(Sender: TObject);
    procedure EditMinRandInitWgtChCl(Sender: TObject);
    procedure EditMinRandInitWgtChange(Sender: TObject);
    procedure EditMaxRandInitWgtChCl(Sender: TObject);
    procedure EditMaxRandInitWgtChange(Sender: TObject);
    procedure EditMinRandtInitWgtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditMaxRandtInitWgtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BrowseClick(Sender: TObject);
    procedure BuildHint(sender: tobject);
    procedure Print1Click(Sender: TObject);
    procedure RndAsyncClick(Sender: TObject);
    procedure SeqAsyncClick(Sender: TObject);
    procedure RndSyncClick(Sender: TObject);
    procedure SeqSyncClick(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
    end;

    Flags = -3..10;  { for probe, Pavlovian/operant, input-type,
                      net-type, npe-type, and reset-weights}

var
   Form1 : TForm1;

   Tot_Obs_NPEs, Tot_Obs_TimeSteps : Array[1..Max_Sim_Types] of integer;
   Obs_NPE_List, Obs_ts_List : Array[1..Max_Sim_Types] of String;
   Obs_NPE : Array[1..Max_Sim_Types,1..Max_NPEs] of integer;
   Obs_ts :  Array[1..Max_Sim_Types,1..Max_Time_Steps] of integer;

   st, Tot_Sim_Types, tot_sims : integer;

   Const_Init_Wgts,
   Min_Rand_Init_Wgts,
   Max_Rand_Init_Wgts : Array[1..Max_Sim_Types] of extended;

   Rst_Wgts: Array[1..Max_Tot_Sims] of -1..1;
   CR_Crit, CR2_Crit, Op_Crit,
   StoreActs, StoreWgts : Array[1..Max_Tot_Sims] of Boolean;
   CR, CR2, Op : Array[1..Max_Tot_Sims] of Extended;
   CR_Str, CR2_Str, Op_Str : Array[1..Max_Tot_Sims] of String;

 { Filenames }
   Exp_FileName: String;

   Net_FileName,
   Net_FileName_I,
   Net_FileName_F,
   Sch_FileName : Array[1..Max_Sim_Types] of String;

 { File buffers }
   Ef : Text;

   Mess: Array[1..Max_Sim_Types] of String;

   Operant_Procedure : Boolean;

 { added Sat. 1/23/99 at Los Chaguaramos }

   Const_Init_Wgts_Str,
   Min_Rand_Init_Wgts_Str,
   Max_Rand_Init_Wgts_Str : Array[1..Max_Sim_Types] of String[20];

   Rst_Wgts_Chkd_Bttn: Array[1..Max_Sim_Types] of 1..3;

   Action: TCloseAction;

   EditTotSimTypes_prev_val, EditTotSimTypes_cur_val,
   EditTotSims_prev_val, EditTotSims_cur_val : Integer;

   EditCRCrit_prev_val, EditCRCrit_cur_val,
   EditCR2Crit_prev_val, EditCR2Crit_cur_val,
   EditConstInitWgt_prev_val, EditConstInitWgt_cur_val,
   EditMinRandInitWgt_prev_val, EditMinRandInitWgt_cur_val,
   EditMaxRandInitWgt_prev_val, EditMaxRandInitWgt_cur_val,
   EditOpCrit_prev_val, EditOpCrit_cur_val : Extended;

   EditMessChange_prev_txt, EditMessChange_cur_txt,
   EditProcFileName_prev_txt, EditProcFileName_cur_txt,
   EditNetFileName_prev_txt, EditNetFileName_cur_txt,
   EditNPEList_prev_txt, EditNPEList_cur_txt,
   EditTSList_prev_txt, EditTSList_cur_txt,
   EditFixInitWgt_prev_txt, EditFixInitWgt_cur_txt : String;

   Form : Byte;
   JustSaved : Boolean;

   Editing_Net_Filename, Editing_Prc_Filename : Boolean;

   OpenExpRequest : Boolean;

  {Added 10/31/2019, to allow for choice in update procedure}
   UpProc: String[10];
   
implementation

uses Sn_Unit0;

{$R *.DFM}

procedure TForm1.BuildHint(sender: tobject);
var
   c : integer;
   txt, txt0, txt1, txt2, txt3 : string;
begin
  StaticText4.Hint := '';

  for c := 1 to Tot_Sim_Types do
    begin
      str(c,txt);

      StaticText4.Hint := StaticText4.Hint + txt + ': ' +
                          mess[c] + '; ' + Net_FileName[c] + '; ' +
                          Sch_FileName[c] + '; ';

      case Rst_Wgts[c] of
        -1: begin
              txt1 := 'rnd';
              txt2 := '[' + min_rand_init_wgts_str[c] + ','
                          + max_rand_init_wgts_str[c] + ']';
            end;

         0: begin
              txt1 := 'net';
              txt2 := '';
            end;

         1: begin
              txt1 := 'fxd';
              txt2 := '(' + EditConstInitWgt.Text + ')';
            end;
      end{case};

      StaticText4.Hint := StaticText4.Hint + 'Init.wgts.=' +
                          txt1 + txt2 + '; ' + 'units={' +
                          Obs_NPE_List[c] + '}, ' +
                          'ts={' + Obs_ts_List[c] + '}; Store:';

      Case StoreActs[c] of
        True: txt0 := 'A';
        False: txt0 := '';
      end{case};

      Case StoreWgts[c] of
        True: txt1 := 'W';
        False: txt1 := '';
      end{case};

      if (StoreActs[c]) and (StoreWgts[c]) then
        txt0 := txt0 + ', ';

      StaticText4.Hint := StaticText4.Hint + txt0 + txt1;

      Case Op_Crit[c] of
        true: begin
               txt0 := 'R';
               txt1 := '(' + Op_Str[c] + ')';
              end;

        false: begin
               txt0 := '';
               txt1 := '';
              end;
      end{case};

      Case CR_Crit[c] of
        true: begin
               txt2 := 'R*';
               txt3 := '(' + CR_Str[c] + ')';
              end;

        false: begin
               txt2 := '';
               txt3 := '';
              end;
      end{case};

      if (Op_Crit[c]) or (CR_Crit[c]) then
         StaticText4.Hint := StaticText4.Hint + ', ';

      if (Op_Crit[c]) and (CR_Crit[c]) then
        txt1 :=  txt1 + ', ';

      StaticText4.Hint := StaticText4.Hint + txt0 + txt1
                          + txt2 + txt3 + '.     ';
    end;

  RichEdit1.Text := 'Simulation file ' + OpenDialog1.FileName + '  -  ' +
                    StaticText4.Hint;
end;

{ Begin creating an experiment }
procedure TForm1.CreateExpFile(Sender: TObject);
var
   i : integer;
begin
     st := 1;

     If (not OpenExpRequest) or
        ((OpenExpRequest) and (OpenDialog1.FileName = '') ) then
       Form1.Caption := 'New simulation file';

     if (OpenExpRequest) and (OpenDialog1.FileName <> '') then
         begin
              Caption := 'Simulation file - ' + OpenDialog1.FileName;
              SaveDialog1.FileName := OpenDialog1.FileName;
         end;

     StaticText8.Caption := '1';

     Tot_Sim_Types := 1;
     Tot_Sims := 1;

     EditTotSimTypes.Text := '1';
     EditTotSims.Text := '1';

     {default update procedure; 10/31/2019}
     RndAsync.Checked := True;
     UpProc := 'RndAsync';

     Clear_Cur_Sim_Panel(sender);

     for i := 1 to Max_Sim_Types do
         begin
              Mess[i] := '';

              Net_FileName[i] := '';
              Sch_FileName[i] := '';
              Net_FileName_I[i] := '';
              Net_FileName_F[i] := '';
              Sch_FileName[i] := '';

              Rst_Wgts[i] := 0;
              Const_Init_Wgts[i] := 0.01;
              Const_Init_Wgts_Str[i] := '.01';
              Min_Rand_Init_Wgts[i] := 0;
              Min_Rand_Init_Wgts_Str[i] := '0';
              Max_Rand_Init_Wgts[i] := 0.01;
              Max_Rand_Init_Wgts_Str[i] := '.01';
              Rst_Wgts_Chkd_Bttn[i] := 3;

              StoreActs[i] := False;
              StoreWgts[i] := False;
              Obs_NPE_List[i] := '';
              Tot_Obs_NPEs[i] := 0;
              Obs_ts_List[i] := '';
              Tot_Obs_TimeSteps[i] := 0;

              CR_Crit[i] := False;
              CR2_Crit[i] := False;
              Op_Crit[i] := False;
              Op[i] := 0.5;
              Op_Str[i] := '.5';
              CR[i] := 0.5;
              CR_Str[i] := '.5';
              CR2[i] := 0.5;
              CR2_Str[i] := '.5';
         end;

     NextBttn.Enabled := False;
     BackBttn.Enabled := False;
     DelBttn.Enabled := False;

     NoResetWgtBttn.Checked := True;

     ActCheckBox.Checked := True;
     WgtCheckBox.Checked := False;

     OpCheckBox.Checked := False;
     CRCheckBox.Checked := False;
     CR2CheckBox.Checked := False;

     Panel2.Visible := True;
     Panel3.Visible := True;

     EditConstInitWgt.Text := '.01';
     EditCRCrit.Text := '.5';
     EditCR2Crit.Text := '.5';
     EditOpCrit.Text := '.5';

     EditTotSimTypes.SetFocus;

     JustSaved := True;
end;

procedure TForm1.Exit1Click (Sender: TObject);
begin
   if JustSaved then
       begin
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          Save1.Enabled := False;
          Form0.Experiment1.Enabled := True;
          Form1.Close;
       end else
           if MessageDlg('Exit without saving simulation file?',mtConfirmation,
                         [mbYes, mbNo],0) = mrYes then
             begin
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  Save1.Enabled := False;
                  Form0.Experiment1.Enabled := True;
                  Form1.Close;
             end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
     Panel2.Visible := False;
     Panel3.Visible := False;
end;

procedure TForm1.clear_cur_sim_panel(sender: TObject);
begin
     EditCRCrit.Text := '';
     EditCR2Crit.Text := '';
     EditMess.Text := '';
     EditProcFileName.Text := '';
     EditNetFileName.Text := '';
     EditConstInitWgt.Text := '';
     EditNPEList.Text := '';
     EditTSList.Text := '';
     EditOpCrit.Text := '';

     EditTotSimTypes.Color := clWhite;
     EditTotSims.Color := clWhite;
     EditCRCrit.Color := clWhite;
     EditCR2Crit.Color := clWhite;
     EditMess.Color := clWhite;
     EditProcFileName.Color := clWhite;
     EditNetFileName.Color := clWhite;
     EditConstInitWgt.Color := clWhite;
     EditNPEList.Color := clWhite;
     EditTSList.Color := clWhite;
     EditOpCrit.Color := clWhite;
end;

procedure TForm1.EditTotSimTypesChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;
     EditTotSimTypes.Color := clWhite;
end;

procedure TForm1.EditTotSimsChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;
     EditTotSims.Color := clWhite;
end;

procedure TForm1.EditMessChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;
     EditMess.Color := clWhite;
end;

procedure TForm1.EditProcFileNameChCl(Sender: TObject);
begin
     Editing_Net_FileName := False;
     Editing_Prc_Filename := True;
     Browse.Enabled := True;
     EditProcFileName.Color := clWhite;
end;

procedure TForm1.EditNetFileNameChCl(Sender: TObject);
begin
     Editing_Net_Filename := True;
     Editing_Prc_FileName := False;
     Browse.Enabled := True;
     EditNetFileName.Color := clWhite;
end;

procedure TForm1.EditConstInitWgtChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;
     EditConstInitWgt.Color := clWhite;
end;

procedure TForm1.EditMinRandInitWgtChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;
     EditMinRandInitWgt.Color := clWhite;
end;

procedure TForm1.EditMaxRandInitWgtChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;
     EditMaxRandInitWgt.Color := clWhite;
end;

procedure TForm1.EditNPEListChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     EditNPEList.Color := clWhite;

     if (ActCheckBox.Checked) or (WgtCheckBox.Checked) then
        EditNPEList2.Text := EditNPEList.Text
     else
        EditNPEList2.Text := '';
end;

procedure TForm1.EditTSListChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     EditTSList.Color := clWhite;

     if (ActCheckBox.Checked) or (WgtCheckBox.Checked) then
        EditTSList2.Text := EditTSList.Text
     else
        EditTSList2.Text := '';

     if (OpCheckBox.Checked) or (CRCheckBox.Checked) then
        EditTSList3.Text := EditTSList.Text
     else
        EditTSList3.Text := '';
end;

procedure TForm1.EditTotSimTypesChange(Sender: TObject);
Var
   Code  : Integer;
   txt : string;
begin
  EditTotSimTypes_prev_val := Tot_Sim_Types;
  Val(EditTotSimTypes.Text,EditTotSimTypes_cur_val,Code);

  if tot_sim_types > 1 then
    DelBttn.Enabled := True
  else
     DelBttn.Enabled := False;

  if (code <> 0) and (EditTotSimTypes.Text <> '') then
    begin
      MessageDlg('Only whole positive numeric values.', mtError, [mbOk],0);
      Str(Tot_Sim_Types,txt);
      EditTotSimTypes.Text := txt;
      EditTotSimTypes.SetFocus;
    end else
      begin
        if EditTotSimTypes_cur_val <= 1 then
          begin
            st := 1;
            Tot_Sim_Types := 1;
            EditTotSimTypes.Text := '1';
            StaticText8.Caption := '1';
            NextBttn.Enabled := False;
            BackBttn.Enabled := False;
          end;

        if EditTotSimTypes_cur_val > Max_Sim_Types then
          begin
            Tot_Sim_Types := Max_Sim_Types;
            Str(Tot_Sim_Types,txt);
            EditTotSimTypes.Text := txt;

            if (st < Max_Sim_Types) then
              NextBttn.enabled := True;
          end;

        if (EditTotSimTypes_cur_val > 1) and
           (EditTotSimTypes_cur_val <= Max_Sim_Types) then
          begin
            Tot_Sim_Types := EditTotSimTypes_cur_val;

            if (Tot_Sim_Types > EditTotSimTypes_prev_val) then
              NextBttn.Enabled := True;

            if (Tot_Sim_Types < EditTotSimTypes_prev_val) then
              begin
                if st > Tot_Sim_Types then
                  begin
                    st := Tot_Sim_Types;
                    Str(st,txt);
                    StaticText8.Caption := txt;
                    NextBttn.Enabled := False;
                    BackBttn.Enabled := True;
                  end;
          end;
      end;
    end;

  BuildHint(sender);

  if EditTotSimTypes_cur_val <> EditTotSimTypes_prev_val then
    begin
      JustSaved := False;
      EditTotSimTypes.Color := clYellow;
    end else
      EditTotSimTypes.Color := clWhite;

  if tot_sim_types > 1 then
    DelBttn.Enabled := True
  else
    DelBttn.Enabled := False;
end;

procedure TForm1.EditTotSimsChange(Sender: TObject);
Var
   Code : Integer;
   txt : String;
begin
     txt:='';
     EditTotSims_prev_val := Tot_Sims;
     Val(EditTotSims.Text,EditTotSims_cur_val,Code);

     if (code <> 0) and (EditTotSims.Text <> '') then
        begin
             MessageDlg('Only whole positive numeric values.', mtError, [mbOk],0);
             Str(Tot_Sims,txt);
             EditTotSims.Text := txt;
             EditTotSims.SetFocus;
        end else
            begin
                 if (EditTotSims_cur_val <= 1) then
                    begin
                         Tot_Sims := 1;
                         str(1,txt);
                         EditTotSims.Text := txt;
                    end;

                 if (EditTotSims_cur_val > Max_Tot_Sims) then
                    begin
                         Tot_Sims := Max_Tot_Sims;
                         str(max_tot_sims,txt);
                         EditTotSims.Text := txt;
                    end;

                 if (EditTotSims_cur_val > 1) and
                    (EditTotSims_cur_val <= Max_Tot_Sims) then
                    Tot_Sims := EditTotSims_cur_val;
            end;

     if EditTotSims_cur_val <> EditTotSims_prev_val then
        begin
             JustSaved := False;
             EditTotSims.Color := clYellow
        end else
            EditTotSims.Color := clWhite;
end;

procedure TForm1.EditMessChange(Sender: TObject);
var
   i : Byte;
begin
     EditMessChange_prev_txt := mess[st];
     EditMessChange_cur_txt := EditMess.Text;

     for i := 1 to Length(EditMessChange_cur_txt) do
       if (Copy(EditMessChange_cur_txt,i,1) = '\') or
          (Copy(EditMessChange_cur_txt,i,1) = '|') or
          (Copy(EditMessChange_cur_txt,i,1) = '*') or
          (Copy(EditMessChange_cur_txt,i,1) = ':') or
          (Copy(EditMessChange_cur_txt,i,1) = '"') then
         begin
             MessageDlg('Illegal character(s).',
                         mtError, [mbOk],0);

             EditMess.Text := EditMessChange_prev_txt;
             EditMess.SetFocus;
         end else
           begin
             Mess[st] := EditMessChange_cur_txt;

             if EditMessChange_cur_txt <> EditMessChange_prev_txt then
               begin
                 JustSaved := False;
                 EditMess.Color := clYellow
               end else
                  EditMess.Color := clwhite;
           end;

  BuildHint(sender);
end;


procedure TForm1.EditNetFileNameChange(Sender: TObject);
var
   i : Byte;
begin
     EditNetFileName_prev_txt := Net_FileName[st];
     EditNetFileName_cur_txt := EditNetFileName.Text;

     for i := 1 to Length(EditNetFileName_cur_txt) do
       if (Copy(EditNetFileName_cur_txt,i,1) = '|') or
          (Copy(EditNetFileName_cur_txt,i,1) = '*') or
          (Copy(EditNetFileName_cur_txt,i,1) = '"') then
         begin
             MessageDlg('Illegal character(s).',
                         mtError, [mbOk],0);

             EditNetFileName.Text := EditNetFileName_prev_txt;
             EditNetFileName.SetFocus;
         end else
           begin
             Net_FileName[st] := EditNetFileName.Text;

             if EditNetFileName_cur_txt <> EditNetFileName_prev_txt then
               begin
                  JustSaved := False;
                  EditNetFileName.Color := clYellow
               end else
                   EditNetFileName.Color := clwhite;
           end;

  BuildHint(sender);
end;


procedure TForm1.EditProcFileNameChange(Sender: TObject);
Var
   i : Byte;
begin
     EditProcFileName_prev_txt := Sch_FileName[st];
     EditProcFileName_cur_txt := EditProcFileName.Text;

     for i := 1 to Length(EditProcFileName_cur_txt) do
       if (Copy(EditProcFileName_cur_txt,i,1) = '|') or
          (Copy(EditProcFileName_cur_txt,i,1) = '*') or
          (Copy(EditProcFileName_cur_txt,i,1) = '"') then
         begin
             MessageDlg('Illegal character(s).',
                         mtError, [mbOk],0);

             EditProcFileName.Text := EditProcFileName_prev_txt;
             EditProcFileName.SetFocus;
         end else
           begin
             Sch_Filename[st] := EditProcFileName.Text;

             if EditProcFileName_cur_txt <> EditProcFileName_prev_txt then
               begin
                 JustSaved := False;
                 EditProcFileName.Color := clYellow
               end else
                 EditProcFileName.Color := clwhite;
           end;

  BuildHint(sender);
end;

procedure TForm1.ConstInitWgtBttnClick(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     JustSaved := False;

     If ConstInitWgtBttn.Checked then
        begin
             Rst_Wgts[st] := 1;
             Rst_Wgts_Chkd_Bttn[st] := 1;
             EditConstInitWgt.Enabled := True;
             EditMinRandInitWgt.Enabled := False;
             EditMaxRandInitWgt.Enabled := False;
             MinRandInitWgtLabel.Enabled := False;
             MaxRandInitWgtLabel.Enabled := False;
        end;

  BuildHint(sender);
end;

procedure TForm1.RandInitWgtBttnClick(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     JustSaved := False;

     If RandInitWgtBttn.Checked then
        begin
             Rst_Wgts[st] := -1;
             Rst_Wgts_Chkd_Bttn[st] := 2;
             EditConstInitWgt.Enabled := False;
             EditMinRandInitWgt.Enabled := True;
             EditMaxRandInitWgt.Enabled := True;
             MinRandInitWgtLabel.Enabled := True;
             MaxRandInitWgtLabel.Enabled := True;
        end;

  BuildHint(sender);
end;

procedure TForm1.NoResetWgtBttnClick(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     JustSaved := False;

     If NoResetWgtBttn.Checked then
        begin
             Rst_Wgts[st] := 0;
             Rst_Wgts_Chkd_Bttn[st] := 3;
             EditConstInitWgt.Enabled := False;
             EditMinRandInitWgt.Enabled := False;
             EditMaxRandInitWgt.Enabled := False;
             MinRandInitWgtLabel.Enabled := False;
             MaxRandInitWgtLabel.Enabled := False;
        end;

  BuildHint(sender);
end;

procedure TForm1.EditConstInitWgtChange(Sender: TObject);
var
   code : Integer;
begin
   EditConstInitWgt_prev_val := Const_Init_Wgts[st];
   Val(EditConstInitWgt.Text,EditConstInitWgt_cur_val,Code);

   if (Rst_Wgts[st] = 1) or (Rst_Wgts[st] = -1) then
     if ((code <> 0) or (EditConstInitWgt.Text = '.')) and
         (EditConstInitWgt.Text <> '') then
       begin
          MessageDlg('Only numbers between 0 and 1.', mtError, [mbOk],0);
          EditConstInitWgt.Text := Const_Init_Wgts_Str[st];
          EditConstInitWgt.SetFocus;
       end else
          begin
             if (EditConstInitWgt_cur_val < 0) then
               begin
                   EditConstInitWgt.Text := '0';
                   EditConstInitWgt_cur_val := 0;
               end else
                   if (EditConstInitWgt_cur_val > 1) then
                     begin
                         EditConstInitWgt.Text := '1';
                         EditConstInitWgt_cur_val := 1;
                     end;

             Const_Init_Wgts[st] := EditConstInitWgt_cur_val;
             Const_Init_Wgts_Str[st] := EditConstInitWgt.Text;
          end;

   if EditConstInitWgt_cur_val <> EditConstInitWgt_prev_val then
      begin
           JustSaved := False;
           EditConstInitWgt.Color := clYellow
      end else
          EditConstInitWgt.Color := clwhite;

  BuildHint(sender);
end;

procedure TForm1.EditMinRandInitWgtChange(Sender: TObject);
var
   code : Integer;
begin
   EditMinRandInitWgt_prev_val := Min_Rand_Init_Wgts[st];
   Val(EditMinRandInitWgt.Text,EditMinRandInitWgt_cur_val,Code);

   if ((code <> 0) or (EditMinRandInitWgt.Text = '.')) and
      (EditMinRandInitWgt.Text <> '') then
       begin
          MessageDlg('Only numbers between 0 and 1.', mtError, [mbOk],0);
          EditMinRandInitWgt.Text := Min_Rand_Init_Wgts_Str[st];
          EditMinRandInitWgt.SetFocus;
       end else
           if EditMinRandInitWgt_cur_val >= Max_Rand_Init_Wgts[st] then
              begin
                   MessageDlg('Only numbers smaller than maximum value.',
                   mtError, [mbOk],0);
                   EditMinRandInitWgt.Text := Min_Rand_Init_Wgts_Str[st];
                   EditMinRandInitWgt.SetFocus;
              end else
                  begin
                       if (EditMinRandInitWgt_cur_val < 0) then
                          begin
                               EditMinRandInitWgt.Text := '0';
                               EditMinRandInitWgt_cur_val := 0;
                          end;

                       if (EditMinRandInitWgt_cur_val > 1) then
                          begin
                               EditMinRandInitWgt.Text := '1';
                               EditMinRandInitWgt_cur_val := 1;
                          end;

                       Min_Rand_Init_Wgts[st] := EditMinRandInitWgt_cur_val;
                       Min_Rand_Init_Wgts_Str[st] := EditMinRandInitWgt.Text;
                  end;

   if EditMinRandInitWgt_cur_val <> EditMinRandInitWgt_prev_val then
      begin
           JustSaved := False;
           EditMinRandInitWgt.Color := clYellow
      end else
          EditMinRandInitWgt.Color := clwhite;

  BuildHint(sender);
end;

procedure TForm1.EditMaxRandInitWgtChange(Sender: TObject);
var
   code : Integer;
begin
   EditMaxRandInitWgt_prev_val := Max_Rand_Init_Wgts[st];
   Val(EditMaxRandInitWgt.Text,EditMaxRandInitWgt_cur_val,Code);

   if ((code <> 0) or (EditMaxRandInitWgt.Text = '.')) and
       (EditMaxRandInitWgt.Text <> '') then
       begin
          MessageDlg('Only numbers between 0 and 1.', mtError, [mbOk],0);
          EditMaxRandInitWgt.Text := Max_Rand_Init_Wgts_Str[st];
          EditMaxRandInitWgt.SetFocus;
       end else
           if EditMaxRandInitWgt_cur_val <= Min_Rand_Init_Wgts[st] then
              begin
                   MessageDlg('Only numbers larger than minimum value.',
                   mtError, [mbOk],0);
                   EditMaxRandInitWgt.Text := Max_Rand_Init_Wgts_Str[st];
                   EditMaxRandInitWgt.SetFocus;
              end else
                  begin
                       if (EditMaxRandInitWgt_cur_val < 0) then
                          begin
                               EditMaxRandInitWgt.Text := '0';
                               EditMaxRandInitWgt_cur_val := 0;
                          end;

                       if (EditMaxRandInitWgt_cur_val > 1) then
                          begin
                               EditMaxRandInitWgt.Text := '1';
                               EditMaxRandInitWgt_cur_val := 1;
                          end;

                       Max_Rand_Init_Wgts[st] := EditMaxRandInitWgt_cur_val;
                       Max_Rand_Init_Wgts_Str[st] := EditMaxRandInitWgt.Text;
                  end;

   if EditMaxRandInitWgt_cur_val <> EditMaxRandInitWgt_prev_val then
      begin
           JustSaved := False;
           EditMaxRandInitWgt.Color := clYellow
      end else
          EditMaxRandInitWgt.Color := clwhite;

  BuildHint(sender);
end;

procedure TForm1.EditNPEListChange(Sender: TObject);
Var
   Obs_NPEs_Str : Array[1..300] of String;
   c, i, j : integer;
   value, code : Integer;
begin
     Tot_Obs_NPEs[st] := 0;

     EditNPEList_prev_txt := Obs_NPE_List[st];
     Obs_NPE_List[st] := EditNPEList.Text;

     i := 0;

     for c := 1 to Length(Obs_NPE_List[st]) do
         begin
              i := i + 1;

              if Copy(Obs_NPE_List[st],i,1) <> ',' then
                 begin
                      val(Copy(Obs_NPE_List[st],i,1),value,code);

                      if code <> 0 then
                         begin
                              Delete(Obs_NPE_List[st],i,1);
                              i := i - 1;
                         end;
                 end;
         end;

     for c := 1 to Length(Obs_NPE_List[st]) do
         Obs_NPEs_Str[c] := Copy(Obs_NPE_List[st],c,1);

     for c := 1 to Length(Obs_NPE_List[st]) do
         if (Obs_NPEs_Str[c] = ',') then
            begin
                 i := 0;

                 while Obs_NPEs_Str[c] = ',' do
                       begin
                            i := i + 1;
                            delete(Obs_NPE_List[st],c,1);
                            Obs_NPEs_Str[c] := Obs_NPEs_Str[c+i];
                       end;

                 if c <= Length(Obs_NPE_List[st]) then
                    Insert(',',Obs_NPE_List[st],c);

                 for j := c to Length(Obs_NPE_List[st]) do
                     Obs_NPEs_Str[j] := Copy(Obs_NPE_List[st],j,1);
            end;

     c := 1;

     while copy(Obs_NPE_List[st],c,1) = ',' do
           c := c + 1;

     Delete(Obs_NPE_List[st],1,c-1);

     c := Length(Obs_NPE_List[st]);
     while copy(Obs_NPE_List[st],c,1) = ',' do
           begin
                Delete(Obs_NPE_List[st],c,1);
                c := c - 1;
           end;

     EditNPEList.Text := Obs_NPE_List[st];
     EditNPEList_cur_txt := EditNPEList.Text;

     if EditNPEList.Text <> '' then
       begin
         for c:= 1 to Length(EditNPEList.Text) do
            if copy(EditNPEList.Text,c,1) = ',' then
               Tot_Obs_NPEs[st] := Tot_Obs_NPEs[st] + 1;

         Tot_Obs_NPEs[st] := Tot_Obs_NPEs[st] + 1;
       end else
         Tot_Obs_NPEs[st] := 0;

     if EditNPEList_cur_txt <> EditNPEList_prev_txt then
      begin
           JustSaved := False;
           EditNPEList.Color := clYellow
      end else
          EditNPEList.Color := clwhite;

  BuildHint(sender);
end;


procedure TForm1.EditTSListChange(Sender: TObject);
Var
   Obs_ts_Str : Array[1..2500] of ShortString;
   c, i, j : integer;
   value, code : Integer;
begin
     Tot_Obs_TimeSteps[st] := 0;

     EditTSList_prev_txt := Obs_ts_List[st];
     Obs_ts_List[st] := EditTSList.Text;

     i := 0;

     for c := 1 to Length(Obs_ts_List[st]) do
         begin
              i := i + 1;

              if Copy(Obs_ts_List[st],i,1) <> ',' then
                 begin
                      val(Copy(Obs_ts_List[st],i,1),value,code);

                      if code <> 0 then
                         begin
                              Delete(Obs_ts_List[st],i,1);
                              i := i - 1;
                         end;
                 end;
         end;

     for c := 1 to Length(Obs_ts_List[st]) do
         Obs_ts_Str[c] := Copy(Obs_ts_List[st],c,1);

     for c := 1 to Length(Obs_ts_List[st]) do
         if (Obs_ts_Str[c] = ',') then
            begin
                 i := 0;

                 while Obs_ts_Str[c] = ',' do
                       begin
                            i := i + 1;
                            delete(Obs_ts_List[st],c,1);
                            Obs_ts_Str[c] := Obs_ts_Str[c+i];
                       end;

                 if c <= Length(Obs_ts_List[st]) then
                    Insert(',',Obs_ts_List[st],c);

                 for j := c to Length(Obs_ts_List[st]) do
                     Obs_ts_Str[j] := Copy(Obs_ts_List[st],j,1);
            end;

     c := 1;

     while copy(Obs_ts_List[st],c,1) = ',' do
           c := c + 1;

     Delete(Obs_ts_List[st],1,c-1);

     c := Length(Obs_ts_List[st]);
     while copy(Obs_ts_List[st],c,1) = ',' do
           begin
                Delete(Obs_ts_List[st],c,1);
                c := c - 1;
           end;

     EditTSList.Text := Obs_ts_List[st];
     EditTSList_cur_txt := EditTSList.Text;

     if EditTSList.Text <> '' then
       begin
         for c:= 1 to Length(EditTSList.Text) do
            if copy(EditTSList.Text,c,1) = ',' then
               Tot_Obs_TimeSteps[st] := Tot_Obs_TimeSteps[st] + 1;

         Tot_Obs_TimeSteps[st] := Tot_Obs_TimeSteps[st] + 1;
       end else
         Tot_Obs_TimeSteps[st] := 0;

     if EditTSList_cur_txt <> EditTSList_prev_txt then
      begin
           JustSaved := False;
           EditTSList.Color := clYellow
      end else
          EditTSList.Color := clwhite;

  BuildHint(sender);
end;


procedure TForm1.EditOpCritChange(Sender: TObject);
var
   code : Integer;
begin
     EditOpCrit_prev_val := Op[st];
     Val(EditOpCrit.Text,EditOpCrit_cur_val,Code);

     if Op_Crit[st] then
        if (code <> 0) or (EditOpCrit.Text = '.') then
           begin
              MessageDlg('Only values between 0 and 1.', mtError, [mbOk],0);
              EditOpCrit.Text := Op_Str[st];
              EditOpCrit.SetFocus;
           end else
               begin
                    if (EditOpCrit_cur_val < 0) then
                       begin
                            EditOpCrit.Text := '0';
                            EditOpCrit_cur_val := 0;
                       end else
                           if (EditOpCrit_cur_val > 1) then
                              begin
                                   EditOpCrit.Text := '1';
                                   EditOpCrit_cur_val := 1;
                              end;

                    Op[st] := EditOpCrit_cur_val;
                    Op_Str[st] := EditOpCrit.Text;
               end;

     if EditOpCrit_cur_val <> EditOpCrit_prev_val then
      begin
           JustSaved := False;
           EditOpCrit.Color := clYellow
      end else
          EditOpCrit.Color := clwhite;

  BuildHint(sender);
end;

procedure TForm1.EditCRCritChange(Sender: TObject);
var
   code, F, D : Integer;
begin
     EditCRCrit_prev_val := CR[st];
     Val(EditCRCrit.Text,EditCRCrit_cur_val,Code);

     if CR_Crit[st] then
        if (code <> 0) or (EditCRCrit.Text = '.') then
           begin
              MessageDlg('Only values between 0 and 1.', mtError, [mbOk],0);
              EditCRCrit.Text := CR_Str[st];
              EditCRCrit.SetFocus;
           end else
               begin
                    if (EditCRCrit_cur_val < 0) then
                       begin
                            EditCRCrit.Text := '0';
                            EditCRCrit_cur_val := 0;
                       end else
                           if (EditCRCrit_cur_val > 1) then
                              begin
                                   EditCRCrit.Text := '1';
                                   EditCRCrit_cur_val := 1;
                              end;

                    CR[st] := EditCRCrit_cur_val;
                    CR_Str[st] := EditCRCrit.Text;
               end;

     if EditCRCrit_cur_val <> EditCRCrit_prev_val then
      begin
           JustSaved := False;
           EditCRCrit.Color := clYellow
      end else
          EditCRCrit.Color := clwhite;

  BuildHint(sender);
end;

procedure TForm1.EditCR2CritChange(Sender: TObject);
var
   code, F, D : Integer;
begin
     EditCR2Crit_prev_val := CR[st];
     Val(EditCR2Crit.Text,EditCR2Crit_cur_val,Code);

     if CR2_Crit[st] then
        if (code <> 0) or (EditCR2Crit.Text = '.') then
           begin
              MessageDlg('Only values between 0 and 1.', mtError, [mbOk],0);
              EditCR2Crit.Text := CR2_Str[st];
              EditCR2Crit.SetFocus;
           end else
               begin
                    if (EditCR2Crit_cur_val < 0) then
                       begin
                            EditCR2Crit.Text := '0';
                            EditCR2Crit_cur_val := 0;
                       end else
                           if (EditCR2Crit_cur_val > 1) then
                              begin
                                   EditCR2Crit.Text := '1';
                                   EditCR2Crit_cur_val := 1;
                              end;

                    CR2[st] := EditCR2Crit_cur_val;
                    CR2_Str[st] := EditCR2Crit.Text;
               end;

     if EditCR2Crit_cur_val <> EditCR2Crit_prev_val then
      begin
           JustSaved := False;
           EditCR2Crit.Color := clYellow
      end else
          EditCR2Crit.Color := clwhite;

  BuildHint(sender);
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
     JustSaved := False;
     clear_cur_sim_panel(sender);
end;


procedure TForm1.NextBttnClick(Sender: TObject);
var
    txt : string[3];
    std : boolean;
    s : integer;
    code : Integer;
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     EditTotSimTypesChange(sender);
     EditTotSimsChange(sender);

     EditMessChange(sender);

     EditNetFileNameChange(sender);
     EditProcFileNameChange(sender);

     EditConstInitWgtChange(sender);
     EditMinRandInitWgtChange(sender);
     EditMaxRandInitWgtChange(sender);

     EditNPEListChange(sender);
     EditTSListChange(sender);

     EditCRCritChange(sender);
     EditCR2CritChange(sender);
     EditOpCritChange(sender);

     st := st + 1;
     BuildHint(sender);

     EditTotSimTypes.Color := clWhite;
     EditTotSims.Color := clWhite;

     EditMess.Color := clWhite;

     EditNetFileName.Color := clWhite;
     EditProcFileName.Color := clWhite;

     EditConstInitWgt.Color := clWhite;
     EditMinRandInitWgt.Color := clWhite;
     EditMaxRandInitWgt.Color := clWhite;

     EditNPEList.Color := clWhite;
     EditTSList.Color := clWhite;

     EditCRCrit.Color := clWhite;
     EditCR2Crit.Color := clWhite;
     EditOpCrit.Color := clWhite;

     Str(st,txt);

     StaticText8.Caption := txt;

     EditMess.Text := Mess[st];

     EditNetFileName.Text := Net_Filename[st];
     EditProcFileName.Text := Sch_Filename[st];

     EditConstInitWgt.Text := Const_Init_Wgts_Str[st];
     EditMinRandInitWgt.Text := Min_Rand_Init_Wgts_Str[st];
     EditMaxRandInitWgt.Text := Max_Rand_Init_Wgts_Str[st];

     EditNPEList.Text := Obs_NPE_List[st];
     EditTSList.Text := Obs_ts_List[st];

     EditOpCrit.Text := Op_Str[st];
     EditCRCrit.Text := CR_Str[st];
     EditCR2Crit.Text := CR2_Str[st];

     if st = tot_sim_types then
        begin
             NextBttn.Enabled := False;
             BackBttn.Enabled := True;
        end;

     if (st < Tot_Sim_Types) and (st > 1) then
        begin
             NextBttn.Enabled := True;
             BackBttn.Enabled := true;
        end;

     case Rst_Wgts_Chkd_Bttn[st] of
          1: begin
                  ConstInitWgtBttn.Checked := True;
                  EditConstInitWgt.Enabled := True;
                  EditMinRandInitWgt.Enabled := False;
                  EditMaxRandInitWgt.Enabled := False;
                  MinRandInitWgtLabel.Enabled := False;
                  MaxRandInitWgtLabel.Enabled := False;
             end;

          2: begin
                  RandInitWgtBttn.Checked := True;
                  EditConstInitWgt.Enabled := False;
                  EditMinRandInitWgt.Enabled := True;
                  EditMaxRandInitWgt.Enabled := True;
                  MinRandInitWgtLabel.Enabled := True;
                  MaxRandInitWgtLabel.Enabled := True;
             end;

          3: begin
                  NoResetWgtBttn.Checked := True;
                  EditConstInitWgt.Enabled := False;
                  EditMinRandInitWgt.Enabled := False;
                  EditMaxRandInitWgt.Enabled := False;
                  MinRandInitWgtLabel.Enabled := False;
                  MaxRandInitWgtLabel.Enabled := False;
             end;
     end{case};

     ActCheckBox.Checked := StoreActs[st];
     WgtCheckBox.Checked := StoreWgts[st];

     If (StoreActs[st]) or (StoreWgts[st]) then
        begin
             NPELabel.Enabled := True;
             EditNPEList2.Text := EditNPEList.Text;
             TSLabel1.Enabled := True;
             EditTSList2.Text := EditTSList.Text;
        end;

     OpCheckBox.Checked := Op_Crit[st];
     CRCheckBox.Checked := CR_Crit[st];
     CR2CheckBox.Checked := CR2_Crit[st];

     If (Op_Crit[st]) or (CR_Crit[st]) then
        begin
             TSLabel2.Enabled := True;
             EditTSList3.Text := EditTSList.Text;
        end;

     If Op_Crit[st] then
        EditOpCrit.Enabled := True
     else
        EditOpCrit.Enabled := False;

     If CR_Crit[st] then
       EditCRCrit.Enabled := True
     else
       EditCRCrit.Enabled := False;

     If CR2_Crit[st] then
       EditCR2Crit.Enabled := True
     else
       EditCR2Crit.Enabled := False;

     if (EditNetFileName.Focused) or (EditProcFileName.Focused) then
        Browse.Enabled := True
     else
        Browse.Enabled := False;
end;


procedure TForm1.BackBttnClick(Sender: TObject);
var
   txt : string[3];
   std : boolean;
   s : integer;
   Code : Integer;
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     EditTotSimTypesChange(sender);
     EditTotSimsChange(sender);

     EditMessChange(sender);

     EditNetFileNameChange(sender);
     EditProcFileNameChange(sender);

     EditConstInitWgtChange(sender);
     EditMinRandInitWgtChange(sender);
     EditMaxRandInitWgtChange(sender);

     EditNPEListChange(sender);
     EditTSListChange(sender);

     EditCRCritChange(sender);
     EditCR2CritChange(sender);
     EditOpCritChange(sender);

     st := st - 1;
     BuildHint(sender);

     EditTotSimTypes.Color := clWhite;
     EditTotSims.Color := clWhite;

     EditMess.Color := clWhite;

     EditNetFileName.Color := clWhite;
     EditProcFileName.Color := clWhite;

     EditConstInitWgt.Color := clWhite;
     EditMinRandInitWgt.Color := clWhite;
     EditMaxRandInitWgt.Color := clWhite;

     EditNPEList.Color := clWhite;
     EditTSList.Color := clWhite;

     EditCRCrit.Color := clWhite;
     EditCR2Crit.Color := clWhite;
     EditOpCrit.Color := clWhite;

     Str(st,txt);

     if st > 1 then
        StaticText8.Caption := txt
     else
        StaticText8.Caption := '1';

     EditMess.Text := Mess[st];

     EditNetFileName.Text := Net_Filename[st];
     EditProcFileName.Text := Sch_Filename[st];

     EditConstInitWgt.Text := Const_Init_Wgts_Str[st];
     EditMinRandInitWgt.Text := Min_Rand_Init_Wgts_Str[st];
     EditMaxRandInitWgt.Text := Max_Rand_Init_Wgts_Str[st];

     EditNPEList.Text := Obs_NPE_List[st] ;
     EditTSList.Text := Obs_ts_List[st];

     EditCRCrit.Text := CR_Str[st];
     EditCR2Crit.Text := CR2_Str[st];
     EditOpCrit.Text := Op_Str[st];

     if st = 1 then
        begin
             NextBttn.Enabled := true;
             BackBttn.Enabled := false;
        end;

     if (st < Tot_Sim_Types) and (st > 1) then
        begin
             NextBttn.Enabled := True;
             BackBttn.Enabled := true;
        end;

     case Rst_Wgts_Chkd_Bttn[st] of
          1: begin
                  ConstInitWgtBttn.Checked := True;
                  EditConstInitWgt.Enabled := True;
                  EditMinRandInitWgt.Enabled := False;
                  EditMaxRandInitWgt.Enabled := False;
                  MinRandInitWgtLabel.Enabled := False;
                  MaxRandInitWgtLabel.Enabled := False;
             end;

          2: begin
                  RandInitWgtBttn.Checked := True;
                  EditConstInitWgt.Enabled := False;
                  EditMinRandInitWgt.Enabled := True;
                  EditMaxRandInitWgt.Enabled := True;
                  MinRandInitWgtLabel.Enabled := True;
                  MaxRandInitWgtLabel.Enabled := True;
             end;

          3: begin
                  NoResetWgtBttn.Checked := True;
                  EditConstInitWgt.Enabled := False;
                  EditMinRandInitWgt.Enabled := False;
                  EditMaxRandInitWgt.Enabled := False;
                  MinRandInitWgtLabel.Enabled := False;
                  MaxRandInitWgtLabel.Enabled := False;
             end;
     end{case};

     ActCheckBox.Checked := StoreActs[st];
     WgtCheckBox.Checked := StoreWgts[st];

     If (StoreActs[st]) or (StoreWgts[st]) then
        begin
             NPELabel.Enabled := True;
             EditNPEList2.Text := EditNPEList.Text;
             TSLabel1.Enabled := True;
             EditTSList2.Text := EditTSList.Text;
        end;

     OpCheckBox.Checked := Op_Crit[st];
     CRCheckBox.Checked := CR_Crit[st];
     CR2CheckBox.Checked := CR2_Crit[st];

     If (Op_Crit[st]) or (CR_Crit[st]) then
        begin
             TSLabel2.Enabled := True;
             EditTSList3.Text := EditTSList.Text;
        end;

     If Op_Crit[st] then
       EditOpCrit.Enabled := True
     else
       EditOpCrit.Enabled := False;

     If CR_Crit[st] then
       EditCRCrit.Enabled := True
     else
       EditCRCrit.Enabled := False;

     If CR2_Crit[st] then
       EditCR2Crit.Enabled := True
     else
       EditCR2Crit.Enabled := False;

     if (EditNetFileName.Focused) or (EditProcFileName.Focused) then
        Browse.Enabled := True
     else
        Browse.Enabled := False;
end;


procedure TForm1.EditGoToChange(Sender: TObject);
Var
   code, value : Integer;
   cap : String[3];
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     val(EditGoTo.Text,value,code);

     if code <> 0 then
        EditGoTo.Text := ''
     else
         begin
              if value <= 1 then
                 begin
                      st := 1;

                      EditGoTo.Text := '1';
                      StaticText8.Caption := '1';

                      if tot_sim_types > 1 then
                         NextBttn.Enabled := True
                      else
                          NextBttn.Enabled := False;

                      BackBttn.Enabled := False;
                 end;

                 if (value > 1) and (value <= Tot_Sim_Types) then
                    begin
                         st := value;
                         Str(st,cap);
                         StaticText8.Caption := cap;

                         if st = Tot_Sim_Types then
                            begin
                                 NextBttn.Enabled := False;
                                 BackBttn.Enabled := True;
                            end;

                         if (st > 1) and (st < Tot_Sim_Types) then
                            begin
                                 NextBttn.Enabled := True;
                                 BackBttn.Enabled := True;
                            end;
                    end;

                 if value >= Tot_Sim_Types then
                    begin
                         value := tot_sim_types;
                         st := value;
                         Str(value,cap);
                         EditGoTo.Text := cap;
                         StaticText8.Caption := cap;
                         NextBttn.Enabled := False;
                    end;

                    EditMess.Text := Mess[st];

                    EditNetFileName.Text := Net_Filename[st];
                    EditProcFileName.Text := Sch_Filename[st];

                    EditConstInitWgt.Text := Const_Init_Wgts_Str[st];
                    EditMinRandInitWgt.Text := Min_Rand_Init_Wgts_Str[st];
                    EditMaxRandInitWgt.Text := Max_Rand_Init_Wgts_Str[st];

                    EditNPEList.Text := Obs_NPE_List[st] ;
                    EditTSList.Text := Obs_ts_List[st];

                    EditCRCrit.Text := CR_Str[st];
                    EditCR2Crit.Text := CR2_Str[st];
                    EditOpCrit.Text := Op_Str[st];

                    case Rst_Wgts_Chkd_Bttn[st] of
                         1: begin
                                 ConstInitWgtBttn.Checked := True;
                                 EditConstInitWgt.Enabled := True;
                                 EditMinRandInitWgt.Enabled := False;
                                 EditMaxRandInitWgt.Enabled := False;
                                 MinRandInitWgtLabel.Enabled := False;
                                 MaxRandInitWgtLabel.Enabled := False;
                            end;

                         2: begin
                                 RandInitWgtBttn.Checked := True;
                                 EditConstInitWgt.Enabled := False;
                                 EditMinRandInitWgt.Enabled := True;
                                 EditMaxRandInitWgt.Enabled := True;
                                 MinRandInitWgtLabel.Enabled := True;
                                 MaxRandInitWgtLabel.Enabled := True;
                            end;

                         3: begin
                                 NoResetWgtBttn.Checked := True;
                                 EditConstInitWgt.Enabled := False;
                                 EditMinRandInitWgt.Enabled := False;
                                 EditMaxRandInitWgt.Enabled := False;
                                 MinRandInitWgtLabel.Enabled := False;
                                 MaxRandInitWgtLabel.Enabled := False;
                            end;
                    end{case};

                    ActCheckBox.Checked := StoreActs[st];
                    WgtCheckBox.Checked := StoreWgts[st];

                    OpCheckBox.Checked := Op_Crit[st];
                    CRCheckBox.Checked := CR_Crit[st];

                    If Op_Crit[st] then
                       EditOpCrit.Enabled := True
                    else
                        EditOpCrit.Enabled := False;

                    If CR_Crit[st] then
                       EditCRCrit.Enabled := True
                    else
                        EditCRCrit.Enabled := False;

                    If CR2_Crit[st] then
                       EditCR2Crit.Enabled := True
                    else
                        EditCR2Crit.Enabled := False;
         end;

     BuildHint(sender);

     if (EditNetFileName.Focused) or (EditProcFileName.Focused) then
        Browse.Enabled := True
     else
        Browse.Enabled := False;
end;


procedure TForm1.EditTotSimTypesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditTotSimTypes.Text <> '' then
                      EditTotSimTypes.Color := clYellow
                   else
                       EditTotSimTypes.Color := clWhite;

                   EditTotSimTypesChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;


procedure TForm1.EditTotSimsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditTotSims.Text <> '' then
                      EditTotSims.Color := clYellow
                   else
                       EditTotSims.Color := clWhite;

                   EditTotSimsChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm1.EditCR2CritKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditCR2Crit.Text <> '' then
                      EditCR2Crit.Color := clYellow
                   else
                       EditCR2Crit.Color := clWhite;

                   EditCR2CritChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;


procedure TForm1.EditOpCritKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if EditOpCrit.Text <> '' then
                      EditOpCrit.Color := clYellow
                   else
                       EditOpCrit.Color := clWhite;

                   EditOpCritChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;


procedure TForm1.EditMessKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if (st > 1) and (EditMess.Text = '') then
                      EditMess.Text := Mess[st-1];

                   if EditMess.Text <> '' then
                      EditMess.Color := clYellow;

                   EditMessChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;


procedure TForm1.EditNetFileNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if (st > 1) and (EditNetFileName.Text = '') then
                      EditNetFileName.Text := Net_FileName[st-1];

                   if EditNetFileName.Text <> '' then
                      EditNetFileName.Color := clYellow;

                   EditNetFileNameChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm1.EditProcFileNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if (st > 1) and (EditProcFileName.Text = '') then
                      EditProcFileName.Text := Sch_FileName[st-1];

                   if EditProcFileName.Text <> '' then
                      EditProcFileName.Color := clYellow;

                   EditProcFileNameChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm1.EditConstInitWgtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   txt : String[20];
begin
     Case Key of
          13: begin
                   if (st > 1) and (EditConstInitWgt.Text = '') then
                      begin
                           str(Const_Init_Wgts[st-1],txt);
                           EditConstInitWgt.Text := txt;
                      end;

                   if EditConstInitWgt.Text <> '' then
                      EditConstInitWgt.Color := clYellow;

                   EditConstInitWgtChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm1.EditMinRandtInitWgtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   txt : String[20];
begin
     Case Key of
          13: begin
                   if (st > 1) and (EditMinRandInitWgt.Text = '') then
                      begin
                           str(Min_Rand_Init_Wgts[st-1],txt);
                           EditMinRandInitWgt.Text := txt;
                      end;

                   if EditMinRandInitWgt.Text <> '' then
                      EditMinRandInitWgt.Color := clYellow;

                   EditMinRandInitWgtChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm1.EditMaxRandtInitWgtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   txt : String[20];
begin
     Case Key of
          13: begin
                   if (st > 1) and (EditMaxRandInitWgt.Text = '') then
                      begin
                           str(Max_Rand_Init_Wgts[st-1],txt);
                           EditMaxRandInitWgt.Text := txt;
                      end;

                   if EditMaxRandInitWgt.Text <> '' then
                      EditMaxRandInitWgt.Color := clYellow;

                   EditMaxRandInitWgtChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm1.EditNPEListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if (st > 1) and (EditNPEList.Text = '') then
                      EditNPEList.Text := Obs_NPE_List[st-1];

                   if EditNPEList.Text <> '' then
                      EditNPEList.Color := clYellow;

                   EditNPEListChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm1.EditTSListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: begin
                   if (st > 1) and (EditTSList.Text = '') then
                      EditTSList.Text := Obs_ts_List[st-1];

                   if EditTSList.Text <> '' then
                      EditTSList.Color := clYellow;

                   EditTSListChange(sender);
              end;

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm1.EditGoToKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
          13: EditGoToChange(sender);

          33: if (Tot_Sim_Types > 1) and (st > 1) then
                  BackBttnClick(sender);

          34: if (Tot_Sim_Types > 1) and
                 (st < tot_sim_types) then
                  NextBttnClick(sender);
     end{case};
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
     If not(AllFieldsFilled(sender)) then
       if MessageDlg('Incomplete simulation file. ' +
                     'You can save now and continue later. ' +
                     'However, trying to run this simulation ' +
                     'will result in errors.  Proceed?',
                      mtConfirmation,[mbYes, mbNo],0) = mrYes then
         if SaveDialog1.Execute then
           SaveExpFile(Sender);

     If AllFieldsFilled(sender) then
       if SaveDialog1.Execute then
         SaveExpFile(Sender)
end;


procedure TForm1.SaveExpFile(Sender: TObject);
var
   sim_type, c : integer;
   txt: String;
begin
  EditTotSimTypesChange(sender);
  EditTotSimsChange(sender);

  EditMessChange(sender);

  EditProcFileNameChange(sender);
  EditNetFileNameChange(sender);

  EditConstInitWgtChange(sender);
  EditMinRandInitWgtChange(sender);
  EditMaxRandInitWgtChange(sender);

  EditNPEListChange(sender);
  EditTSListChange(sender);

  EditCRCritChange(sender);
  EditCR2CritChange(sender);
  EditOpCritChange(sender);

  EditTotSimTypes.Color := clWhite;
  EditTotSims.Color := clWhite;

  EditMess.Color := clWhite;

  EditProcFileName.Color := clWhite;
  EditNetFileName.Color := clWhite;

  EditConstInitWgt.Color := clWhite;
  EditMinRandInitWgt.Color := clWhite;
  EditMaxRandInitWgt.Color := clWhite;

  EditNPEList.Color := clWhite;
  EditTSList.Color := clWhite;

  EditCRCrit.Color := clWhite;
  EditCR2Crit.Color := clWhite;
  EditOpCrit.Color := clWhite;

  Exp_FileName := SaveDialog1.FileName;
  AssignFile(Ef,Exp_FileName);

 {$I-}
  ReWrite(Ef);
 {$I+}

  If IOResult <> 0 then
    begin
      MessageDlg('Invalid writing operation. ' +
                 'Target disk is either full or corrupted.',
                  mtError,[mbCancel],0);

      CloseFile(Ef);
      Exit;
    end else
      begin
         Writeln(Ef, Tot_Sim_Types);
         Writeln(Ef, Tot_Sims);
         Writeln(Ef, UpProc);

         For sim_type := 1 to Tot_Sim_Types do
           begin
              Writeln(Ef, Mess[sim_type]);
              Writeln(Ef, Net_FileName[sim_type]);
              Writeln(Ef, Sch_FileName[sim_type]);
              Writeln(Ef, Rst_Wgts[sim_type]);

              Case Rst_Wgts[sim_type] of
                -1: begin
                       Writeln(Ef, Min_Rand_Init_Wgts_Str[sim_type]);
                       Writeln(Ef, Max_Rand_Init_Wgts_Str[sim_type]);
                    end;

                 0: Writeln(Ef);

                 1: Writeln(Ef, Const_Init_Wgts_Str[sim_type]);
              end{case};

              Writeln(Ef, Tot_Obs_NPEs[sim_type]);

              if Tot_Obs_NPEs[sim_type] > 0 then
                begin
                  txt := Obs_NPE_List[sim_type];

                  for c:= 1 to Length(txt) do
                     if copy(txt,c,1) = ',' then
                       begin
                          delete(txt,c,1);
                          insert(' ',txt,c);
                       end;

                  Writeln(Ef, txt);
                end else
                  Writeln(Ef);

              Writeln(Ef, Tot_Obs_TimeSteps[sim_type]);

              if Tot_Obs_TimeSteps[sim_type] > 0 then
                begin
                  txt := Obs_ts_List[sim_type];

                  for c:= 1 to Length(txt) do
                     if copy(txt,c,1) = ',' then
                        begin
                           delete(txt,c,1);
                           insert(' ',txt,c);
                        end;

                  Writeln(Ef, txt);
                end else
                  writeln(Ef);

              If (StoreActs[sim_type]) or (StoreWgts[sim_type])  then
                begin
                  If (StoreActs[sim_type]) then
                     Writeln(Ef,1)
                  else
                     Writeln(Ef,0);

                  If (StoreWgts[sim_type]) then
                     Writeln(Ef,1)
                  else
                     Writeln(Ef,0);
                end else
                  begin
                     Writeln(Ef,0);
                     Writeln(Ef,0);
                  end;

              if (Op_Crit[sim_type]) or (CR_Crit[sim_type]) or
                  (CR2_Crit[sim_type])then
                begin
                  If Op_Crit[sim_type] then
                    begin
                      Writeln(Ef,1);
                      Writeln(Ef,Op_str[sim_type]);
                    end else
                      begin
                        Writeln(Ef,0);
                        Writeln(Ef,0);
                      end;

                  If CR_Crit[sim_type] then
                    begin
                      Writeln(Ef,1);
                      Writeln(Ef,CR_str[sim_type]);
                    end else
                      begin
                        Writeln(Ef,0);
                        Writeln(Ef,0);
                      end;

                  If CR2_Crit[sim_type] then
                    begin
                      Writeln(Ef,1);
                      Writeln(Ef,CR2_str[sim_type]);
                    end else
                      begin
                        Writeln(Ef,0);
                        Writeln(Ef,0);
                      end;
                end else
                  begin
                     Writeln(Ef,0);
                     Writeln(Ef,0);
                     Writeln(Ef,0);
                     Writeln(Ef,0);
                  end;
           end;

         Form1.Caption := 'Simulation file - ' + SaveDialog1.FileName;
         CloseFile(Ef);
         JustSaved := True;
      end;
end;


procedure TForm1.Open1Click(Sender: TObject);
begin
  if JustSaved then
    begin
      if OpenDialog1.Execute then
         OpenExpfile(sender);
    end else
      case MessageDlg('Save current simulation file?',mtConfirmation,
                      [mbYes, mbNo, mbCancel],0) of
        mrYes : begin
                  Save1Click(sender);

                  if OpenDialog1.Execute then
                    OpenExpfile(sender);
                end;

        mrNo : begin
                  if OpenDialog1.Execute then
                    OpenExpfile(sender);
                end;
     end{case};
end;


procedure TForm1.ReadExpFile(Sender: TObject);
var
   i, sim_type, tst, c : integer;
   txt, str1 : String[255];
   CR_c, CR2_c, R_c, s_a, s_w : 0..1;
   Code : Integer;
Begin
 {$I-}
  Readln(Ef, Tot_Sim_Types);
 {$I+}

  if IOResult <> 0 then
    begin
      MessageDlg('Invalid number of conditions.',mtError,[mbCancel],0);
      CloseFile(Ef);
      Exit;
    end;

  if tot_sim_types > Max_sim_types then
    begin
      MessageDlg('Too many conditions.',mtError,[mbCancel],0);
      CloseFile(Ef);
      Exit;
    end;

  {$I-}
   Readln(Ef, Tot_Sims);
  {$I+}

  if IOResult <> 0 then
    begin
      MessageDlg('Invalid number of replications.',mtError,[mbCancel],0);
      CloseFile(Ef);
      Exit;
    end;

  if tot_sims > Max_tot_sims then
    begin
      MessageDlg('Too many replications.',mtError,[mbCancel],0);
      CloseFile(Ef);
      Exit;
    end;

  for tst := 1 to Tot_Sim_Types do
     begin
       Net_FileName_I[tst] := '';
       Net_FileName_F[tst] := '';
       Sch_FileName[tst] := '';
     end;

  Readln(Ef, UpProc);
  If UpProc = 'RndAsync' then RndAsync.Checked := True;
  If UpProc = 'SeqAsync' then SeqAsync.Checked := True;
  If UpProc = 'RndSync' then RndSync.Checked := True;
  If UpProc = 'SeqSync' then SeqSync.Checked := True;

  For sim_type := 1 to Tot_Sim_Types do
    begin
      Readln(Ef, Mess[sim_type]);
      Readln(Ef, Net_FileName[sim_type]);
      Readln(Ef, Sch_FileName[sim_type]);

     {$I-}
      Readln(Ef, Rst_Wgts[sim_type]);
     {$I+}

      if (IOResult <> 0) or
         (Rst_Wgts[sim_type] > 1) or
         (Rst_Wgts[sim_type] < -1) then
        begin
          MessageDlg('Invalid flag for reseting weights.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

      Case Rst_Wgts[sim_type] of
        -1 : Rst_Wgts_Chkd_Bttn[sim_type] := 2;
         0 : Rst_Wgts_Chkd_Bttn[sim_type] := 3;
         1 : Rst_Wgts_Chkd_Bttn[sim_type] := 1;
      end{case};

      Case Rst_Wgts[sim_type] of
          -1: begin
                   Readln(Ef, Min_Rand_Init_Wgts_Str[sim_type]);
                   Readln(Ef, Max_Rand_Init_Wgts_Str[sim_type]);
                   Val(Min_Rand_Init_Wgts_Str[sim_type],
                       Min_Rand_Init_Wgts[sim_type],code);
                   Val(Max_Rand_Init_Wgts_Str[sim_type],
                       Max_Rand_Init_Wgts[sim_type],code);
              end;

           0: Readln(Ef);

           1: begin
                   Readln(Ef, Const_Init_Wgts_Str[sim_type]);
                   Val(Const_Init_Wgts_Str[sim_type],
                       Const_Init_Wgts[sim_type],code);
              end;
      end{case};

      if (code <> 0) or
         (const_init_wgts[sim_type] > 1) or
         (const_init_wgts[sim_type] < 0) or
         (min_rand_init_wgts[sim_type] > 1) or
         (min_rand_init_wgts[sim_type] < 0) or
         (max_rand_init_wgts[sim_type] > 1) or
         (max_rand_init_wgts[sim_type] < 0) then
        begin
          MessageDlg('Invalid value for initial weights.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

     {$I-}
      Readln(Ef, Tot_Obs_NPEs[sim_type]);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid number of units.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

      if tot_obs_npes[sim_type] > Max_NPEs then
        begin
          MessageDlg('Too many observed units.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

      str1 := '';
      Obs_NPE_List[sim_type] := '';

      if Tot_Obs_NPEs[sim_type] > 0 then
         begin
           for i := 1 to Tot_Obs_NPEs[sim_type] do
             begin
              {$I-}
               Read(Ef, Obs_NPE[sim_type,i]);
              {$I+}

               if IOResult <> 0 then
                 begin
                   MessageDlg('Invalid value for an unit number.',mtError,[mbCancel],0);
                   CloseFile(Ef);
                   Exit;
                 end;

                 str(Obs_NPE[sim_type,i],txt);
                 str1 := str1 + txt + ',';
             end;

           readln(Ef);
        end else
          readln(Ef);

      delete(str1,length(str1),1);
      Obs_NPE_List[sim_type] := str1;

     {$I-}
      Readln(Ef, Tot_Obs_TimeSteps[sim_type]);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid number of time-steps.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

      if tot_obs_TimeSteps[sim_type] > Max_time_steps then
        begin
          MessageDlg('Too many time_steps.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

      str1 := '';
      Obs_ts_List[sim_type] := '';

      if Tot_Obs_TimeSteps[sim_type] > 0 then
         begin
           for i := 1 to Tot_Obs_TimeSteps[sim_type] do
             begin
              {$I-}
               Read(Ef, Obs_ts[sim_type,i]);
              {$I+}

               if IOResult <> 0 then
                 begin
                   MessageDlg('Invalid value for a time-step.',mtError,[mbCancel],0);
                   CloseFile(Ef);
                   Exit;
                 end;

               if Obs_ts[sim_type,i] > Max_Time_Steps then
                 begin
                   MessageDlg('Time-step too large.',mtError,[mbCancel],0);
                   CloseFile(Ef);
                   Exit;
                 end;

                 str(Obs_ts[sim_type,i],txt);
                 str1 := str1 + txt + ',';
             end;

           readln(Ef);
        end else
          readln(Ef);

      delete(str1,length(str1),1);
      Obs_ts_List[sim_type] := str1;

     {$I-}
      Readln(Ef, s_a);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid flag for storing activations.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

     {$I-}
      Readln(Ef, s_w);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid flag for storing weights.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

      case s_a of
        0: StoreActs[sim_type] := False;
        1: StoreActs[sim_type] := True;
      end{case};

      case s_w of
        0: StoreWgts[sim_type] := False;
        1: StoreWgts[sim_type] := True;
      end{case};

     {$I-}
      Readln(Ef, R_c);
     {$I+}

      if IOResult <> 0 then
        begin
          MessageDlg('Invalid flag for R response criterion.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

      Case R_c of
        0: Op_Crit[sim_type] := False;
        1: Op_Crit[sim_type] := True;
      end{case};

      Readln(Ef,Op_Str[sim_type]);

     {$I-}
      Readln(Ef, CR_c);
     {$I+}

      if (IOResult <> 0) then
        begin
          MessageDlg('Invalid flag for R*2 response criterion.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;

      Case CR_c of
        0: CR_Crit[sim_type] := False;
        1: CR_Crit[sim_type] := True;
      end{case};

      Readln(Ef,CR_Str[sim_type]);

     {$I-}
      Readln(Ef, CR2_c); (* read second CR/UR criterion: 10/03/2020 *)
     {$I+}

      if (IOResult <> 0) then
        begin
          MessageDlg('Invalid flag for R*2 response criterion.',mtError,[mbCancel],0);
          CloseFile(Ef);
          Exit;
        end;
        
      Case CR2_c of
        0: CR2_Crit[sim_type] := False;
        1: CR2_Crit[sim_type] := True;
      end{case};

      Readln(Ef,CR2_Str[sim_type]);
    end;

  BuildHint(sender);

  st := 1;

  Clear_Cur_Sim_Panel(sender);

  if CR_Crit[st] then
    Val(CR_str[st],CR[st],code);

  if Code <> 0 then
    begin
      MessageDlg('Invalid criterion for R1*s.',mtError,[mbCancel],0);
      CloseFile(Ef);
      Exit;
    end;

  if CR2_Crit[st] then
    Val(CR2_str[st],CR2[st],code);

  if Code <> 0 then
    begin
      MessageDlg('Invalid criterion for R2*s.',mtError,[mbCancel],0);
      CloseFile(Ef);
      Exit;
    end;

  if Op_Crit[st] then
    Val(Op_str[st],Op[st],code);

  if Code <> 0 then
    begin
      MessageDlg('Invalid criterion for Rs.',mtError,[mbCancel],0);
      CloseFile(Ef);
      Exit;
    end;

  Panel2.Visible := True;
  Panel3.Visible := True;
  Form1.Caption := 'Simulation file - ' + OpenDialog1.FileName;

  StaticText8.Caption := '1';

  str(Tot_Sim_Types,txt);
  EditTotSimTypes.Text := txt;

  str(Tot_Sims,txt);
  EditTotSims.Text := txt;

  EditMess.Text := Mess[st];

  EditProcFileName.Text := Sch_Filename[st];
  EditNetFileName.Text := Net_Filename[st];

  EditConstInitWgt.Text := Const_Init_Wgts_Str[st];
  EditMinRandInitWgt.Text := Min_Rand_Init_Wgts_Str[st];
  EditMaxRandInitWgt.Text := Max_Rand_Init_Wgts_Str[st];

  case Rst_Wgts_Chkd_Bttn[st] of
    1: begin
         ConstInitWgtBttn.Checked := True;
         EditConstInitWgt.Enabled := True;
         EditMinRandInitWgt.Enabled := False;
         EditMaxRandInitWgt.Enabled := False;
         MinRandInitWgtLabel.Enabled := False;
         MaxRandInitWgtLabel.Enabled := False;
       end;

    2: begin
         RandInitWgtBttn.Checked := True;
         EditConstInitWgt.Enabled := False;
         EditMinRandInitWgt.Enabled := True;
         EditMaxRandInitWgt.Enabled := True;
         MinRandInitWgtLabel.Enabled := True;
         MaxRandInitWgtLabel.Enabled := True;
       end;

    3: begin
         NoResetWgtBttn.Checked := True;
         EditConstInitWgt.Enabled := False;
         EditMinRandInitWgt.Enabled := False;
         EditMaxRandInitWgt.Enabled := False;
         MinRandInitWgtLabel.Enabled := False;
         MaxRandInitWgtLabel.Enabled := False;
       end;
  end{case};

  ActCheckBox.Checked := StoreActs[st];
  WgtCheckBox.Checked := StoreWgts[st];

  EditNPEList.Text := Obs_NPE_List[st];
  EditTSList.Text := Obs_ts_List[st];

  EditOpCrit.Enabled := Op_Crit[st];
  EditCRCrit.Enabled := CR_Crit[st];
  EditCR2Crit.Enabled := CR2_Crit[st];

  OpCheckBox.Checked := Op_Crit[st];
  CRCheckBox.Checked := CR_Crit[st];
  CR2CheckBox.Checked := CR2_Crit[st];

  EditOpCrit.Text := Op_Str[st];
  EditCRCrit.Text := CR_Str[st];
  EditCR2Crit.Text := CR2_Str[st];

  if tot_sim_types > 1 then
    begin
      NextBttn.Enabled := True;
      DelBttn.Enabled := True
    end else
      begin
        NextBttn.Enabled := False;
        DelBttn.Enabled := False;
      end;

  BackBttn.Enabled := False;

  EditTotSimTypes.SetFocus;

  SaveDialog1.FileName := OpenDialog1.FileName;

  CloseFile(Ef);

  JustSaved := True;
End;

procedure TForm1.OpenExpFile(Sender: TObject);
begin
  OpenExpRequest := True;   

  Exp_FileName := OpenDialog1.FileName;
  AssignFile(Ef,Exp_FileName);

 {$I-}
  ReSet(Ef);
 {$I+}

  if IOResult = 0 then
    ReadExpFile(sender)
  else
    CreateExpFile(sender);

  OpenExpRequest := False;
end;


procedure TForm1.InsBttnClick(Sender: TObject);
var
   tst, i : integer;
   txt : String[3];
begin
  Editing_Net_Filename := False;
  Editing_Prc_Filename := False;
  Browse.Enabled := False;

  Tot_Sim_Types := Tot_Sim_Types + 1;
  Str(Tot_Sim_Types,txt);
  EditTotSimTypes.Text := txt;

  if st = 1 then
    begin
      NextBttn.Enabled := True;
      BackBttn.Enabled := False;
    end;

  if st > 1 then
    BackBttn.Enabled := True;

  if st = Tot_Sim_Types then
    begin
      NextBttn.Enabled := False;
      BackBttn.Enabled := True;
    end;

  if (st > 1) and (st < Tot_Sim_Types) then
    begin
      NextBttn.Enabled := True;
      BackBttn.Enabled := True;
    end;

  EditMess.Text := '';
  EditProcFileName.Text := '';
  EditNetFileName.Text := '';
  EditConstInitWgt.Text := '.01';
  EditMinRandInitWgt.Text := '0';
  EditMaxRandInitWgt.Text := '.01';
  EditNPEList.Text := '';
  EditTSList.Text := '';

  for tst := Tot_Sim_Types downto st+1 do
    begin
      Mess[tst] := Mess[tst-1];
      Sch_Filename[tst] := Sch_Filename[tst-1];
      Net_Filename[tst] := Net_Filename[tst-1];
      Const_Init_Wgts_Str[tst] := Const_Init_Wgts_Str[tst-1];
      Min_Rand_Init_Wgts_Str[tst] := Min_Rand_Init_Wgts_Str[tst-1];
      Max_Rand_Init_Wgts_Str[tst] := Max_Rand_Init_Wgts_Str[tst-1];
      Obs_NPE_List[tst] := Obs_NPE_List[tst-1];
      Tot_Obs_NPEs[tst] := Tot_Obs_NPEs[tst-1];
      Obs_ts_List[tst] := Obs_ts_List[tst-1];
      Tot_Obs_TimeSteps[tst] := Tot_Obs_TimeSteps[tst-1];

      StoreActs[tst] := StoreActs[tst-1];
      StoreWgts[tst] := StoreWgts[tst-1];

      Op_Crit[tst] := Op_Crit[tst-1];
      CR_Crit[tst] := CR_Crit[tst-1];
      CR2_Crit[tst] := CR2_Crit[tst-1];

      Op_Str[tst] := Op_Str[tst-1];
      CR_Str[tst] := CR_Str[tst-1];
      CR2_Str[tst] := CR2_Str[tst-1];
      Op[tst] := Op[tst-1];
      CR[tst] := CR[tst-1];
      CR2[tst] := CR2[tst-1];

      Mess[tst-1] := '';
      Sch_FileName[tst-1] := '';
      Net_FileName[tst-1] := '';
      Const_Init_Wgts_Str[tst-1] := '.01';
      Min_Rand_Init_Wgts_Str[tst-1] := '0';
      Max_Rand_Init_Wgts_Str[tst-1] := '.01';
      Const_Init_Wgts[tst-1] := 0.01;
      Min_Rand_Init_Wgts[tst-1] := 0;
      Max_Rand_Init_Wgts[tst-1] := 0.01;
      Rst_Wgts[tst-1] := 0;
      Obs_NPE_List[tst-1] := '';
      Tot_Obs_NPEs[tst-1] := 0;
      Obs_ts_List[tst-1] := '';
      Tot_Obs_TimeSteps[tst-1] := 0;

      StoreActs[tst-1] := False;
      StoreWgts[tst-1] := False;

      Op_Crit[tst-1] := False;
      CR_Crit[tst-1] := False;
      CR2_Crit[tst-1] := False;

      Op_Str[tst-1] := '.5';
      CR_Str[tst-1] := '.5';
      CR2_Str[tst-1] := '.5';
      Op[tst-1] := 0.5;
      CR[tst-1] := 0.5;
      CR2[tst-1] := 0.5;
    end;

  Rst_Wgts_Chkd_Bttn[st] := 3;

  NoResetWgtBttn.Checked := True;
  EditConstInitWgt.Enabled := False;
  EditMinRandInitWgt.Enabled := False;
  EditMaxRandInitWgt.Enabled := False;
  MinRandInitWgtLabel.Enabled := False;
  MaxRandInitWgtLabel.Enabled := False;

  ActCheckBox.Checked := True;
  WgtCheckBox.Checked := False;

  EditNPEList.Text := '';
  EditTSList.Text := '';

  EditOpCrit.Enabled := False;
  EditCRCrit.Enabled := False;
  EditCR2Crit.Enabled := False;

  OpCheckBox.Checked := False;
  CRCheckBox.Checked := False;
  CR2CheckBox.Checked := False;

  EditOpCrit.Text := '0.5';
  EditCRCrit.Text := '0.5';
  EditCR2Crit.Text := '0.5';

  if tot_sim_types > 1 then
    DelBttn.Enabled := True;

  JustSaved := False;
end;

procedure TForm1.DelBttnClick(Sender: TObject);
var
   tst, i : integer;
   txt : String[3];
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

    if MessageDlg('Delete current condition?',
                   mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
        JustSaved := False;

        if st = tot_sim_types then
          begin
             EditMess.Text := Mess[st-1];

             EditProcFileName.Text := Sch_FileName[st-1];
             EditNetFileName.Text := Net_FileName[st-1];

             EditConstInitWgt.Text := Const_Init_Wgts_Str[st-1];
             EditMinRandInitWgt.Text := Min_Rand_Init_Wgts_Str[st-1];
             EditMaxRandInitWgt.Text := Max_Rand_Init_Wgts_Str[st-1];

             EditNPEList.Text := Obs_NPE_List[st-1];
             EditTSList.Text := Obs_ts_List[st-1];

             ActCheckBox.Checked := StoreActs[st-1];
             WgtCheckBox.Checked := StoreWgts[st-1];

             OpCheckBox.Checked := Op_Crit[st-1];
             CRCheckBox.Checked := CR_Crit[st-1];
             EditOpCrit.Text := Op_Str[st-1];
             EditCRCrit.Text := CR_Str[st-1];
             EditCR2Crit.Text := CR2_Str[st-1];

             Mess[st] := Mess[st-1];

             Sch_Filename[st] := Sch_Filename[st-1];
             Net_Filename[st] := Net_Filename[st-1];

             Rst_Wgts[st] := Rst_Wgts[st-1];
             Rst_Wgts_Chkd_Bttn[st] := Rst_Wgts_Chkd_Bttn[st-1];

             case Rst_Wgts_Chkd_Bttn[st] of
                  1: begin
                          ConstInitWgtBttn.Checked := True;
                          EditConstInitWgt.Enabled := True;
                          EditMinRandInitWgt.Enabled := False;
                          EditMaxRandInitWgt.Enabled := False;
                          MinRandInitWgtLabel.Enabled := False;
                          MaxRandInitWgtLabel.Enabled := False;
                     end;

                  2: begin
                          RandInitWgtBttn.Checked := True;
                          EditConstInitWgt.Enabled := False;
                          EditMinRandInitWgt.Enabled := True;
                          EditMaxRandInitWgt.Enabled := True;
                          MinRandInitWgtLabel.Enabled := True;
                          MaxRandInitWgtLabel.Enabled := True;
                     end;

                  3: begin
                          NoResetWgtBttn.Checked := True;
                          EditConstInitWgt.Enabled := False;
                          EditMinRandInitWgt.Enabled := False;
                          EditMaxRandInitWgt.Enabled := False;
                          MinRandInitWgtLabel.Enabled := False;
                          MaxRandInitWgtLabel.Enabled := False;
                     end;
             end{case};

             Const_Init_Wgts[st] := Const_Init_Wgts[st-1];
             Const_Init_Wgts_Str[st] := Const_Init_Wgts_Str[st-1];
             Min_Rand_Init_Wgts[st] := Min_Rand_Init_Wgts[st-1];
             Min_Rand_Init_Wgts_Str[st] := Min_Rand_Init_Wgts_Str[st-1];
             Max_Rand_Init_Wgts[st] := Max_Rand_Init_Wgts[st-1];
             Max_Rand_Init_Wgts_Str[st] := Max_Rand_Init_Wgts_Str[st-1];

             Obs_NPE_List[st] := Obs_NPE_List[st-1];
             Tot_Obs_NPEs[st] := Tot_Obs_NPEs[st-1];
             Obs_ts_List[st] := Obs_ts_List[st-1];
             Tot_Obs_TimeSteps[st] := Tot_Obs_TimeSteps[st-1];

             StoreActs[st] := StoreActs[st-1];
             StoreWgts[st] := StoreWgts[st-1];

             Op_Crit[st] := Op_crit[st-1];
             CR_Crit[st] := CR_crit[st-1];
             CR2_Crit[st] := CR2_crit[st-1];
             Op[st] := Op[st-1];
             CR[st] := CR[st-1];
             Op_Str[st] := Op_Str[st-1];
             CR_Str[st] := CR_Str[st-1];
             CR2_Str[st] := CR2_Str[st-1];
          end else
              begin
                 EditMess.Text := Mess[st+1];

                 EditProcFileName.Text := Sch_FileName[st+1];
                 EditNetFileName.Text := Net_FileName[st+1];

                 EditConstInitWgt.Text := Const_Init_Wgts_Str[st+1];
                 EditMinRandInitWgt.Text := Min_Rand_Init_Wgts_Str[st+1];
                 EditMaxRandInitWgt.Text := Max_Rand_Init_Wgts_Str[st+1];

                 EditNPEList.Text := Obs_NPE_List[st+1];
                 EditTSList.Text := Obs_ts_List[st+1];

                 ActCheckBox.Checked := StoreActs[st+1];
                 WgtCheckBox.Checked := StoreWgts[st+1];

                 OpCheckBox.Checked := Op_Crit[st+1];
                 CRCheckBox.Checked := CR_Crit[st+1];
                 EditOpCrit.Text := Op_Str[st+1];
                 EditCRCrit.Text := CR_Str[st+1];

                 for tst := st to Tot_Sim_Types - 1 do
                     begin
                          Mess[tst] := Mess[tst+1];

                          Sch_Filename[tst] := Sch_Filename[tst+1];
                          Net_Filename[tst] := Net_Filename[tst+1];

                          Rst_Wgts[tst] := Rst_Wgts[tst+1];
                          Rst_Wgts_Chkd_Bttn[tst] := Rst_Wgts_Chkd_Bttn[tst+1];
                          case Rst_Wgts_Chkd_Bttn[st] of
                               1: begin
                                       ConstInitWgtBttn.Checked := True;
                                       EditConstInitWgt.Enabled := True;
                                       EditMinRandInitWgt.Enabled := False;
                                       EditMaxRandInitWgt.Enabled := False;
                                       MinRandInitWgtLabel.Enabled := False;
                                       MaxRandInitWgtLabel.Enabled := False;
                                  end;

                               2: begin
                                       RandInitWgtBttn.Checked := True;
                                       EditConstInitWgt.Enabled := False;
                                       EditMinRandInitWgt.Enabled := True;
                                       EditMaxRandInitWgt.Enabled := True;
                                       MinRandInitWgtLabel.Enabled := True;
                                       MaxRandInitWgtLabel.Enabled := True;
                                  end;

                               3: begin
                                       NoResetWgtBttn.Checked := True;
                                       EditConstInitWgt.Enabled := False;
                                       EditMinRandInitWgt.Enabled := False;
                                       EditMaxRandInitWgt.Enabled := False;
                                       MinRandInitWgtLabel.Enabled := False;
                                       MaxRandInitWgtLabel.Enabled := False;
                                  end;
                          end{case};
                          Const_Init_Wgts_Str[tst] := Const_Init_Wgts_Str[tst+1];
                          Min_Rand_Init_Wgts_Str[tst] := Min_Rand_Init_Wgts_Str[tst+1];
                          Max_Rand_Init_Wgts_Str[tst] := Max_Rand_Init_Wgts_Str[tst+1];

                          Obs_NPE_List[tst] := Obs_NPE_List[tst+1];
                          Tot_Obs_NPEs[tst] := Tot_Obs_NPEs[tst+1];
                          Obs_ts_List[tst] := Obs_ts_List[tst+1];
                          Tot_Obs_TimeSteps[tst] := Tot_Obs_TimeSteps[tst+1];

                          StoreActs[tst] := StoreActs[tst+1];
                          StoreWgts[tst] := StoreWgts[tst+1];

                          Op_Crit[tst] := Op_crit[tst+1];
                          CR_Crit[tst] := CR_crit[tst+1];
                          CR2_Crit[tst] := CR2_crit[tst+1];
                          Op[tst] := Op[tst+1];
                          CR[tst] := CR[tst+1];
                          Op_Str[tst] := Op_Str[tst+1];
                          CR_Str[tst] := CR_Str[tst+1];
                          CR2_Str[tst] := CR2_Str[tst+1];
                     end;
              end;

        Mess[Tot_Sim_Types] := '';

        Sch_FileName[Tot_Sim_Types] := '';
        Net_FileName[Tot_Sim_Types] := '';

        Rst_Wgts[Tot_Sim_Types] := 0;
        Rst_Wgts_Chkd_Bttn[Tot_Sim_Types] := 3;
        Const_Init_Wgts_Str[Tot_Sim_Types] := '.01';
        Const_Init_Wgts[Tot_Sim_Types] := 0.01;
        Min_Rand_Init_Wgts_Str[Tot_Sim_Types] := '0';
        Min_Rand_Init_Wgts[Tot_Sim_Types] := 0;
        Max_Rand_Init_Wgts_Str[Tot_Sim_Types] := '.01';
        Max_Rand_Init_Wgts[Tot_Sim_Types] := 0.01;

        Obs_NPE_List[Tot_Sim_Types] := '';
        Tot_Obs_NPEs[Tot_Sim_Types] := 0;
        Obs_ts_List[Tot_Sim_Types] := '';
        Tot_Obs_TimeSteps[Tot_Sim_Types] := 0;

        StoreActs[tot_sim_types] := False;
        StoreWgts[tot_sim_types] := False;

        Op_Crit[tot_sim_types] := False;
        CR_Crit[tot_sim_types] := False;
        CR2_Crit[tot_sim_types] := False;
        Op[tot_sim_types] := 0.5;
        CR[tot_sim_types] := 0.5;
        CR2[tot_sim_types] := 0.5;
        Op_Str[tot_sim_types] := '.5';
        CR_Str[tot_sim_types] := '.5';
        CR2_Str[tot_sim_types] := '.5';

        tot_sim_types := tot_sim_types - 1;

        Str(Tot_Sim_Types,txt);
        EditTotSimTypes.Text := txt;

        if tot_sim_types = 1 then
          begin
             st := 1;
             NextBttn.Enabled := False;
             BackBttn.Enabled := False;
             DelBttn.Enabled := False;
          end else
              begin
                 if st = 1 then
                    begin
                         NextBttn.Enabled := True;
                         BackBttn.Enabled := False;
                    end;

                 if st > 1 then
                    BackBttn.Enabled := True;

                 if st = Tot_Sim_Types then
                    begin
                         NextBttn.Enabled := False;
                         BackBttn.Enabled := True;
                    end;

                 if st > Tot_Sim_Types then
                    begin
                         st := Tot_Sim_Types;
                         NextBttn.Enabled := False;
                    end;
              end;

        str(st,txt);
        StaticText8.Caption := txt;

        if (st > 1) and (st < Tot_Sim_Types) then
          begin
             NextBttn.Enabled := True;
             BackBttn.Enabled := True;
          end;
      end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caNone;

   if JustSaved then
       begin
          Form0.Caption := 'SelNet';
          Form0.Run1.Enabled := True;
          Save1.Enabled := False;
          Action := caFree;
          Form0.Experiment1.Enabled := True;
       end else
           if MessageDlg('The simulation file has not been saved. Do you wish to save it?',mtConfirmation,
                         [mbYes, mbNo],0) = mrNo then
             begin
                  Form0.Caption := 'SelNet';
                  Form0.Run1.Enabled := True;
                  Save1.Enabled := False;
                  Action := caFree;
                  Form0.Experiment1.Enabled := True;
             end else
                   Save1Click(Sender)
end;

procedure TForm1.ActCheckBoxClick(Sender: TObject);
begin
   Editing_Net_Filename := False;
   Editing_Prc_Filename := False;
   Browse.Enabled := False;

   if ActCheckBox.Checked then
     begin
        JustSaved := False;
        StoreActs[st] := True;
        EditNPEList2.Text := EditNPEList.Text;
        EditTSList2.Text := EditTSList.Text;
        NPELabel.Enabled := True;
        TSLabel1.Enabled := True;
     end else
        begin
           StoreActs[st] := False;
           if not(WgtCheckBox.Checked) then
             begin
                EditNPEList2.Text := '';
                EditTSList2.Text := '';
                NPELabel.Enabled := False;
                TSLabel1.Enabled := False;
             end;
        end;

  BuildHint(sender);
end;

procedure TForm1.WgtCheckBoxClick(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

   if WgtCheckBox.Checked then
     begin
        JustSaved := False;
        StoreWgts[st] := True;
        EditNPEList2.Text := EditNPEList.Text;
        EditTSList2.Text := EditTSList.Text;
        NPELabel.Enabled := True;
        TSLabel1.Enabled := True;
     end else
        begin
           StoreWgts[st] := False;

           if not(ActCheckBox.Checked) then
             begin
                EditNPEList2.Text := '';
                EditTSList2.Text := '';
                NPELabel.Enabled := False;
                TSLabel1.Enabled := False;
             end;
        end;

  BuildHint(sender);
end;

procedure TForm1.OpCheckBoxClick(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     if OpCheckBox.Checked then
        begin
             Op_Crit[st] := True;
             EditOpCrit.Enabled := True;
             EditTSList3.Text := EditTSList.Text;
             TSLabel2.Enabled := True;
        end else
            begin
                 Op_Crit[st] := False;
                 EditOpCrit.Enabled := False;
                 if not(CRCheckBox.Checked) then
                   begin
                      EditTSList3.Text := '';
                      TSLabel2.Enabled := False;
                   end;
            end;

  BuildHint(sender);
end;

procedure TForm1.CRCheckBoxClick(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     if CRCheckBox.Checked then
        begin
             CR_Crit[st] := True;
             EditCRCrit.Enabled := True;
             EditTSList3.Text := EditTSList.Text;
             TSLabel2.Enabled := True;
        end else
            begin
                 CR_Crit[st] := False;
                 EditCRCrit.Enabled := False;
                 if not(OpCheckBox.Checked) then
                   begin
                      EditTSList3.Text := '';
                      TSLabel2.Enabled := False;
                   end;
            end;

  BuildHint(sender);
end;

procedure TForm1.EditCRCritChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     EditCRCrit.Color := clWhite;
     JustSaved := False;
end;

procedure TForm1.CR2CheckBoxClick(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     if CR2CheckBox.Checked then
        begin
             CR2_Crit[st] := True;
             EditCR2Crit.Enabled := True;
             EditTSList3.Text := EditTSList.Text;
             TSLabel2.Enabled := True;
        end else
            begin
                 CR2_Crit[st] := False;
                 EditCR2Crit.Enabled := False;
                 if not(OpCheckBox.Checked) then
                   begin
                      EditTSList3.Text := '';
                      TSLabel2.Enabled := False;
                   end;
            end;

  BuildHint(sender);
end;

procedure TForm1.EditCR2CritChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     EditCR2Crit.Color := clWhite;
     JustSaved := False;
end;

procedure TForm1.EditOpCritChCl(Sender: TObject);
begin
     Editing_Net_Filename := False;
     Editing_Prc_Filename := False;
     Browse.Enabled := False;

     EditOpCrit.Color := clWhite;
     JustSaved := False;
end;

procedure TForm1.New1Click(Sender: TObject);
begin
  If not(JustSaved) then
    case MessageDlg('Save current simulation file?',mtConfirmation,
                    [mbYes, mbNo, mbCancel],0) of
      mrYes: begin
                Save1Click(sender);
                CreateExpFile(sender);
             end;
                
      mrNo : CreateExpFile(sender);
    end{case}
  else
    CreateExpFile(sender);
end;


Function TForm1.AllFieldsFilled(Sender: TObject) : Boolean;
Var
   i : Integer;
   aff : Boolean;
Begin
     aff := True;

     EditMessChange(sender);

     EditProcFileNameChange(sender);
     EditNetFileNameChange(sender);

     EditNPEListChange(sender);
     EditTSListChange(sender);

     aff := (aff) and (EditMess.Text <> '');

     aff := (aff) and (EditProcFileName.Text <> '');
     aff := (aff) and (EditNetFileName.Text <> '');

     aff := (aff) and (EditNPEList.Text <> '');
     aff := (aff) and (EditTSList.Text <> '');

     for i := 1 to Tot_Sim_Types do
        begin
           Aff := (Aff) and (Mess[i] <> '');

           Aff := (Aff) and (Sch_Filename[i] <> '');
           Aff := (Aff) and (Net_Filename[i] <> '');

           Aff := (Aff) and (Obs_NPE_List[i] <> '');
           Aff := (Aff) and (Obs_ts_List[i] <> '');
        end;

     AllFieldsFilled := Aff;
End;


procedure TForm1.BrowseClick(Sender: TObject);
begin
  if editing_net_filename then
    begin
      OpenDialog2.Title := 'Browse for network files';
      OpenDialog2.Filter := 'Network files|*.ntw';
      OpenDialog2.InitialDir := 'c:\selnet';
      OpenDialog2.FileName := '';

      If OpenDialog2.Execute then
         begin
           EditNetFileName_prev_txt := Net_FileName[st];
           EditNetFileName.Text := OpenDialog2.FileName;
           EditNetFileName_cur_txt := EditNetFileName.Text;
           Net_FileName[st] := EditNetFileName.Text;

           if EditNetFileName_cur_txt <> EditNetFileName_prev_txt then
             begin
                JustSaved := False;
                EditNetFileName.Color := clYellow
             end else
                EditNetFileName.Color := clwhite;
         end;
    end;

  if editing_prc_filename then
    begin
      OpenDialog2.Title := 'Browse for contingency files';
      OpenDialog2.Filter := 'Contingency files|*.con';
      OpenDialog2.InitialDir := 'c:\selnet';
      OpenDialog2.FileName := '';

      If OpenDialog2.Execute then
         begin
           EditProcFileName_prev_txt := Sch_FileName[st];
           EditProcFileName_cur_txt := EditProcFileName.Text;
           EditProcFileName.Text := OpenDialog2.FileName;
           Sch_Filename[st] := EditProcFileName.Text;

           if EditProcFileName_cur_txt <> EditProcFileName_prev_txt then
             begin
               JustSaved := False;
               EditProcFileName.Color := clYellow
             end else
                 EditProcFileName.Color := clwhite;
         end;
    end;

  BuildHint(sender);
end;

procedure TForm1.Print1Click(Sender: TObject);
begin
   if printdialog1.execute then
     RichEdit1.Print('Simulation file: ' + OpenDialog1.FileName);
end;

procedure TForm1.RndAsyncClick(Sender: TObject);
begin
    If RndAsync.Checked then UpProc := 'RndAsync';
end;

procedure TForm1.SeqAsyncClick(Sender: TObject);
begin
    If SeqAsync.Checked then UpProc := 'SeqAsync';
end;

procedure TForm1.RndSyncClick(Sender: TObject);
begin
    If RndSync.Checked then UpProc := 'RndSync';
end;

procedure TForm1.SeqSyncClick(Sender: TObject);
begin
    If SeqSync.Checked then UpProc := 'SeqSync';
end;

End.


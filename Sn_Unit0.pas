{ Pending as to 1-24-00:

  -) Error-handling routines.
  -) Work on some demos...

  }

unit Sn_Unit0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls, jpeg;

type
  TForm0 = class(TForm)
    Panel1: TPanel;
    Label9: TLabel;
    Button1: TButton;
    StaticText1: TStaticText;
    StaticText3: TStaticText;
    MainMenu1: TMainMenu;
    Window1: TMenuItem;
    Tile1: TMenuItem;
    Cascade1: TMenuItem;
    New1: TMenuItem;
    Experiment1: TMenuItem;
    Schedule1: TMenuItem;
    File1: TMenuItem;
    HandCrafted1: TMenuItem;
    Exit1: TMenuItem;
    Run1: TMenuItem;
    Contents1: TMenuItem;
    Introduction1: TMenuItem;
    About1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Themodel1: TMenuItem;
    Activation1: TMenuItem;
    Learning1: TMenuItem;
    Updateprocedure1: TMenuItem;
    StaticText5: TStaticText;
    Networksubmodel1: TMenuItem;
    InputNPEs1: TMenuItem;
    N4: TMenuItem;
    Introduction2: TMenuItem;
    CorticalNPEs1: TMenuItem;
    Sensoryassociation1: TMenuItem;
    Motorassociation1: TMenuItem;
    SubcorticalNPEs1: TMenuItem;
    ca11: TMenuItem;
    vta1: TMenuItem;
    OutputNPEs1: TMenuItem;
    Operant1: TMenuItem;
    Respondent1: TMenuItem;
    Neurocomputationalsubmodel1: TMenuItem;
    StaticText2: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    Theprogram1: TMenuItem;
    Designingexperiments1: TMenuItem;
    Designingnetworks1: TMenuItem;
    Designingprocedures1: TMenuItem;
    Generaldescription1: TMenuItem;
    N3: TMenuItem;
    UseRandom: TMenuItem;
    UseRandNum: TMenuItem;
    N5: TMenuItem;
    Simulationoutput1: TMenuItem;
    Screen1: TMenuItem;
    Files1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    About2: TMenuItem;
    procedure Open1Click(Sender : TObject);
    procedure About1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Exit1Click (Sender:TObject);
    procedure Tile1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Experiment1Click(Sender: TObject);
    procedure Schedule1Click(Sender: TObject);
    procedure Handcrafted1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Introduction1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure Activation1Click(Sender: TObject);
    procedure Learning1Click(Sender: TObject);
    procedure Updateprocedure1Click(Sender: TObject);
    procedure Introduction2Click(Sender: TObject);
    procedure InputNPEs1Click(Sender: TObject);
    procedure Sensoryassociation1Click(Sender: TObject);
    procedure Motorassociation1Click(Sender: TObject);
    procedure Operant1Click(Sender: TObject);
    procedure Respondent1Click(Sender: TObject);
    procedure ca11Click(Sender: TObject);
    procedure vta1Click(Sender: TObject);
    procedure Generaldescription1Click(Sender: TObject);
    procedure Designingexperiments1Click(Sender: TObject);
    procedure Designingnetworks1Click(Sender: TObject);
    procedure UseRandomClick(Sender: TObject);
    procedure UseRandNumClick(Sender: TObject);
    procedure Designingprocedures1Click(Sender: TObject);
    procedure Screen1Click(Sender: TObject);
    procedure Files1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form0: TForm0;
  Rand : (rand1, rand2);

implementation

uses Sn_unit1, Sn_Unit2b, Sn_Unit3, Sn_Unit4b;

{$R *.DFM}

procedure TForm0.Open1Click(Sender: TObject);
begin
     Randomize;

     OpenDialog1.FileName := '';

     If (OpenDialog1.Execute) and (OpenDialog1.FileName <> '') then
        Form4b.OpenExpFile(sender);
end;

procedure TForm0.About1Click(Sender: TObject);
begin
     Panel1.Visible := True;
end;

procedure TForm0.Exit1Click (Sender: TObject);
Var
   Action : TCloseAction;
begin
     FormClose(Sender, Action);
end;

procedure TForm0.Button1Click(Sender: TObject);
begin
     Panel1.Visible := False;
end;

procedure TForm0.Tile1Click(Sender: TObject);
begin
     Tile;
end;

procedure TForm0.Cascade1Click(Sender: TObject);
begin
     Cascade;
end;

procedure TForm0.Experiment1Click(Sender: TObject);
begin
     Experiment1.Enabled := False;
     Caption := 'SelNet';
     Application.CreateForm(TForm1, Form1);
     OpenExpRequest := False;
     Form1.CreateExpFile(sender);
end;

procedure TForm0.Handcrafted1Click(Sender: TObject);
begin
     HandCrafted1.Enabled := False;
     Caption := 'SelNet';
     OpenNetRequest := False;
     Application.CreateForm(TForm2b, Form2b);
     Form2b.HandCraftNet(sender);
end;

procedure TForm0.Schedule1Click(Sender: TObject);
begin
     Schedule1.Enabled := False;
     Caption := 'SelNet';
     OpenSchRequest := False;
     Application.CreateForm(TForm3, Form3);
     Form3.HandCraftSchedule(sender);
end;

procedure TForm0.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if MessageDlg('Exit SelNet?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
        begin
          ExperimentDone := True;
          Application.Terminate;
        end else
          begin
            ExperimentDone := False;
            Application.Initialize;
            Application.Run;
          end;
end;

procedure TForm0.Contents1Click(Sender: TObject);
Var
   h : Boolean;
begin
     h := Application.HelpCommand(11, 0);
end;

procedure TForm0.Introduction1Click(Sender: TObject);
Var
   h : Boolean;
begin
     h := Application.HelpContext(1);
end;

procedure TForm0.Activation1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(2);
end;

procedure TForm0.Learning1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(3);
end;

procedure TForm0.Updateprocedure1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(4);
end;

procedure TForm0.Introduction2Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(5);
end;

procedure TForm0.InputNPEs1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(6);
end;

procedure TForm0.Sensoryassociation1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(7);
end;

procedure TForm0.Motorassociation1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(8);
end;

procedure TForm0.Operant1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(9);
end;

procedure TForm0.Respondent1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(10);
end;

procedure TForm0.ca11Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(11);
end;

procedure TForm0.vta1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(12);
end;

procedure TForm0.Generaldescription1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(13);
end;

procedure TForm0.Designingexperiments1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(14);
end;

procedure TForm0.Designingnetworks1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(15);
end;

procedure TForm0.DesigningProcedures1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(16);
end;

procedure TForm0.Screen1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(17);
end;

procedure TForm0.Files1Click(Sender: TObject);
var
   h : boolean;
begin
     h := Application.HelpContext(18);
end;

procedure TForm0.UseRandomClick(Sender: TObject);
begin
     Rand := Rand1;
     Open1Click(sender);
end;

procedure TForm0.UseRandNumClick(Sender: TObject);
begin
     Rand := Rand2;
     Open1Click(sender);
end;

end.

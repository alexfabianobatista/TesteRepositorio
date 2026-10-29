unit UReinfGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, UReinf_cl, Buttons;

type
  TFReinf = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MCalendarInicio: TMonthCalendar;
    MCalendarFim: TMonthCalendar;
    DBGrid1: TDBGrid;
    btnFiltrar: TButton;
    cbAmbienteEnvio: TComboBox;
    Label3: TLabel;
    btnR100: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    btnR1070: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    btnR2010: TBitBtn;
    btnR2020: TBitBtn;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    btnR2098: TBitBtn;
    btnR2099: TBitBtn;
    GroupBox4: TGroupBox;
    Panel2: TPanel;
    Label13: TLabel;
    Panel3: TPanel;
    Label14: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label16: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    btnR9000: TBitBtn;
    Label10: TLabel;
    BitBtn3: TBitBtn;
    btnSuspensao: TBitBtn;
    Label18: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnR100Click(Sender: TObject);
    procedure btnR1070Click(Sender: TObject);
    procedure btnSuspensaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReinf: TFReinf;

implementation

uses UReinfR1000, UReinfR1070, USuspensaoProcessos;

{$R *.dfm}

procedure TFReinf.FormActivate(Sender: TObject);
begin
  MCalendarInicio.Date := StrToDate('01/06/2021');
  MCalendarFim.Date := Now;
end;

procedure TFReinf.btnFiltrarClick(Sender: TObject);
begin

  with DMReinf do
  begin
    QReinfPeriodo.Close;
    QReinfPeriodo.SetVariable('dt_inicio_evento', MCalendarInicio.Date);
    QReinfPeriodo.SetVariable('dt_fim_evento', MCalendarFim.Date);
    QReinfPeriodo.Open;
  end;

end;

procedure TFReinf.btnR100Click(Sender: TObject);
begin

  if FReinfR1000 = nil then
    FReinfR1000 := TFReinfR1000.Create(Application);

  FReinfR1000.ShowModal;

end;

procedure TFReinf.btnR1070Click(Sender: TObject);
begin
  if FReinfR1070 = nil then
    FReinfR1070 := TFReinfR1070.Create(Application);

  FReinfR1070.ShowModal;

end;

procedure TFReinf.btnSuspensaoClick(Sender: TObject);
begin

  if FSuspensaoProcessos = nil then
    FSuspensaoProcessos := TFSuspensaoProcessos.Create(Application);

  FSuspensaoProcessos.ShowModal;
  
end;

end.

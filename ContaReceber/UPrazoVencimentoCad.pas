unit UPrazoVencimentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBPanel, ActnList, OracleNavigator,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPrazoVencimentoCad = class(TFTCadSimples)
    PrazodeVencimento1: TMenuItem;
    DsDias: TDataSource;
    PcDados: TPageControl;
    TsPrazo: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    TsDias: TTabSheet;
    DBGrid1: TDBGrid;
    DBPanel8: TDBPanel;
    DBNavigator1: TOracleNavigator;
    BtnSalvarDia: TBitBtn;
    DBPanel7: TDBPanel;
    DBRadioGroup1: TDBRadioGroup;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure PrazodeVencimento1Click(Sender: TObject);
    procedure BtnSalvarDiaClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrazoVencimentoCad: TFPrazoVencimentoCad;

implementation

uses UPrazoVencimento_cl, UPrazoVencimentoCons, URPrazoVencimento,
  UParamSistema_cl, UPrazoVencimentoWizard;

{$R *.DFM}

procedure TFPrazoVencimentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPrazoVencimento.QPrazo.Close;
  DMPrazoVencimento.QPrazo.Open;

  PcDados.ActivePageIndex := 0;
end;

procedure TFPrazoVencimentoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPrazoVencimento.QPrazo.Close;
end;

procedure TFPrazoVencimentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.ShowModal = mrOK then
  begin
    with DMPrazoVencimento do
    begin
      QPrazo.Close;
      QPrazo.SetVariable('PK', QPrazoVencimento_ConsCOD_PRAZO_VENCIMENTO.Value);
      QPrazo.Open;
    end;
  end;
end;

procedure TFPrazoVencimentoCad.PrazodeVencimento1Click(Sender: TObject);
begin
  inherited;
  if FRPrazoVencimento = nil then
    FRPrazoVencimento := TFRPrazoVencimento.create(application);

  DMPrazoVencimento.QRPrazoVencimento.Close;
  DMPrazoVencimento.QRPrazoVencimento.open;

  FRPrazoVencimento.QRPrimario.Preview;
end;

procedure TFPrazoVencimentoCad.BtnSalvarDiaClick(Sender: TObject);
begin
  inherited;
  if ValidaCampos(Self, DsDias) then
    DMPrazoVencimento.QDias.Post;
end;

procedure TFPrazoVencimentoCad.DBNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if Button = nbInsert then
    DBPanel7.SetFocus;
end;

procedure TFPrazoVencimentoCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if FPrazoVencimentoWizard = nil then
    FPrazoVencimentoWizard := TFPrazoVencimentoWizard.Create(nil);
  FPrazoVencimentoWizard.ShowModal;
end;

procedure TFPrazoVencimentoCad.SBExcluirClick(Sender: TObject);
begin
  with DMPrazoVencimento do
  begin
    QDias.First;
    while not QDias.Eof do
    begin
      QDias.Delete;
    end;
  end;
  inherited;  
end;

end.


unit UEstadoCad;

interface
                                     
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, ActnList, DBPanel, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Grids, DBGrids, OracleNavigator;

type
  TFEstadoCad = class(TFTCadSimples)
    Estados1: TMenuItem;
    PCGeral: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPTributacao: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPBCSTNormal: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel6: TDBPanel;
    DBPBCSTSimplesNacional: TDBPanel;
    DBPanel12: TDBPanel;
    GBFCP: TGroupBox;
    OracleNavigator1: TOracleNavigator;
    DBGrid1: TDBGrid;
    DBPMotoristaCte: TDBPanel;
    DsFCP: TDataSource;
    DBPanel13: TDBPanel;
    DBPanel7: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPTributacaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPMotoristaCteDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBPanel13Validate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
    procedure DBPBCSTNormalCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadoCad: TFEstadoCad;

implementation

uses UEstado_cl, UEstadoCons, UREstado_Estado, UTributacaoCons,
  UTributacao_cl, Math, UProdutoCons, UOracle_cl;

{$R *.DFM}

procedure TFEstadoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  If FEstadoCons.ShowModal = mrOk then
  With DMEstado do
  Begin
    QEstado.Close;
    QEstado.SetVariable('COD_ESTADO',QEstadoConsCod_Estado.Value);
    QEstado.Open;
  End;
end;

procedure TFEstadoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMEstado do
  begin
    QEstado.Open;
    QFundoCombatePobreza.Open;
  end;
end;

procedure TFEstadoCad.MELocalizaExit(Sender: TObject);
begin
  //inherited;
  With DMEstado do
  Begin
    QEstado.Close;
    QEstado.SetVariable('COD_ESTADO',MELocaliza.Text);
    QEstado.Open;
    MELocaliza.Text := '';
  End;
end;

procedure TFEstadoCad.Estados1Click(Sender: TObject);
begin
  inherited;
  DMEstado.QREstado.Open;
  If FREstado_Estado = Nil then
    FREstado_Estado := TFREstado_Estado.Create(Application);
  FREstado_Estado.QRPrimario.Preview;
  DMEstado.QREstado.Close;
end;

procedure TFEstadoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(6);
end;

procedure TFEstadoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  With DMEstado do
  begin
    QEstado.Close;
    QFundoCombatePobreza.Close;
  end;
  Action := CaFree;
  FEstadoCad := Nil;
end;

procedure TFEstadoCad.DBPTributacaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTributacaoCons;
  Classe := TFTributacaoCons;
end;

procedure TFEstadoCad.DBPMotoristaCteDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFEstadoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [Dsinsert, DsEdit] then
  begin
    GBFCP.Enabled := True;
  end
  else
  begin
    GBFCP.Enabled := False;
  end;
end;

procedure TFEstadoCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFEstadoCad.DBPanel13Validate(Sender: TObject; Value: Variant;
  var isValid: Boolean; var Msg: String);
begin
  inherited;
  if(DMEstado.QFundoCombatePobrezaPERC_FCP_UF_DEST.Value > 2) then
  begin
    isValid := False;
    Msg := 'O percentual não pode ser maior que 2.';
  end;
end;

procedure TFEstadoCad.DBPBCSTNormalCodigoExit(Sender: TObject);
begin
  inherited;
  if (Trim(DBPBCSTNormal.DBEdit.Text) <> '') and
     (Trim(DBPBCSTNormal.DBEdit.Text) <> Trim(DBPBCSTSimplesNacional.DBEdit.Text)) then
    if MessageDlg('Deseja preencher o campo Base de Cálculo ST do Simples Nacional o valor '+
      Trim(DBPBCSTNormal.DBEdit.Text) + ' também?',
       mtConfirmation,[mbYes,mbNo],0) = mrYes then
      DBPBCSTSimplesNacional.DBEdit.Text := DBPBCSTNormal.DBEdit.Text;
end;

end.

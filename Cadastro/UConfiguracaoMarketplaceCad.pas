unit UConfiguracaoMarketplaceCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls, DBDirceu, DBPanel, Grids, DBGrids;

type
  TFConfiguracaoMarketplaceCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    DBP15Codigo: TDBPanel;
    DBP15Filial: TDBPanel;
    GroupBox30: TGroupBox;
    DBP15ClassificacaoCadastro: TDBPanel;
    DBP15RamoFisica: TDBPanel;
    DBP15RamoJuridica: TDBPanel;
    DBPanel45: TDBPanel;
    GroupBox32: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    DBP15Operacao: TDBPanel;
    DBP15Departamento: TDBPanel;
    DBRGT15TipoPagamento: TDBRadioGroup;
    DBP15Vendedor: TDBPanel;
    BtCons15LoteTipo: TBitBtn;
    DBE15Lote: TDBEdit;
    DBDirceu3: TDBDirceu;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DBPanel1: TDBPanel;
    DBPEmailNotificacao: TDBPanel;
    DBNEmailNotificacao: TDBNavigator;
    DsEmailNotificacao: TDataSource;
    DBPanel2: TDBPanel;
    Skyhub: TGroupBox;
    DBE15TokenConta: TDBEdit;
    DBE15Email: TDBEdit;
    DBE15TokenIntegracao: TDBEdit;
    DBRG15Ativo: TDBRadioGroup;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    DBEClientID: TDBEdit;
    Label2: TLabel;
    DBEClientSecret: TDBEdit;
    DBRGMLAtivo: TDBRadioGroup;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    DBPanel3: TDBPanel;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBECImgurClientSecret: TDBEdit;
    DBECImgurClientID: TDBEdit;
    DBECImgurRefreshToken: TDBEdit;
    DBRGAmbiente: TDBRadioGroup;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBP15FilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15ClassificacaoCadastroDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15RamoFisicaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15RamoJuridicaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel45DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15OperacaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15DepartamentoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15VendedorDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure BtCons15LoteTipoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DsEmailNotificacaoStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfiguracaoMarketplaceCad: TFConfiguracaoMarketplaceCad;

implementation

uses
  UConfiguracaoMarketplace_cl, UBiblioteca, UConfiguracaoMarketplaceCons,
  UOracle_cl, UTipoLoteCons, UFilialCons, UTipoLote_cl, UClassCadastroCons,
  URamoCons, UTipoCadastroCons, UOperacaoCons, UDepartamentoCons,
  UVendedorCons, URegiaoCons;

{$R *.dfm}

procedure TFConfiguracaoMarketplaceCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMConfiguracaoMarketplace.QConfiguracaoMarketplace.Open;
  PageControl1.ActivePageIndex := 0;
end;

procedure TFConfiguracaoMarketplaceCad.FormCreate(Sender: TObject);
begin
  inherited;
  Bib.addControleCharCase(DBE15Email, Self.Name);
  Bib.addControleCharCase(DBE15TokenConta, Self.Name);
  Bib.addControleCharCase(DBE15TokenIntegracao, Self.Name); 
  Bib.addControleCharCase(DBPEmailNotificacao, Self.Name);
  Bib.addControleCharCase(DBPEmailNotificacao, Self.Name);
  Bib.addControleCharCase(DBEClientID, Self.Name);
  Bib.addControleCharCase(DBEClientSecret, Self.Name);   
  Bib.addControleCharCase(DBECImgurClientID, Self.Name);
  Bib.addControleCharCase(DBECImgurClientSecret, Self.Name);
  Bib.addControleCharCase(DBECImgurRefreshToken, Self.Name);

  PageControl1.ActivePageIndex := 0;
end;

procedure TFConfiguracaoMarketplaceCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FConfiguracaoMarketplaceCons = nil then
     FConfiguracaoMarketplaceCons := TFConfiguracaoMarketplaceCons.Create(Application);
  if FConfiguracaoMarketplaceCons.ShowModal = mrOk then
    with DMConfiguracaoMarketplace do
    begin
      QConfiguracaoMarketplace.Close;
      QConfiguracaoMarketplace.SetVariable('PK', QConfiguracaoMarketplaceConsCOD_CONFIGURACAO_SKYHUB.Value);
      QConfiguracaoMarketplace.Open;
    end;
end;

procedure TFConfiguracaoMarketplaceCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  try
    DMOracle.DBCemapa.Commit;
  except
    on E: Exception do
    begin
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TFConfiguracaoMarketplaceCad.DBP15FilialDefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFConfiguracaoMarketplaceCad.DBP15ClassificacaoCadastroDefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FClassCadastroCons;
  Classe := TFClassCadastroCons;
end;

procedure TFConfiguracaoMarketplaceCad.DBP15RamoFisicaDefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FRamoCons;
  Classe := TFRamoCons;
end;

procedure TFConfiguracaoMarketplaceCad.DBP15RamoJuridicaDefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FRamoCons;
  Classe := TFRamoCons;
end;

procedure TFConfiguracaoMarketplaceCad.DBPanel45DefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoCadastroCons;
  Classe := TFTipoCadastroCons;
end;

procedure TFConfiguracaoMarketplaceCad.DBP15OperacaoDefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOperacaoCons;
  Classe := TFOperacaoCons;
end;

procedure TFConfiguracaoMarketplaceCad.DBP15DepartamentoDefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FDepartamentoCons;
  Classe := TFDepartamentoCons;
end;

procedure TFConfiguracaoMarketplaceCad.DBP15VendedorDefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFConfiguracaoMarketplaceCad.BtCons15LoteTipoClick(
  Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = MrOk then
    DMConfiguracaoMarketplace.QConfiguracaoMarketplaceCOD_LOTE_TIPO.Value := DMTipoLote.QTipoLoteConsCOD_LOTE_TIPO.Value;
end;

procedure TFConfiguracaoMarketplaceCad.DSPrimarioStateChange(
  Sender: TObject);
begin
  inherited;
  DBNEmailNotificacao.Enabled := DSPrimario.State in [DsEdit, DsInsert];
end;

procedure TFConfiguracaoMarketplaceCad.DBPanel2DefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FRegiaoCons;
  Classe := TFRegiaoCons;
end;

procedure TFConfiguracaoMarketplaceCad.DsEmailNotificacaoStateChange(
  Sender: TObject);
begin
  inherited;
  if DsEmailNotificacao.State in [dsInsert] then
  begin
    DBPEmailNotificacao.SetFocus;
  end;
end;

end.

unit UUsuarioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Db, Menus, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, ImgList, DBDirceu, ActnList, DBPanel, Grids, DBGrids, Printers,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  UFmCadastro;

type
  TFUsuarioCad = class(TFTCadSimples)
    PCUsuario: TPageControl;
    TSUsuario: TTabSheet;
    TSPorta: TTabSheet;
    DSUsuarioPorta: TDataSource;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel7: TDBPanel;
    DBGUsuarioPorta: TDBGrid;
    BtIncluir: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtConfirmar: TBitBtn;
    BtCancelar: TBitBtn;
    DBPUsuario: TDBPanel;
    DBPSenha: TDBPanel;
    PrintDialog1: TPrintDialog;
    TabSheet1: TTabSheet;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    GroupBox1: TGroupBox;
    DBPImpressora: TDBPanel;
    DBPanel10: TDBPanel;
    sbImpressoraDacte: TSpeedButton;
    sbImpressora: TSpeedButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    MESenha: TMaskEdit;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel6: TDBPanel;
    GroupBox3: TGroupBox;
    DBPDepartamento: TDBPanel;
    DBPFilial: TDBPanel;
    DBPanel1: TDBPanel;
    DBRadioGroup2: TDBRadioGroup;
    GroupBox4: TGroupBox;
    DBPClientePadrao: TDBPanel;
    DBPOperacaoPadrao: TDBPanel;
    DBPVendedorPadrao: TDBPanel;
    DBPFinalidade: TDBPanel;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Modelo: TLabel;
    DBPSerieVista: TDBPanel;
    DBPanel13: TDBPanel;
    DBPanel11: TDBPanel;
    DBPanel12: TDBPanel;
    DBLCSerieModeloPadrao: TDBLookupComboBox;
    DBLCSerieModeloPrazo: TDBLookupComboBox;
    DBPCSerieCTe: TDBPanel;
    DBLCSerieModeloCTe: TDBLookupComboBox;
    Label3: TLabel;
    GroupBox6: TGroupBox;
    DBPanel15: TDBPanel;
    DBPanel14: TDBPanel;
    DBPanel16: TDBPanel;
    DBPTributacao: TDBPanel;
    DBPanel17: TDBPanel;
    sbImpressoraDanfeNFCe: TSpeedButton;
    DBPanel18: TDBPanel;
    DBPanel19: TDBPanel;
    sbImpressoraValeProduto: TSpeedButton;
    DBPanel20: TDBPanel;
    SpeedButton1: TSpeedButton;
    TabSheet4: TTabSheet;
    DBPEmail: TDBPanel;
    DBPanel21: TDBPanel;
    DBPSmtp: TDBPanel;
    DBPPortaSmtp: TDBPanel;
    DBCBSSL: TDBCheckBox;
    DBPanel22: TDBPanel;
    FmEntregadorPadrao: TFmCadastro;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure MESenhaExit(Sender: TObject);
    procedure MESenhaChange(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBPFilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPDepartamentoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPFinalidadeDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPOperacaoPadraoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPClientePadraoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPVendedorPadraoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel12DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel13DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure BtIncluirClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DSUsuarioPortaStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbImpressoraClick(Sender: TObject);
    procedure DBLCSerieModeloPadraoCloseUp(Sender: TObject);
    procedure DBLCSerieModeloPrazoCloseUp(Sender: TObject);
    procedure sbImpressoraDacteClick(Sender: TObject);
    procedure DBLCSerieModeloCTeCloseUp(Sender: TObject);
    procedure DBPTributacaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure sbImpressoraDanfeNFCeClick(Sender: TObject);
    procedure DBPanel18DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure sbImpressoraValeProdutoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FmEntregadorPadraoBtCadastroClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
  private
    procedure UpdateButtons;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuarioCad: TFUsuarioCad;

implementation

uses UUsuario_cl, UUsuarioCons, UBiblioteca, UVendedor_cl, UVendedorCons,
  UFilial_cl, UFilialCons, UDepartamento_cl, UDepartamentoCons,
  UFinalidade_cl, UFinalidadeCons, UOperacao_cl, UOperacaoCons,
  UCadastro_cl, UCadastroCons, USerie_cl, USerieCons, UOracle_cl,
  UTributacaoCons, UTributacao_cl;

{$R *.DFM}

procedure TFUsuarioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FUsuarioCons = Nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If FUsuarioCons.ShowModal = mrOk then
  With DMUsuario do
  Begin
    QUsuario.Close;
    QUsuario.SetVariable('PK',QUsuarioConsCod_Usuario.Value);
    QUsuario.Open;
    if (QUsuarioConsCOD_ENTREGADOR_PADRAO.Text <> '') then
    begin
      FmEntregadorPadrao.MeCadastro.Text := QUsuarioConsCOD_ENTREGADOR_PADRAO.Text;
      FmEntregadorPadrao.MeCadastroExit(Sender);
    end;
  End;
end;

procedure TFUsuarioCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMUsuario.QUsuario.Open;
  if (DMUsuario.QUsuarioCOD_ENTREGADOR_PADRAO.Text <> '') then
  begin
    FmEntregadorPadrao.MeCadastro.Text := DMUsuario.QUsuarioCOD_ENTREGADOR_PADRAO.Text;
    FmEntregadorPadrao.MeCadastroExit(Sender);
  end;
end;

procedure TFUsuarioCad.MESenhaExit(Sender: TObject);
Const wBranco : String = '         ';
Var wSenha : String;
begin
  inherited;
  If Trim(MESenha.Text) <> '' Then
    Begin
    If DMUsuario.QUsuario.State in [dsEdit,dsInsert] Then
    Begin
      wSenha := Trim(UpperCase(MESenha.Text));
      wSenha := wSenha + Copy(wBranco,1,10-Length(wSenha));
      DMUsuario.QUsuarioDesc_Senha.Text := Bib.Encode(wSenha);
    End;
  End;
  MESenha.Text := '';
end;

procedure TFUsuarioCad.MESenhaChange(Sender: TObject);
begin
  inherited;
  If Not (DMUsuario.QUsuario.State in [dsEdit,dsInsert]) Then
    DMUsuario.QUsuario.Edit;
end;

procedure TFUsuarioCad.SBCancelarClick(Sender: TObject);
begin
//  DBENome.SetFocus;
  MESenhaExit(Self);
  MESenha.Text := '';
  if ModoAlteracao(DSUsuarioPorta) then
    DMUsuario.QUsuarioPorta.Cancel;
  inherited;
  SBRefreshClick(SBRefresh);
end;

procedure TFUsuarioCad.SBConfirmarClick(Sender: TObject);
begin
//  DBENome.SetFocus;
  if Trim(FmEntregadorPadrao.MeCadastro.Text) <> '' then
    DMUsuario.QUsuarioCOD_ENTREGADOR_PADRAO.Text := Trim(FmEntregadorPadrao.MeCadastro.Text);
  MESenhaExit(Self);
  MESenha.Text := '';
  if DSUsuarioPorta.State in [DsEdit, DsInsert] then
    try
      DMUsuario.QUsuarioPorta.Post;
    except
      DMUsuario.QUsuarioPorta.Cancel;
    end;
  inherited;
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
end;

procedure TFUsuarioCad.DBPFilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFUsuarioCad.DBPDepartamentoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FDepartamentoCons;
  Classe := TFDepartamentoCons;
end;

procedure TFUsuarioCad.DBPFinalidadeDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFinalidadeCons;
  Classe := TFFinalidadeCons;
end;

procedure TFUsuarioCad.DBPOperacaoPadraoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOperacaoCons;
  Classe := TFOperacaoCons;
end;

procedure TFUsuarioCad.DBPClientePadraoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFUsuarioCad.DBPVendedorPadraoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFUsuarioCad.DBPanel12DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FSerieCons;
  Classe := TFSerieCons;
end;

procedure TFUsuarioCad.DBPanel13DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FSerieCons;
  Classe := TFSerieCons;
end;

procedure TFUsuarioCad.BtIncluirClick(Sender: TObject);
begin
  inherited;
  if ModoAlteracao then
    DMUsuario.QUsuarioPorta.Append;
end;

procedure TFUsuarioCad.BtEditarClick(Sender: TObject);
begin
  inherited;
  if ModoAlteracao then
    DMUsuario.QUsuarioPorta.Edit;
end;

procedure TFUsuarioCad.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (ModoAlteracao) and (MessageDlg('Tem certeza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    DMUsuario.QUsuarioPorta.Delete;
end;

procedure TFUsuarioCad.BtConfirmarClick(Sender: TObject);
begin
  inherited;
  if (ModoAlteracao) and (ValidaCampos(Self, DSUsuarioPorta)) then
      DMUsuario.QUsuarioPorta.Post;
end;

procedure TFUsuarioCad.BtCancelarClick(Sender: TObject);
begin
  inherited;
  if ModoAlteracao then
    DMUsuario.QUsuarioPorta.Cancel;
end;

procedure TFUsuarioCad.UpdateButtons;
var
  p, f: boolean;
begin
  p := ModoAlteracao;
  f := ModoAlteracao(DSUsuarioPorta);
  BtIncluir.Enabled := (p and (not f));
  BtEditar.Enabled := (p and (not f));
  BtExcluir.Enabled := (p and (not f));
  BtConfirmar.Enabled := (p and f);
  BtCancelar.Enabled := (p and f);
  SbImpressora.Enabled := (p and (not f));
  sbImpressoraDacte.Enabled := (p and (not f));
  sbImpressoraDanfeNFCe.Enabled := (p and (not f));
  sbImpressoraValeProduto.Enabled := (p and (not f));
end;

procedure TFUsuarioCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  UpdateButtons;
  DBLCSerieModeloPadrao.Enabled := not (DSPrimario.DataSet.State = DSBrowse);
  DBLCSerieModeloPrazo.Enabled := not (DSPrimario.DataSet.State = DSBrowse);
  DBLCSerieModeloCTe.Enabled := not (DSPrimario.DataSet.State = DSBrowse);
end;

procedure TFUsuarioCad.DSUsuarioPortaStateChange(Sender: TObject);
begin
  inherited;
  UpdateButtons;
end;

procedure TFUsuarioCad.FormCreate(Sender: TObject);
begin
  inherited;
  Bib.addControleCharCase(DBPSenha, Self.Name);
  Bib.addControleCharCase(DBPImpressora, Self.Name);
  if (DMUsuario.QUsuarioCOD_ENTREGADOR_PADRAO.Text <> '') then
  begin
    FmEntregadorPadrao.MeCadastro.Text := DMUsuario.QUsuarioCOD_ENTREGADOR_PADRAO.Text;
    FmEntregadorPadrao.MeCadastroExit(Sender);
  end;
end;

procedure TFUsuarioCad.sbImpressoraClick(Sender: TObject);
begin
  DMUsuario.QUsuarioDESC_IMPRESSORA_DANFE.Value := Bib.SelecionaImpressora(Self);;
end;

procedure TFUsuarioCad.DBLCSerieModeloPadraoCloseUp(Sender: TObject);
begin
  inherited;
  with DMUsuario do
  begin
    DBLCSerieModeloPadrao.Hint :=
      QSerieModeloConsDESC_COMPLETA.Value;
    if QSerieModeloConsCOD_SERIE_MODELO.IsNull then
      QUsuarioCOD_SERIE_MODELO_PADRAO.Clear;
  end;
end;

procedure TFUsuarioCad.DBLCSerieModeloPrazoCloseUp(Sender: TObject);
begin
  inherited;
  with DMUsuario do
  begin
    DBLCSerieModeloPrazo.Hint :=
      QSerieModeloPrazoConsDESC_COMPLETA.Value;
    if QSerieModeloPrazoConsCOD_SERIE_MODELO.IsNull then
      QUsuarioCOD_SERIE_MODELO_PRAZO.Clear;
  end;
end;

procedure TFUsuarioCad.sbImpressoraDacteClick(Sender: TObject);
begin
  DMUsuario.QUsuarioDESC_IMPRESSORA_DACTE.Value := Bib.SelecionaImpressora(Self);;
end;

procedure TFUsuarioCad.DBLCSerieModeloCTeCloseUp(Sender: TObject);
begin
  inherited;
  with DMUsuario do
  begin
    DBLCSerieModeloCTe.Hint :=
      QSerieModeloConsDESC_COMPLETA.Value;
    if QSerieModeloConsCOD_SERIE_MODELO.IsNull then
      QUsuarioCOD_SERIE_MODELO_CTE.Clear;
  end;
end;

procedure TFUsuarioCad.DBPTributacaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTributacaoCons;
  Classe := TFTributacaoCons;
end;

procedure TFUsuarioCad.sbImpressoraDanfeNFCeClick(Sender: TObject);
begin
  DMUsuario.QUsuarioDESC_IMPRESSORA_DANFE_NFCE.Value := Bib.SelecionaImpressora(Self);
end;

procedure TFUsuarioCad.DBPanel18DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFinalidadeCons;
  Classe := TFFinalidadeCons;
end;

procedure TFUsuarioCad.sbImpressoraValeProdutoClick(Sender: TObject);
begin
  DMUsuario.QUsuarioDESC_IMPRESSORA_VALE_PRODUTO.Value := Bib.SelecionaImpressora(Self);
end;

procedure TFUsuarioCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DMUsuario.QUsuarioDESC_IMPRESSORA_ZEBRA_EPL.Value := Bib.SelecionaImpressora(Self);
end;

procedure TFUsuarioCad.FmEntregadorPadraoBtCadastroClick(Sender: TObject);
var
  wTipoCadastro : String;
begin
  inherited;
//  FmCadastro1.BtCadastroClick(Sender);
  wTipoCadastro := DMOracle.FastSelect('COD_TIPO_CADASTRO','TB_TIPO_CADASTRO','DESC_TIPO_CADASTRO = ' + chr(39) + 'ENTREGADOR' + chr(39) );
  if FCadastroCons = Nil then
  begin
    FCadastroCons := TFCadastroCons.Create(Application);
    FCadastroCons.METipoCadastro.Text := wTipoCadastro;
    FCadastroCons.METipoCadastro.ReadOnly := True;
    FCadastroCons.BtConsTipoCadastro.Enabled := false
  end;
  if FCadastroCons.ShowModal = mrOk then
  begin
    FCadastroCons.METipoCadastro.Text := wTipoCadastro;
    FCadastroCons.METipoCadastro.ReadOnly := True;
    FCadastroCons.BtConsTipoCadastro.Enabled := false;
    FmEntregadorPadrao.MeCadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    DMUsuario.QUsuarioCOD_ENTREGADOR_PADRAO.Text := Trim(FmEntregadorPadrao.MeCadastro.Text);
    FmEntregadorPadrao.MeCadastroExit(Sender);
  end;
end;

procedure TFUsuarioCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  if Trim(FmEntregadorPadrao.MeCadastro.Text) <> '' then
    DMUsuario.QUsuarioCOD_ENTREGADOR_PADRAO.Text := Trim(FmEntregadorPadrao.MeCadastro.Text);
end;

procedure TFUsuarioCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if Trim(FmEntregadorPadrao.MeCadastro.Text) <> '' then
    DMUsuario.QUsuarioCOD_ENTREGADOR_PADRAO.Text := Trim(FmEntregadorPadrao.MeCadastro.Text);
end;

end.

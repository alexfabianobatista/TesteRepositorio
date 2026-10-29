unit UConhecimentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Buttons, StdCtrls, Db, Grids, DBGrids, Mask, DBCtrls,
  ExtCtrls, variants, UFmFilial, UFmCadastro, Menus, ComCtrls, ActnList;

type
  TFConhecimentoCons = class(TFTConsulta)
    Label3: TLabel;
    MEDTini: TMaskEdit;
    Label4: TLabel;
    EDNum_Nota: TEdit;
    RgSituacao: TRadioGroup;
    Label6: TLabel;
    MePlaca: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    EdCodContrato: TEdit;
    EdNumContrato: TEdit;
    Label10: TLabel;
    EdCodProduto: TEdit;
    SpeedButton4: TSpeedButton;
    RgContratos: TRadioGroup;
    Label11: TLabel;
    MeDtFim: TMaskEdit;
    FmFilialCons: TFmFilial;
    FmCadastroRemetente: TFmCadastro;
    FmCadastroDestinatario: TFmCadastro;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    LBVariosRegistros: TLabel;
    FmCadastroMotorista: TFmCadastro;
    FmCadastroTomador: TFmCadastro;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure EDNum_NotaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoCons: TFConhecimentoCons;

implementation

uses UConhecimento_cl, UCadastroCons, UFilialCons, UCadastro_cl, UFilial_cl,
  UNotaSaidaCons, UNotaSaida_cl, UContratoVenda_Cons, Ucontrato_cl,
  UProdutoCons, UProduto_cl, UUsuario_cl, UNotaEntradaCons, UNotaEntrada_cl,
  UParamSistema_cl;

{$R *.DFM}

procedure TFConhecimentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMConhecimento.QConhecimentoCons.close;
  DMConhecimento.QConhecimentoCons.ClearVariables;
  DmUsuario.Checar_Filial_Usuario( Trim(FmFilialCons.MeFilial.Text),'CONHECIMENTO');
  with DMConhecimento do
  Begin
    if Trim(FmCadastroTomador.MeCadastro.Text) = '' then
      QConhecimentoCons.SetVariable('COD_CADASTRO_TOMADOR', Null)
    else
      QConhecimentoCons.SetVariable('COD_CADASTRO_TOMADOR', Trim(FmCadastroTomador.MeCadastro.Text));

    if Trim(FmCadastroRemetente.MeCadastro.Text) = '' then
      QConhecimentoCons.SetVariable('COD_CADASTRO_REMETENTE', Null)
    else
      QConhecimentoCons.SetVariable('COD_CADASTRO_REMETENTE', Trim(FmCadastroRemetente.MeCadastro.Text));

    if Trim(FmCadastroMotorista.MeCadastro.Text) = '' then
      QConhecimentoCons.SetVariable('COD_MOTORISTA', Null)
    else
      QConhecimentoCons.SetVariable('COD_MOTORISTA', Trim(FmCadastroMotorista.MeCadastro.Text));

    if Trim(FmCadastroDestinatario.MeCadastro.Text) = '' then
      QConhecimentoCons.SetVariable('COD_CADASTRO_DESTINATARIO', Null)
    else
      QConhecimentoCons.SetVariable('COD_CADASTRO_DESTINATARIO', Trim(FmCadastroDestinatario.MeCadastro.Text));

    if Trim(METexto.text) = '' then
      QConhecimentoCons.SetVariable('NUM_CONHECIMENTO', NULL)
    else
      QConhecimentoCons.SetVariable('NUM_CONHECIMENTO',METexto.Text);

    if Trim(EdCodContrato.text) = '' then
      QConhecimentoCons.SetVariable('Cod_Contrato_Vend', NULL)
    else
      QConhecimentoCons.SetVariable('Cod_Contrato_Vend',Trim(EdCodContrato.text));

    if trim(EDNum_Nota.Text) = '' then
      QConhecimentoCons.SetVariable('NUM_NOTA', NULL)
    else
      QConhecimentoCons.SetVariable('NUM_NOTA', StrToInt(trim(EDNum_Nota.Text)));

    if trim(MeDtIni.text) = '' then
      QConhecimentoCons.SetVariable('DT_EMISSAO_INI', NULL)
    else
      QConhecimentoCons.SetVariable('DT_EMISSAO_INI', MeDtIni.text);
      
    if trim(MeDtFim.text) = '' then
      QConhecimentoCons.SetVariable('DT_EMISSAO_FIM', NULL)
    else
      QConhecimentoCons.SetVariable('DT_EMISSAO_FIM', MeDtFim.text);

    if Trim(FmFilialCons.MeFilial.Text) = '' then
      QConhecimentoCons.SetVariable('COD_FILIAL', NULL)
    else
      QConhecimentoCons.SetVariable('COD_FILIAL',Trim(FmFilialCons.MeFilial.Text));

    if Trim(EdCodProduto.text) = '' then
      QConhecimentoCons.SetVariable('Cod_Produto', NULL)
    else
      QConhecimentoCons.SetVariable('Cod_Produto',EdCodProduto.text);

    if Trim(MePlaca.text) = '' then
      QConhecimentoCons.SetVariable('Desc_Placa', NULL)
    else
      QConhecimentoCons.SetVariable('Desc_Placa',MePlaca.text);
    Case RgSituacao.ItemIndex Of
      0 : QConhecimentoCons.SetVariable('Situacao','1');
      1 : QConhecimentoCons.SetVariable('Situacao','2');
      2 : QConhecimentoCons.SetVariable('Situacao','3');
      3 : QConhecimentoCons.SetVariable('Situacao',Null);
    End;
    QConhecimentoCons.SQL[QConhecimentoCons.SQL.Count -1]:='';
    Case RgContratos.ItemIndex Of
      0 : QConhecimentoCons.SQL.Add(' And TB_CONHECIMENTO.COD_CONTRATO_VEND > 0 ORDER BY NUM_CONHECIMENTO');
      1 : QConhecimentoCons.SQL.Add(' And TB_CONHECIMENTO.COD_CONTRATO_VEND Is Null ORDER BY NUM_CONHECIMENTO');
      2 : QConhecimentoCons.SQL.Add(' ORDER BY NUM_CONHECIMENTO');
    End;
    DMConhecimento.QConhecimentoCons.open;
  end;
end;

procedure TFConhecimentoCons.FormActivate(Sender: TObject);
begin
  inherited;
  EDNumContrato.Clear;
  EDCodContrato.Clear;
  MEDTini.Text := DateToStr(Date);
  MeDtFim.Text := DateToStr(Date);
end;

procedure TFConhecimentoCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
     FContrato_VendaCons:=TFContrato_VendaCons.create(application);
  if FContrato_VendaCons.showmodal = mrOk then
  Begin
     EdNumContrato.text:=DMContrato.QContrato_VendConsNum_Contrato.Text;
     EdCodContrato.text:=DMContrato.QContrato_VendConsCod_Contrato_Vend.Text;
  end;

end;

procedure TFConhecimentoCons.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons:= TFProdutoCons.create(application);
  if FProdutoCons.showmodal = mrOk then
    EdCodProduto.Text:=DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFConhecimentoCons.EDNum_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08,#13,#27,#42] ) then
    key:=#0;
end;

end.

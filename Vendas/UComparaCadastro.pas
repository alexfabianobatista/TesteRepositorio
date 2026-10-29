unit UComparaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ExtCtrls, OracleNavigator, Buttons;

type
  TFComparaCadastro = class(TForm)
    Label1: TLabel;
    DsInfoCadastroPedido: TDataSource;
    DsInfoCadastro: TDataSource;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText8: TDBText;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    DBText9: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    DBText22: TDBText;
    DBText23: TDBText;
    DBText24: TDBText;
    DBText25: TDBText;
    DBText26: TDBText;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText29: TDBText;
    DBText30: TDBText;
    DBText31: TDBText;
    DBText32: TDBText;
    DBText33: TDBText;
    DBText34: TDBText;
    DBText35: TDBText;
    DBText36: TDBText;
    OracleNavigator1: TOracleNavigator;
    BtnPedido: TBitBtn;
    BtnCadastro: TBitBtn;
    Label38: TLabel;
    Label39: TLabel;
    DBText37: TDBText;
    DBText38: TDBText;
    DBText39: TDBText;
    DBText40: TDBText;
    BtnCancelar: TBitBtn;
    LRegistro: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnPedidoClick(Sender: TObject);
    procedure BtnCadastroClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DsInfoCadastroDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    codCliente: Integer;
    ok, cancel: Boolean;
    function carregar(wPedido: Integer): Boolean;
    { Public declarations }
  end;

var
  FComparaCadastro: TFComparaCadastro;

implementation

uses UOracle_cl, UCadastro_cl, UParamSistema_cl, UNotaSaida_cl;

{$R *.dfm}

function TFComparaCadastro.carregar(wPedido: Integer): Boolean;
var wCodCadastro: string;
begin
  with DMNotaSaida do
  begin
  QInfoCadastroPedido.Close;
  QInfoCadastroPedido.SetVariable('COD_PEDIDO_CAB', wPedido);
  QInfoCadastroPedido.Open;

  QInfoCadastro.Close;
  QInfoCadastro.SetVariable('NUM_CGC_CPF', QInfoCadastroPedidoNUM_CGC_CPF.Value);
  QInfoCadastro.Open;

  codCliente := -1;
  ok := False;
  cancel := False;

  if QInfoCadastro.IsEmpty then
    BtnPedido.Click
  else
    ShowModal;
  Result := ok and not cancel;
  end;
end;

procedure TFComparaCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not ok then
    cancel := True;
end;

procedure TFComparaCadastro.BtnPedidoClick(Sender: TObject);
var seq: Integer;
begin
  seq := StrToInt(DMOracle.FastSelect('SQCADASTRO.NEXTVAL', 'DUAL'));

  with DMNotaSaida do
  begin
  DMCadastro.QInsCadastro.Close;
  DMCadastro.QInsCadastro.SetVariable('COD_CADASTRO', seq);
  DMCadastro.QInsCadastro.SetVariable('COD_TIPO_CADASTRO', DMOracle.FastSelect('COD_TIPO_CADASTRO_CLIENTE', 'TB_PARAM_SISTEMA'));
  DMCadastro.QInsCadastro.SetVariable('NOME', QInfoCadastroPedidoDESC_NOME.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_FANTASIA', QInfoCadastroPedidoDESC_FANTASIA.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_ENDERECO', QInfoCadastroPedidoDESC_ENDERECO.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_CIDADE', QInfoCadastroPedidoDESC_CIDADE.Value);
  DMCadastro.QInsCadastro.SetVariable('COD_ESTADO', QInfoCadastroPedidoCOD_ESTADO.Value);
  DMCadastro.QInsCadastro.SetVariable('IND_SEXO_CATEGORIA', QInfoCadastroPedidoIND_SEXO_CATEGORIA.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_INTEGRACAO', QInfoCadastroPedidoDESC_INTEGRACAO.Value);
  DMCadastro.QInsCadastro.SetVariable('IND_FISICA_JURIDICA', QInfoCadastroPedidoIND_FISICA_JURIDICA.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_BAIRRO', QInfoCadastroPedidoDESC_BAIRRO.Value);
  DMCadastro.QInsCadastro.SetVariable('COD_CIDADE', QInfoCadastroPedidoCOD_CIDADE.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_CEP', QInfoCadastroPedidoDESC_CEP.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_TELEFONE', QInfoCadastroPedidoDESC_TELEFONE.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_CELULAR', QInfoCadastroPedidoDESC_CELULAR.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_E_MAIL', QInfoCadastroPedidoDESC_E_MAIL.Value);
  DMCadastro.QInsCadastro.SetVariable('NUM_CGC_CPF', QInfoCadastroPedidoNUM_CGC_CPF.Value);
  DMCadastro.QInsCadastro.SetVariable('NUM_INSCRICAO', QInfoCadastroPedidoNUM_INSCRICAO.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_BANCO', QInfoCadastroPedidoDESC_BANCO.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_AGENCIA', QInfoCadastroPedidoDESC_AGENCIA.Value);
  DMCadastro.QInsCadastro.SetVariable('DESC_AGENCIA_TELEFONE', QInfoCadastroPedidoDESC_AGENCIA_TELEFONE.Value);
  DMCadastro.QInsCadastro.ExecSQL;
  end;

  codCliente := seq;
  ok := True;
  Close;
end;

procedure TFComparaCadastro.BtnCadastroClick(Sender: TObject);
begin
  codCliente := DMNotaSaida.QInfoCadastroCOD_CADASTRO.Value;
  ok := True;
  Close;
end;

procedure TFComparaCadastro.BtnCancelarClick(Sender: TObject);
begin
  cancel := True;
  Close;
end;

procedure TFComparaCadastro.DsInfoCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  LRegistro.Caption := IntToStr(DsInfoCadastro.DataSet.RecNo) + ' de ' + IntToStr(DsInfoCadastro.DataSet.RecordCount);

  with DMNotaSaida do
  begin
    if QInfoCadastroPedidoDESC_NOME.Value <> QInfoCadastroNOME.Value then DBText9.Font.Color := clRed else DBText9.Font.Color := clWindowText;
    if QInfoCadastroPedidoDESC_FANTASIA.Value <> QInfoCadastroDESC_FANTASIA.Value then DBText21.Font.Color := clRed else DBText21.Font.Color := clWindowText;
    if QInfoCadastroPedidoIND_SEXO_CATEGORIA.Value <> QInfoCadastroIND_SEXO_CATEGORIA.Value then DBText30.Font.Color := clRed else DBText30.Font.Color := clWindowText;

    if QInfoCadastroPedidodesc_fisica_juridica.Value <> QInfoCadastrodesc_fisica_juridica.Value then DBText22.Font.Color := clRed else DBText22.Font.Color := clWindowText;
    if QInfoCadastroPedidoNUM_CGC_CPF.Value <> QInfoCadastroNUM_CGC_CPF.Value then DBText20.Font.Color := clRed else DBText20.Font.Color := clWindowText;
    if QInfoCadastroPedidoNUM_INSCRICAO.Value <> QInfoCadastroNUM_INSCRICAO.Value then DBText23.Font.Color := clRed else DBText23.Font.Color := clWindowText;

    if QInfoCadastroPedidoDESC_INTEGRACAO.Value <> QInfoCadastroDESC_INTEGRACAO.Value then DBText24.Font.Color := clRed else DBText24.Font.Color := clWindowText;

    if QInfoCadastroPedidoDESC_ENDERECO.Value <> QInfoCadastroDESC_ENDERECO.Value then DBText25.Font.Color := clRed else DBText25.Font.Color := clWindowText;
    if QInfoCadastroPedidoDESC_BAIRRO.Value <> QInfoCadastroDESC_BAIRRO.Value then DBText36.Font.Color := clRed else DBText36.Font.Color := clWindowText;
    if QInfoCadastroPedidoDESC_CEP.Value <> QInfoCadastroDESC_CEP.Value then DBText26.Font.Color := clRed else DBText26.Font.Color := clWindowText;
    if QInfoCadastroPedidoCOD_CIDADE.Value <> QInfoCadastroCOD_CIDADE.Value then DBText34.Font.Color := clRed else DBText34.Font.Color := clWindowText;
    if QInfoCadastroPedidoCOD_ESTADO.Value <> QInfoCadastroCOD_ESTADO.Value then DBText35.Font.Color := clRed else DBText35.Font.Color := clWindowText;
    if QInfoCadastroPedidoDESC_TELEFONE.Value <> QInfoCadastroDESC_TELEFONE.Value then DBText27.Font.Color := clRed else DBText27.Font.Color := clWindowText;
    if QInfoCadastroPedidoDESC_CELULAR.Value <> QInfoCadastroDESC_CELULAR.Value then DBText28.Font.Color := clRed else DBText28.Font.Color := clWindowText;
    if QInfoCadastroPedidoDESC_E_MAIL.Value <> QInfoCadastroDESC_E_MAIL.Value then DBText29.Font.Color := clRed else DBText29.Font.Color := clWindowText;

    if QInfoCadastroPedidoDESC_BANCO.Value <> QInfoCadastroDESC_BANCO.Value then DBText31.Font.Color := clRed else DBText31.Font.Color := clWindowText;
    if QInfoCadastroPedidoDESC_AGENCIA.Value <> QInfoCadastroDESC_AGENCIA.Value then DBText32.Font.Color := clRed else DBText32.Font.Color := clWindowText;
    if QInfoCadastroPedidoDESC_AGENCIA_TELEFONE.Value <> QInfoCadastroDESC_AGENCIA_TELEFONE.Value then DBText33.Font.Color := clRed else DBText33.Font.Color := clWindowText;
  end;
end;

end.


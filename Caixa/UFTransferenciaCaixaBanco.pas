unit UFTransferenciaCaixaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmHistorico, UFmFilial, StdCtrls, Buttons, UFmDepartamento,
  Mask, UFmContaCorrente, UFmCadastro;

type
  TFTransferenciaCaixaBanco = class(TForm)
    FmHistoricoCaixa: TFmHistorico;
    FmHistoricoBanco: TFmHistorico;
    FmFilial1: TFmFilial;
    Label1: TLabel;
    MeDtLancamento: TMaskEdit;
    Label2: TLabel;
    MeValor: TMaskEdit;
    FmDepartamento1: TFmDepartamento;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    FmContaCorrente1: TFmContaCorrente;
    Label3: TLabel;
    MeComplemento: TMaskEdit;
    FmCadastro1: TFmCadastro;
    procedure BtCancelaClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransferenciaCaixaBanco: TFTransferenciaCaixaBanco;

implementation
uses UBancoAgencia_cl, UCaixa_cl, UOracle_cl, UUsuario_cl, UParamSistema_cl;
{$R *.dfm}

procedure TFTransferenciaCaixaBanco.BtCancelaClick(Sender: TObject);
begin
  Exit;
end;

procedure TFTransferenciaCaixaBanco.BtOkClick(Sender: TObject);
var
  wCodCadastro : Integer;
  wDescComplemento: String;
begin
  try
    if Trim(FmCadastro1.MeCadastro.Text) = '' then
      wCodCadastro := 1
    else
      wCodCadastro := StrToInt(Trim(FmCadastro1.MeCadastro.Text));
    if Trim(MeComplemento.Text) = '' then
      wDescComplemento := ''
    else
      wDescComplemento := Trim(MeComplemento.Text);

    DMCaixa.IncluiCaixa(StrToInt(Trim(FmFilial1.MeFilial.Text)), // Filial
                      StrToInt(Trim(FmDepartamento1.MeDepartamento.Text)),//departamento
                      StrToInt(Trim(FmHistoricoCaixa.MeHistorico.Text)),//Historico Caixa
                      StrToFloat(MeValor.Text), // valor
                      0,//num_doc
                      wCodCadastro,//StrToInt(Trim(FmCadastro1.MeCadastro.Text)),//cod_cadastro
                      wDescComplemento,//(Trim(MeComplemento.Text)), //complemento
                      StrToDate(MeDtLancamento.Text), //data Lançamento
                      '',  //cod_conta_pagar_cab
                      '',  //cod_conta_receber_cab
                      '', //contrato_mov
                      ''); //conhecimento

    DMBancoAgencia.IncluiBanco(StrToInt(Trim(FmHistoricoBanco.MeHistorico.Text)),     // Histórico
                             StrToInt(Trim(FmContaCorrente1.MeContaCorrente.Text)), //C/C
                             0, //num_cheque
                             wCodCadastro,//StrToInt(Trim(FmCadastro1.MeCadastro.Text)),//cod_cadastro
                             StrToInt(Trim(FmDepartamento1.MeDepartamento.Text)), //Departamento
                             StrToDate(MeDtLancamento.Text), //data Lançamento
                             StrToFloat(MeValor.Text), // valor
                             'TRANSF. CAIXA/BANCOS', //OBS
                             wDescComplemento,//(Trim(MeComplemento.Text)),//COMPLEMENTO
                             '',//cod_conta_pagar_cab
                             '', //cod_conta_receber_cab
                             'N',//pagto_taxa
                             ''); //contrato_mov)
    ShowMessage('Laçamento efetuado com sucesso');
    FmHistoricoCaixa.MeHistorico.Clear;
    FmHistoricoBanco.MeHistorico.Clear;
    FmContaCorrente1.MeContaCorrente.Clear;
    FmCadastro1.MeCadastro.Clear;
    FmHistoricoCaixa.EdHistorico.Clear;
    FmHistoricoBanco.EdHistorico.Clear;
    FmContaCorrente1.EdContaCorrente.Clear;
    FmCadastro1.EdCadastro.Clear;
    MeDtLancamento.Clear;
    MeValor.Clear;
    MeComplemento.Clear;
   except
    DMOracle.DBCemapa.RollBack;
    raise Exception.Create('Erro ao fazer o lançamento. Verifique o preenchimento de todos os campos.');
  end;
end;

procedure TFTransferenciaCaixaBanco.FormActivate(Sender: TObject);
begin
  FmFilial1.MeFilial.Text             := FloatToStr(DMUsuario.CodFilialUsuario);
  FmDepartamento1.MeDepartamento.Text := FloatToStr(DMUsuario.CodDepartamentoUsuario);
  FmHistoricoCaixa.MeHistorico.Clear;
  FmHistoricoBanco.MeHistorico.Clear;
  FmContaCorrente1.MeContaCorrente.Clear;
  FmHistoricoCaixa.EdHistorico.Clear;
  FmHistoricoBanco.EdHistorico.Clear;
  FmContaCorrente1.EdContaCorrente.Clear;
end;

end.

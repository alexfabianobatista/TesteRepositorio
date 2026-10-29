unit UContratoFornecedorReajuste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFContratoFornecedorReajuste = class(TForm)
    Label89: TLabel;
    MeFilial: TMaskEdit;
    SpeedButton51: TSpeedButton;
    EdFilial: TMaskEdit;
    Label1: TLabel;
    MeCadastro: TMaskEdit;
    SpeedButton1: TSpeedButton;
    EdCadastro: TMaskEdit;
    Label2: TLabel;
    MeData: TMaskEdit;
    Label3: TLabel;
    MeMes: TMaskEdit;
    Label4: TLabel;
    MeIndice: TMaskEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure MeFilialChange(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure MeCadastroChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoFornecedorReajuste: TFContratoFornecedorReajuste;

implementation

uses UOracle_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UOrdemServico_cl;

{$R *.dfm}

procedure TFContratoFornecedorReajuste.MeFilialChange(Sender: TObject);
begin
   if Trim(MEFilial.Text)<>'' then
    Begin
      EdFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.Text);
    End
   else
    Begin
      MEFilial.Clear;
      EdFilial.Text := 'Todas';
    End;
end;

procedure TFContratoFornecedorReajuste.SpeedButton51Click(Sender: TObject);
begin
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MEFilial.Text:=DMFilial.QFilialConsCod_filial.Text;
      MEFilialChange(Self);
    end;
end;

procedure TFContratoFornecedorReajuste.MeCadastroChange(Sender: TObject);
begin
  if Trim(MECadastro.Text)<>'' then
    Begin
      EdCadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastro.Text);
    End
  else
    Begin
      MECadastro.Clear;
      EdCadastro.Text := 'Todos';
    End;  
end;

procedure TFContratoFornecedorReajuste.SpeedButton1Click(Sender: TObject);
begin
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
      MECadastroChange(Self);
    end;
end;

procedure TFContratoFornecedorReajuste.BtOkClick(Sender: TObject);
var
  wSQL, wDataCobranca, wUltimoReaj :String;
  wAjuste, wMes :Real;
  wData :TDateTime;
begin
  FormatFloat('#,##0.00',StrToFloat(MEIndice.Text));
  with DMOrdemServico do
  begin
    wData := strToDate(MeData.Text);
    QConsultaFornecedorReaj.close;
    if Trim(MeFilial.Text) <> '' then
      QConsultaFornecedorReaj.SetVariable('FILIAL', Trim(MeFilial.Text))
    else
      QConsultaFornecedorReaj.SetVariable('FILIAL', null);

    if Trim(MeCadastro.Text) <> '' then
      QConsultaFornecedorReaj.SetVariable('CADASTRO', Trim(MeCadastro.Text))
    else
      QConsultaFornecedorReaj.SetVariable('CADASTRO', null);

    if Trim(MeMes.Text) <> '' then
      QConsultaFornecedorReaj.SetVariable('ULTIMO_REAJUSTE', Trim(MeMes.Text))
    else
      QConsultaFornecedorReaj.SetVariable('ULTIMO_REAJUSTE', null);

    QConsultaFornecedorReaj.open;
    QConsultaFornecedorReaj.First;

    while not QConsultaFornecedorReaj.Eof do
    begin
      QContratoFornecedor.close;
      QContratoFornecedor.SetVariable('PK', QConsultaFornecedorReajCOD_CONTRATO_FORNECEDOR.Value);
      QContratoFornecedor.open;

      if(QContratoFornecedorIND_SITUACAO.Text = 'ATIVO') and (QContratoFornecedorDT_ULTIMO_REAJUSTE.Value <=  wData) then
      begin
        QContratoFornecedorReajuste.Open;
        QContratoFornecedorReajuste.Insert;
        QContratoFornecedorReajusteCOD_CONTRATO_FORNECEDOR.Text := QContratoFornecedorCOD_CONTRATO_FORNECEDOR.Text;
        QContratoFornecedorReajusteCOD_FILIAL.Text := QContratoFornecedorCOD_FILIAL.Text;
        QContratoFornecedorReajusteCOD_CADASTRO.Text := QContratoFornecedorCOD_CADASTRO.Text;
        QContratoFornecedorReajusteDT_REAJUSTE.Text := MeData.Text;
        wMes := StrToFloat(MeMes.Text);
        QContratoFornecedorReajusteMES_REAJUSTE.Text := FormatFloat('00',wMes);
        QContratoFornecedorReajusteINDICE_REAJUSTE.Text := MeIndice.Text;
        QContratoFornecedorReajuste.Post;

        wDataCobranca := QContratoFornecedorReajusteDT_REAJUSTE.Text;
        wDataCobranca := QContratoFornecedorNUM_DIA_VENCTO.Text + copy(wDataCobranca,3,8);
        wAjuste := QContratoFornecedorVAL_MENSALIDADE.Value * StrToFloat(MeIndice.Text) / 100;
        wAjuste := wAjuste + QContratoFornecedorVAL_MENSALIDADE.Value;

        QContratoFornecedor.Open;
        QContratoFornecedor.Edit;
        QContratoFornecedorVAL_MENSALIDADE.Value := wAjuste;
        QContratoFornecedorDT_ULTIMO_REAJUSTE.Text := QContratoFornecedorReajusteDT_REAJUSTE.Text;
        QContratoFornecedorMES_ULTIMO_REAJUSTE.Text := copy(QContratoFornecedorDT_ULTIMO_REAJUSTE.Text,4,2);
        QContratoFornecedorDT_INICIO_COBRANCA.Text := wDataCobranca;
        QContratoFornecedor.Post;

        DMOracle.DBCemapa.Commit;
        QContratoFornecedorReajuste.Close;
      end
      else
        ShowMessage('Contrato ' + QContratoFornecedorCOD_CONTRATO_FORNECEDOR.Text + ' não Reajustado' );

     QConsultaFornecedorReaj.Next;
    end;
    ShowMessage('Operação Concluida');
  end;
end;

procedure TFContratoFornecedorReajuste.FormActivate(Sender: TObject);
var
  wAno, wMes, wDia : word;
begin
  MeData.Text := DateToStr(Date); 
end;

end.

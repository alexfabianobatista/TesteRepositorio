unit UContratoFornecedor_Cp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask;

type
  TFContratoFornecedor_Cp = class(TForm)
    Label89: TLabel;
    MeFilial: TMaskEdit;
    SpeedButton51: TSpeedButton;
    EdFilial: TMaskEdit;
    Label31: TLabel;
    MECodBanco: TMaskEdit;
    SpeedButton18: TSpeedButton;
    MEBanco: TMaskEdit;
    Label1: TLabel;
    MeCadastro: TMaskEdit;
    SpeedButton1: TSpeedButton;
    EdCadastro: TMaskEdit;
    Label64: TLabel;
    MEFinalidade: TMaskEdit;
    SpeedButton39: TSpeedButton;
    EdFinalidade: TMaskEdit;
    Label33: TLabel;
    MEDataRef: TMaskEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure SpeedButton51Click(Sender: TObject);
    procedure MeFilialChange(Sender: TObject);
    procedure MECodBancoChange(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure MeCadastroChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MEFinalidadeChange(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoFornecedor_Cp: TFContratoFornecedor_Cp;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UBancosCons, UContasReceber_cl,
  UBancoAgencia_cl, UCadastroCons, UCadastro_cl, UFinalidadeCons,
  UFinalidade_cl, UContasPagar_cl, UOrdemServico_cl,
  UContratoFornecedorCad;

{$R *.dfm}

procedure TFContratoFornecedor_Cp.SpeedButton51Click(Sender: TObject);
begin
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MEFilial.Text:=DMFilial.QFilialConsCod_filial.Text;
      MEFilialChange(Self);
    end;
end;

procedure TFContratoFornecedor_Cp.MeFilialChange(Sender: TObject);
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

procedure TFContratoFornecedor_Cp.MECodBancoChange(Sender: TObject);
begin
  if Trim(MECodBanco.Text)<>'' then
    MEBanco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECodBanco.Text)
  else
    MEBanco.Clear;
end;

procedure TFContratoFornecedor_Cp.SpeedButton18Click(Sender: TObject);
begin
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    With DMContasReceber do
      Begin
        MECodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
      End;
end;

procedure TFContratoFornecedor_Cp.MeCadastroChange(Sender: TObject);
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

procedure TFContratoFornecedor_Cp.SpeedButton1Click(Sender: TObject);
begin
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
      MECadastroChange(Self);
    end;
end;

procedure TFContratoFornecedor_Cp.MEFinalidadeChange(Sender: TObject);
begin
   if Trim(MEFinalidade.Text)<>'' then
    EdFinalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MeFinalidade.Text)
  else
    MEFinalidade.Clear;
end;

procedure TFContratoFornecedor_Cp.SpeedButton39Click(Sender: TObject);
begin
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    With DMFinalidade do
      Begin
        MEFinalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);
      End;
end;

procedure TFContratoFornecedor_Cp.BtOkClick(Sender: TObject);
var
  wDataCobranca, wDataVencto :String;
  wAno, wMes, wDia :Word;
  wMesVencto : Real;
begin
  if FContratoFornecedorCad.DBRgContrato.ItemIndex = 0 then
  begin
    With DMContasPagar do
    Begin
      try


        If MeDataRef.Text = '' Then
          Raise Exception.Create('Informar Data de Referência');
        If MeFinalidade.Text = '' Then
          Raise Exception.Create('Informar Finalidade');


        DMOrdemServico.QContratoFornecedor.Edit;
        wDataCobranca := MEDataRef.Text;
        wDataCobranca := DMOrdemServico.QContratoFornecedorNUM_DIA_VENCTO.Text + copy(wDataCobranca,3,8);
        DMOrdemServico.QContratoFornecedorDT_INICIO_COBRANCA.Text := wDataCobranca;
        DMOrdemServico.QContratoFornecedor.Post;


        DMOrdemServico.QContratoFornecedor_CP.Close;
        DMOrdemServico.QContratoFornecedor_CP.SetVariable('DT_REFERENCIA',StrToDate(MeDataRef.Text));
        if Trim(MeCadastro.Text) = '' Then
          DMOrdemServico.QContratoFornecedor_CP.SetVariable('COD_CADASTRO',Null)
        Else
          DMOrdemServico.QContratoFornecedor_CP.SetVariable('COD_CADASTRO',MeCadastro.Text);
        If (MeFilial.Text) = '' Then
          DMOrdemServico.QContratoFornecedor_CP.SetVariable('COD_FILIAL',Null)
        Else
          DMOrdemServico.QContratoFornecedor_CP.SetVariable('COD_FILIAL',MeFilial.Text);
        DMOrdemServico.QContratoFornecedor_CP.Open;

        QChecaContasPagar.Close;  //checa se ja existe um lançamento no mesmo ano, caso exista nao poderá ser feito outro
        QChecaContasPagar.SetVariable('FILIAL', DMOrdemServico.QContratoFornecedor_CPCOD_FILIAL.Text);
        QChecaContasPagar.SetVariable('CADASTRO', DMOrdemServico.QContratoFornecedor_CPCOD_CADASTRO.Text);
        QChecaContasPagar.open;
        QChecaContasPagar.Last;
        if QChecaContasPagarDT_VENCIMENTO.Value > DMOrdemServico.QContratoFornecedor_CPDT_VENDA.Value then
          Raise Exception.Create('Já existe um contrato neste período');


        QContasPagar_Mov.Close;
        QContasPagar_cab.Close;
        QContasPagar_cab.Open;
        QContasPagar_Mov.Open;
        DmOracle.DBCemapa.StartTransaction;
        QContasPagar_Cab.Insert;

        if Trim(MEFinalidade.Text)<>'' then
          QContasPagar_cabCod_Finalidade.Value:=StrToInt(Trim(MEFinalidade.text));

        if Trim(MECodBanco.Text)<>'' then
          QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(MECodBanco.text));

        //if Trim(MECodDepartamento.Text)<>'' then
        //  QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(MECodDepartamento.text));

        QContasPagar_CabCod_Cadastro.Value:= DMOrdemServico.QContratoFornecedor_CPCOD_CADASTRO.Value;
        QContasPagar_CabCod_Filial.Value:=DMOrdemServico.QContratoFornecedor_CPCOD_FILIAL.Value;
        QContasPagar_CabDesc_tipo_Documento.Value:='FOB';
        QContasPagar_CabDT_EMISSAO.Value:=DMOrdemServico.QContratoFornecedor_CPDT_VENDA.value;
        DecodeDate(DMOrdemServico.QContratoFornecedor_CPDT_VENDA.value, wAno, wMes, wDia);
        wDataVencto := FloatToStr(wDia) +'/'+ FloatToStr(wMes) +'/'+ FloatToStr(wAno + 1);
        QContasPagar_CabDT_VENCIMENTO.Text := wDataVencto;
        QContasPagar_CabVAL_TITULO.Value:=DMOrdemServico.QContratoFornecedor_CPVAL_CONTRATO.Value;
        QContasPagar_CabNUM_TITULO.Value:=DMOrdemServico.QContratoFornecedor_CPCOD_CONTRATO_FORNECEDOR.Value;
        QContasPagar_CabIND_ACEITE.Value:='NAO';
        QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
        QContasPagar_CabDESC_OBSERVACAO.Value:='Referente ao Contrato nr.'+DMOrdemServico.QContratoFornecedor_CPCOD_CONTRATO_FORNECEDOR.Text;
        QCOntasPagar_Cab.Post;

        ShowMessage('Contas a pagar gerado');
        //QConhecimentoCadCod_Conta_Pagar_Cab.Value := QContasPagar_CabCod_Conta_Pagar_Cab.Value;
      Except
        DMOracle.DBCemapa.RollBack;
        Raise;
      End;

      DMOracle.DBCemapa.Commit;
      QContasPagar_Mov.Close;
      QContasPagar_cab.Close;

    end;
  end;

  if FContratoFornecedorCad.DBRgContrato.ItemIndex = 1 then
  begin
    With DMContasPagar do
    Begin
      try

        If MeDataRef.Text = '' Then
          Raise Exception.Create('Informar Data de Referência');
        If MeFinalidade.Text = '' Then
          Raise Exception.Create('Informar Finalidade');

        DMOrdemServico.QContratoFornecedor.Edit;
        wDataCobranca := MEDataRef.Text;
        wDataCobranca := DMOrdemServico.QContratoFornecedorNUM_DIA_VENCTO.Text + copy(wDataCobranca,3,8);
        DMOrdemServico.QContratoFornecedorDT_INICIO_COBRANCA.Text := wDataCobranca;
        DMOrdemServico.QContratoFornecedor.Post;

        QContasPagar_Mov.Close;
        QContasPagar_cab.Close;
        QContasPagar_cab.Open;
        QContasPagar_Mov.Open;
        QContasPagar_Cab.Insert;


        DMOrdemServico.QContratoFornecedor_CP.Close;
        DMOrdemServico.QContratoFornecedor_CP.SetVariable('DT_REFERENCIA',StrToDate(MeDataRef.Text));
        if Trim(MeCadastro.Text) = '' Then
          DMOrdemServico.QContratoFornecedor_CP.SetVariable('COD_CADASTRO',Null)
        Else
          DMOrdemServico.QContratoFornecedor_CP.SetVariable('COD_CADASTRO',MeCadastro.Text);
        If (MeFilial.Text) = '' Then
          DMOrdemServico.QContratoFornecedor_CP.SetVariable('COD_FILIAL',Null)
        Else
          DMOrdemServico.QContratoFornecedor_CP.SetVariable('COD_FILIAL',MeFilial.Text);
        DMOrdemServico.QContratoFornecedor_CP.Open;

        if Trim(MEFinalidade.Text)<>'' then
          QContasPagar_cabCod_Finalidade.Value:=StrToInt(Trim(MEFinalidade.text));

        if Trim(MECodBanco.Text)<>'' then
          QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(MECodBanco.text));

        //if Trim(MECodDepartamento.Text)<>'' then
        //  QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(MECodDepartamento.text));

        QContasPagar_CabCod_Cadastro.Value:= DMOrdemServico.QContratoFornecedor_CPCOD_CADASTRO.Value;
        QContasPagar_CabCod_Filial.Value:=DMOrdemServico.QContratoFornecedor_CPCOD_FILIAL.Value;
        QContasPagar_CabDesc_tipo_Documento.Value:='FOB';
        QContasPagar_CabDT_EMISSAO.Value:=DMOrdemServico.QContratoFornecedor_CPDT_VENDA.value;
        DecodeDate(DMOrdemServico.QContratoFornecedor_CPDT_VENDA.value, wAno, wMes, wDia);
        if (wMes + 1) > 12 then
        begin
          wMesVencto := 1;
          Inc(wAno);
        end
        else
          wMesVencto := wMes + 1;
        wDataVencto := FloatToStr(wDia) +'/'+ FloatToStr(wMesVencto) +'/'+ FloatToStr(wAno);
        QContasPagar_CabDT_VENCIMENTO.Text := wDataVencto;
        QContasPagar_CabVAL_TITULO.Value:=DMOrdemServico.QContratoFornecedor_CPVAL_MENSALIDADE.Value;
        QContasPagar_CabNUM_TITULO.Value:=DMOrdemServico.QContratoFornecedor_CPCOD_CONTRATO_FORNECEDOR.Value;
        QContasPagar_CabIND_ACEITE.Value:='NAO';
        QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
        QContasPagar_CabDESC_OBSERVACAO.Value:='Referente ao Contrato nr.'+DMOrdemServico.QContratoFornecedor_CPCOD_CONTRATO_FORNECEDOR.Text;
        QCOntasPagar_Cab.Post;

        ShowMessage('Contas a pagar gerado');
        //QConhecimentoCadCod_Conta_Pagar_Cab.Value := QContasPagar_CabCod_Conta_Pagar_Cab.Value;
      Except
        DMOracle.DBCemapa.RollBack;
        Raise;
      End;

      DMOracle.DBCemapa.Commit;
      QContasPagar_Mov.Close;
      QContasPagar_cab.Close;

    end;
  end;
end;
end.

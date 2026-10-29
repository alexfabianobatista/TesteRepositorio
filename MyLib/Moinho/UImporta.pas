unit UImporta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    EdLidos: TEdit;
    Label1: TLabel;
    EdImportados: TEdit;
    Button1: TButton;
    Notas: TTabSheet;
    Label3: TLabel;
    EdNotasLidas: TEdit;
    Label4: TLabel;
    EdNotasImporta: TEdit;
    Button3: TButton;
    Label5: TLabel;
    EdRejeitados: TEdit;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdReceberLidos: TEdit;
    EdReceberImportados: TEdit;
    EdReceberRejeitados: TEdit;
    Button2: TButton;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EdPagarLidos: TEdit;
    EdPagarImportados: TEdit;
    EdPagarRejeitados: TEdit;
    Button4: TButton;
    TabSheet4: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdCaixaLidos: TEdit;
    EdCaixaImportados: TEdit;
    EdCaixaRejeitados: TEdit;
    Button5: TButton;
    TabSheet5: TTabSheet;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uConecta_cl;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
Var wImportados,wLidos : Integer;
begin
  wLidos := 0;
  wImportados := 0;
  With DMConecta do
   Begin
    QCadastro_Orcl.Open;
    While not (QCadastro_Orcl.Eof) Do
     Begin
       Inc(wLidos);
       QCadastro_Cpf_Ora.Close;
       QCadastro_Cpf_Ora.SetVariable('Num_Cgc_Cpf',QCadastro_OrclNum_Cgc_Cpf.Value);
       QCadastro_Cpf_Ora.Open;
       If QCadastro_Cpf_Ora.Eof Then
        Begin
          Inc(wImportados);
          QCadastro_Ora.Close;
          QCadastro_Ora.SetVariable('PK',QCadastro_OrclCod_Cadastro.Value);
          QCadastro_Ora.Open;
          If QCadastro_Ora.Eof Then
           Begin
             QCadastro_Ora.Insert;
             QCadastro_OraCod_Cadastro.Value := QCadastro_OrclCod_Cadastro.Value;
           End
          Else
           Begin
             QCadastro_Ora.Insert;
             QCadastro_OraCod_Cadastro.Value := DMConecta.Sequencia('CADASTRO');
           End;
          If QCadastro_OrclCOD_MOTIVO.Text <> '' Then
             QCadastro_OraCOD_MOTIVO.Value := QCadastro_OrclCOD_MOTIVO.Value;
          If QCadastro_OrclCOD_TIPO_CADASTRO.Text <> '' Then
             QCadastro_OraCOD_TIPO_CADASTRO.Value := QCadastro_OrclCOD_TIPO_CADASTRO.Value;
          If QCadastro_OraCOD_REGIAO.Text <> '' Then
             QCadastro_OraCOD_REGIAO.Value := QCadastro_OraCOD_REGIAO.Value;
          If QCadastro_OrclCOD_PAIS.Text <> '' then
             QCadastro_OraCOD_PAIS.Value := QCadastro_OrclCOD_PAIS.Value;
          If QCadastro_OrclCOD_ESTADO_CIVIL.Text <> '' Then
             QCadastro_OraCOD_ESTADO_CIVIL.Value := QCadastro_OrclCOD_ESTADO_CIVIL.Value;
          If QCadastro_OrclCOD_RAMO.Text <> '' Then
             QCadastro_OraCOD_RAMO.Value := QCadastro_OrclCOD_RAMO.Value;
          If QCadastro_OrclCOD_ESTADO.Text <> '' Then
             QCadastro_OraCOD_ESTADO.Value := QCadastro_OrclCOD_ESTADO.Value;
          QCadastro_OraNOME.Value := QCadastro_OrclNOME.Value;
          QCadastro_OraDESC_ENDERECO.Value := QCadastro_OrclDESC_ENDERECO.Value;
          QCadastro_OraDESC_CIDADE.Value := QCadastro_OrclDESC_CIDADE.Value;
          QCadastro_OraDESC_CEP.Value := QCadastro_OrclDESC_CEP.Value;
          QCadastro_OraNUM_CGC_CPF.Value := QCadastro_OrclNUM_CGC_CPF.Value;
          QCadastro_OraNUM_INSCRICAO.Value := QCadastro_OrclNUM_INSCRICAO.Value;
          QCadastro_OraDT_CADASTRO.Value := QCadastro_OrclDT_CADASTRO.Value;
          QCadastro_OraIND_SEXO_CATEGORIA.Value := QCadastro_OrclIND_SEXO_CATEGORIA.Value;
          QCadastro_OraNUM_CAIXA_POSTAL.Value := QCadastro_OrclNUM_CAIXA_POSTAL.Value;
          QCadastro_OraDT_CANCELAMENTO.Value := QCadastro_OrclDT_CANCELAMENTO.Value;
          QCadastro_OraDESC_TELEFONE.Value := QCadastro_OrclDESC_TELEFONE.Value;
          QCadastro_OraDESC_CELULAR.Value := QCadastro_OrclDESC_CELULAR.Value;
          QCadastro_OraNOME_CONTATO.Value := QCadastro_OrclNOME_CONTATO.Value;
          QCadastro_OraDT_NASCIMENTO.Value := QCadastro_OrclDT_NASCIMENTO.Value;
          QCadastro_OraDESC_BAIRRO.Value := QCadastro_OrclDESC_BAIRRO.Value;
          QCadastro_OraPERC_FUNRURAL.Value := QCadastro_OrclPERC_FUNRURAL.Value;
          QCadastro_OraVAL_LIMITE.Value := QCadastro_OrclVAL_LIMITE.Value;
          QCadastro_OraDESC_FANTASIA.VAlue := QCadastro_OrclDESC_FANTASIA.Value;
          QCadastro_OraDESC_CIDADE_COBRANCA.Value := QCadastro_OrclDESC_CIDADE_COBRANCA.Value;
          QCadastro_OraDESC_ENDERECO_COBRANCA.Value := QCadastro_OrclDESC_ENDERECO_COBRANCA.Value;
          QCadastro_OraDESC_ESTADO_COBRANCA.Value := QCadastro_OrclDESC_ESTADO_COBRANCA.Value;
          QCadastro_OraDESC_CEP_COBRANCA.Value := QCadastro_OrclDESC_CEP_COBRANCA.Value;
          QCadastro_OraDESC_TELEFONE_COMERCIAL.Value := QCadastro_OrclDESC_TELEFONE_COMERCIAL.Value;
          QCadastro_OraNUM_JUNTA.Value := QCadastro_OrclNUM_JUNTA.Value;
          QCadastro_OraDT_FUNDACAO.Value := QCadastro_OrclDT_FUNDACAO.Value;
          QCadastro_OraDT_JUNTA.Value := QCadastro_OrclDT_JUNTA.Value;
          QCadastro_OraDESC_FAX.Value := QCadastro_OrclDESC_FAX.Value;
          QCadastro_OraNOME_MAE.Value := QCadastro_OrclNOME_MAE.Value;
          QCadastro_OraNOME_PAI.Value := QCadastro_OrclNOME_PAI.Value;
          QCadastro_OraDESC_NATURALIDADE.Value := QCadastro_OrclDESC_NATURALIDADE.Value;
          QCadastro_OraDESC_ESTADO_NATURAL.Value := QCadastro_OrclDESC_ESTADO_NATURAL.Value;
          QCadastro_OraDT_EXPEDICAO_IDENTIDADE.Value := QCadastro_OrclDT_EXPEDICAO_IDENTIDADE.Value;
          QCadastro_OraDESC_E_MAIL.Value := QCadastro_OrclDESC_E_MAIL.Value;
          QCadastro_OraDESC_FAX_COBRANCA.Value := QCadastro_OrclDESC_FAX_COBRANCA.Value;
          QCadastro_OraIND_SEPROC_SIMNAO.Value := QCadastro_OrclIND_SEPROC_SIMNAO.Value;
          QCadastro_OraDESC_INSCRICAO_MUNICIPAL.Value := QCadastro_OrclDESC_INSCRICAO_MUNICIPAL.Value;
          QCadastro_OraNOME_CONJUGE.Value := QCadastro_OrclNOME_CONJUGE.Value;
          QCadastro_OraDESC_CPF_CONJUGE.Value := QCadastro_OrclDESC_CPF_CONJUGE.Value;
          QCadastro_OraDESC_IDENTIDADE_CONJUGE.Value := QCadastro_OrclDESC_IDENTIDADE_CONJUGE.Value;
          If QCadastro_OrclCOD_CLASS_CADASTRO.Text <> '' Then
             QCadastro_OraCOD_CLASS_CADASTRO.Value := QCadastro_OrclCOD_CLASS_CADASTRO.Value;
          If QCadastro_OrclCOD_BANCO_AGENCIA.Text <> '' then
             QCadastro_OraCOD_BANCO_AGENCIA.Value := QCadastro_OrclCOD_BANCO_AGENCIA.Value;
//         QCadastro_OraCOD_OPERACAO_CC.Value := QCadastro_OrclCOD_OPERACAO_CC.Value;
          QCadastro_OraDT_NASCIMENTO_CONTATO.Value := QCadastro_OrclDT_NASCIMENTO_CONTATO.Value;
          QCadastro_OraNOME_CONTATO2.Value := QCadastro_OrclNOME_CONTATO2.Value;
          QCadastro_OraDT_NASCIMENTO2.Value := QCadastro_OrclDT_NASCIMENTO2.Value;
          If QCadastro_OrclCOD_VENDEDOR.Text <> '' then
             QCadastro_OraCOD_VENDEDOR.Value := QCadastro_OrclCOD_VENDEDOR.Value;
          QCadastro_OraPERC_COMISSAO.Value := QCadastro_OrclPERC_COMISSAO.Value;
          QCadastro_OraDESC_COMPLEMENTO.Value := QCadastro_OrclDESC_COMPLEMENTO.Value;
          QCadastro_OraIND_FISICA_JURIDICA.Value := QCadastro_OrclIND_FISICA_JURIDICA.Value;
          QCadastro_OraDESC_ENDERECO_ENTREGA.Value := QCadastro_OrclDESC_ENDERECO_ENTREGA.Value;
          QCadastro_OraDESC_CIDADE_ENTREGA.Value := QCadastro_OrclDESC_CIDADE_ENTREGA.Value;
          QCadastro_OraDESC_BAIRRO_ENTREGA.Value := QCadastro_OrclDESC_BAIRRO_ENTREGA.Value;
          QCadastro_OraDESC_OBS.Value := QCadastro_OrclDESC_OBS.Value;
          QCadastro_OraDESC_OBS1.Value := QCadastro_OrclDESC_OBS1.Value;
          QCadastro_OraDESC_OBS2.Value := QCadastro_OrclDESC_OBS2.Value;
          QCadastro_OraDESC_FORMA_COMPRA.Value := QCadastro_OrclDESC_FORMA_COMPRA.Value;
          QCadastro_OraCOD_USUARIO.Value := 2;
          QCadastro_OraDESC_REF_COMERCIAL1.Value := QCadastro_OrclDESC_REF_COMERCIAL1.Value;
          QCadastro_OraDESC_REF_COMERCIAL2.Value := QCadastro_OrclDESC_REF_COMERCIAL2.Value;
          QCadastro_OraDESC_REF_COMERCIAL3.Value := QCadastro_OrclDESC_REF_COMERCIAL3.Value;
          QCadastro_OraDESC_REF_BANCO1.Value := QCadastro_OrclDESC_REF_BANCO1.Value;
          QCadastro_OraDESC_REF_BANCO2.Value := QCadastro_OrclDESC_REF_BANCO2.Value;
          QCadastro_OraDESC_REF_BANCO3.Value := QCadastro_OrclDESC_REF_BANCO3.Value;
          QCadastro_OraDESC_REF_PARENTE_NOME.Value := QCadastro_OrclDESC_REF_PARENTE_NOME.Value;
          QCadastro_OraDESC_REF_PARENTE_ENDERECO.Value := QCadastro_OrclDESC_REF_PARENTE_ENDERECO.Value;
          QCadastro_OraDESC_REF_PARENTE_CIDADE.Value := QCadastro_OrclDESC_REF_PARENTE_CIDADE.Value;
          QCadastro_OraDESC_REF_PARENTE_TELEFONE.Value := QCadastro_OrclDESC_REF_PARENTE_TELEFONE.Value;
          QCadastro_OraDESC_REF_OUTRAS.Value := QCadastro_OrclDESC_REF_OUTRAS.Value;
          QCadastro_OraDESC_ORGAO_EMISSOR.Value := QCadastro_OrclDESC_ORGAO_EMISSOR.Value;
          QCadastro_OraDESC_INSCRICAO_INSS.Value := QCadastro_OrclDESC_INSCRICAO_INSS.Value;
          QCadastro_OraDESC_CARTEIRA.Value := QCadastro_OrclDESC_CARTEIRA.Value;
          QCadastro_OraDT_EXPEDICAO_CARTEIRA.Value := QCadastro_OrclDT_EXPEDICAO_CARTEIRA.Value;
          QCadastro_OraIND_LIBERA_VENDA.Value := QCadastro_OrclIND_LIBERA_VENDA.Value;
          If QCadastro_OrclCOD_VENDEDOR_PREPOSTO.Text <> '' Then
             QCadastro_OraCOD_VENDEDOR_PREPOSTO.Value := QCadastro_OrclCOD_VENDEDOR_PREPOSTO.Value;
          QCadastro_OraIND_REGIME_ESPECIAL.Value := QCadastro_OrclIND_REGIME_ESPECIAL.Value;
//          QCadastro_OraCOD_CIDADE.Value := QCadastro_OrclCOD_CIDADE.Value;
          QCadastro_Ora.Post;
        End;
        QCadastro_Orcl.Next;
        EdLidos.Text := IntToStr(wLidos);
        EdImportados.Text := IntToStr(wImportados);
     End;
     QCadastro_Ora.Close;
     QCadastro_Orcl.Close;
   End;
end;

procedure TForm1.Button3Click(Sender: TObject);
Var wImportados,wLidos,wRejeitados : Integer;
begin
  wLidos := 0;
  wImportados := 0;
  wRejeitados := 0;
  With DMConecta do
   Begin
    QNotaCab_Orcl.Open;
    QNotaItem_Orcl.Open;
    QNotaCab_Ora.Open;
    QNotaItem_Ora.Open;
    While not (QNotaCab_Orcl.Eof) Do
     Begin
       Inc(wLidos);
       If QNotaCab_OrclNum_Cgc_Cpf.Value = '' Then
          Inc(wRejeitados)
       Else
        Begin
          QCadastro_Cpf_Ora.Close;
          QCadastro_Cpf_Ora.SetVariable('Num_Cgc_Cpf',QNotaCab_OrclNum_Cgc_Cpf.Value);
          QCadastro_Cpf_Ora.Open;
          If Not (QCadastro_Cpf_Ora.Eof) Then
           Begin
             Inc(wImportados);
             QNotaCab_Ora.Insert;
             QNotaCab_OraCOD_NOTA_CAB.Value := DMConecta.Sequencia('NOTA');
             QNotaCab_OraCOD_USUARIO.Value := 32;
             QNotaCab_OraCOD_FILIAL.Value := QNotaCab_OrclCOD_FILIAL.Value;
             QNotaCab_OraCOD_MENSAGEM.Text := QNotaCab_OrclCOD_MENSAGEM.Text;
             QNotaCab_OraCOD_TRANSPORTE.Value := QNotaCab_OrclCOD_TRANSPORTE.Value;
             QNotaCab_OraCOD_OPERACAO.Value := QNotaCab_OrclCOD_OPERACAO.Value;
             QNotaCab_OraCOD_ESTADO.Value := QNotaCab_OrclCOD_ESTADO.Value;
             QNotaCab_OraCOD_VENDEDOR.Text := QNotaCab_OrclCOD_VENDEDOR.text;
             QNotaCab_OraCOD_CADASTRO.Value := QCadastro_Cpf_OraCOD_CADASTRO.Value;
             QNotaCab_OraNUM_NOTA.Value := QNotaCab_OrclNUM_NOTA.Value;
             QNotaCab_OraCOD_SERIE.Value := QNotaCab_OrclCOD_SERIE.Value;
             QNotaCab_OraIND_SITUACAO.Value := QNotaCab_OrclIND_SITUACAO.Value;
             QNotaCab_OraIND_CONDICAO_PAGTO.Value := QNotaCab_OrclIND_CONDICAO_PAGTO.Value;
             QNotaCab_OraDT_EMISSAO.Value := QNotaCab_OrclDT_EMISSAO.Value;
             QNotaCab_OraDT_MOVIMENTO.Value := QNotaCab_OrclDT_MOVIMENTO.Value;
             QNotaCab_OraDT_RECEBIMENTO.Value := QNotaCab_OrclDT_RECEBIMENTO.Value;
             QNotaCab_OraCOD_MOTIVO_CANC.Text := QNotaCab_OrclCOD_MOTIVO_CANC.Text;
             QNotaCab_OraVAL_DESPESAS.Value := QNotaCab_OrclVAL_DESPESAS.Value;
             QNotaCab_OraIND_ENTRADA_SAIDA.Value := QNotaCab_OrclIND_ENTRADA_SAIDA.Value;
             QNotaCab_OraVAL_FRETE.Value := QNotaCab_OrclVAL_FRETE.Value;
             QNotaCab_OraVAL_DESCONTO.Value := QNotaCab_OrclVAL_DESCONTO.Value;
             QNotaCab_OraCOD_TRANSPORTADOR.Text := QNotaCab_OrclCOD_TRANSPORTADOR.Text;
             QNotaCab_OraNUM_CONHECIMENTO_FRETE.Text := QNotaCab_OrclNUM_CONHECIMENTO_FRETE.Text;
             QNotaCab_OraVAL_AVISTA.Value := QNotaCab_OrclVAL_AVISTA.Value;
             QNotaCab_OraIND_TIPO_FRETE.Value := QNotaCab_OrclIND_TIPO_FRETE.Value;
             QNotaCab_OraNUM_VOLUMES.Value := QNotaCab_OrclNUM_VOLUMES.Value;
             QNotaCab_OraOBS.Value := QNotaCab_OrclOBS.Value;
             QNotaCab_OraOBS_COMPLEMENTO.Value := QNotaCab_OrclOBS_COMPLEMENTO.Value;
             QNotaCab_OraDT_USUARIO.Value := QNotaCab_OrclDT_USUARIO.Value;
             QNotaCab_OraCOD_TRIBUTACAO_FRETE.Text := QNotaCab_OrclCOD_TRIBUTACAO_FRETE.Text;
             QNotaCab_OraVAL_TOTAL_IPI.Value := QNotaCab_OrclVAL_TOTAL_IPI.Value;
             QNotaCab_OraVAL_ICM_FRETE.Value := QNotaCab_OrclVAL_ICM_FRETE.Value;
             QNotaCab_OraVAL_ICM_BASE_FRETE.Value := QNotaCab_OrclVAL_ICM_BASE_FRETE.Value;
             QNotaCab_OraVAL_FUNRURAL.Value := QNotaCab_OrclVAL_FUNRURAL.Value;
             QNotaCab_OraDESC_PLACA.Value := QNotaCab_OrclDESC_PLACA.Value;
             QNotaCab_OraDESC_TRANSPORTADORA.Value := QNotaCab_OrclDESC_TRANSPORTADORA.Value;
             QNotaCab_OraDT_EMISSAO_CF.Value := QNotaCab_OrclDT_EMISSAO_CF.Value;
             QNotaCab_OraCOD_OPERACAO_CF.Text := QNotaCab_OrclCOD_OPERACAO_CF.Text;
             QNotaCab_OraNR_DIAS_CHEQUE.Value := QNotaCab_OrclNR_DIAS_CHEQUE.Value;
             QNotaCab_OraIND_NOTA_SEGURO.Value := QNotaCab_OrclIND_NOTA_SEGURO.Value;
             QNotaCab_OraPERC_COMISSAO.Value := QNotaCab_OrclPERC_COMISSAO.Value;
             QNotaCab_OraCOD_DEPARTAMENTO.Text := QNotaCab_OrclCOD_DEPARTAMENTO.Text;
             QNotaCab_OraVAL_PEDAGIO.Value := QNotaCab_OrclVAL_PEDAGIO.Value;
             QNotaCab_OraVAL_FRETE_TON.Value := QNotaCab_OrclVAL_FRETE_TON.Value;
             QNotaCab_OraDESC_OBS_CORPO_NOTA.Value := QNotaCab_OrclDESC_OBS_CORPO_NOTA.Value;
             QNotaCab_Ora.Post;
             While Not (QNotaItem_Orcl.Eof) do
              Begin
                QNotaItem_Ora.Insert;
                QNotaItem_OraCOD_NOTA_ITEM.Value := DMConecta.Sequencia('NOTA_ITEM');
                QNotaItem_OraCOD_NOTA_CAB.Value := QNotaCab_OraCOD_NOTA_CAB.Value;
                QNotaItem_OraCOD_TRIBUTACAO.Value := QNotaItem_OrclCOD_TRIBUTACAO.Value;
                QNotaItem_OraQT_QUANTIDADE.Value := QNotaItem_OrclQT_QUANTIDADE.Value;
                QNotaItem_OraVAL_TOTAL.Value := QNotaItem_OrclVAL_TOTAL.Value;
                QNotaItem_OraPERC_IPI.Value := QNotaItem_OrclPERC_IPI.Value;
                QNotaItem_OraPERC_COMISSAO.Value := QNotaItem_OrclPERC_COMISSAO.Value;
                QNotaItem_OraCOD_PRODUTO.Value := QNotaItem_OrclCOD_PRODUTO.Value;
                QNotaItem_OraCOD_LOTE_TIPO.Value := 1;
                QNotaItem_OraVAL_DESCONTO.Value := QNotaItem_OrclVAL_DESCONTO.Value;
                QNotaItem_OraVAL_DESPESAS.Value := QNotaItem_OrclVAL_DESPESAS.Value;
                QNotaItem_OraVAL_FRETE.Value := QNotaItem_OrclVAL_FRETE.Value;
                QNotaItem_OraPERC_DESCONTO.Value := QNotaItem_OrclPERC_DESCONTO.Value;
                QNotaItem_OraVAL_IPI.Value := QNotaItem_OrclVAL_IPI.Value;
                QNotaItem_OraVAL_UNITARIO.Value := QNotaItem_OrclVAL_UNITARIO.Value;
                QNotaItem_OraVAL_ICM_BASE.Value := QNotaItem_OrclVAL_ICM_BASE.Value;
                QNotaItem_OraVAL_ICM.Value := QNotaItem_OrclVAL_ICM.Value;
                QNotaItem_OraIND_CLASS_IPI.Value := QNotaItem_OrclIND_CLASS_IPI.Value;
                QNotaItem_OraVAL_CUSTO.Value := QNotaItem_OrclVAL_CUSTO.Value;
                QNotaItem_OraVAL_ISS.Value := QNotaItem_OrclVAL_ISS.Value;
                QNotaItem_OraPERC_INSS.Value := QNotaItem_OrclPERC_INSS.Value;
                QNotaItem_OraPERC_BENEFICIADO.Value := QNotaItem_OrclPERC_BENEFICIADO.Value;
                QNotaItem_OraIND_BX_CONTR_VEND.Value := QNotaItem_OrclIND_BX_CONTR_VEND.Value;
                QNotaItem_OraNUM_NOTA_PRODUTOR.Value := QNotaItem_OrclNUM_NOTA_PRODUTOR.Value;
                QNotaItem_OraIND_TIPO_CONSUMO.Value := QNotaItem_OrclIND_TIPO_CONSUMO.Value;
                QNotaItem_Ora.Post;
                QNotaItem_Orcl.Next;
              End;
           End
          else
            Inc(wRejeitados);
        End;
        QNotaCab_Orcl.Next;
        EdLidos.Text := IntToStr(wLidos);
        EdImportados.Text := IntToStr(wImportados);
        EdRejeitados.Text := IntToStr(wRejeitados);
     End;
     QNotaItem_Ora.Close;
     QNotaItem_Orcl.Close;
     QNotaCab_Ora.Close;
     QNotaCab_Orcl.Close;
   End;
end;

procedure TForm1.Button2Click(Sender: TObject);
Var wImportados,wLidos,wRejeitados : Integer;
begin
  wLidos := 0;
  wImportados := 0;
  wRejeitados := 0;
  With DMConecta do
   Begin
    QContaReceberCab_Orcl.Open;
    QContaReceberMov_Orcl.Open;
    QContaReceberCab_Ora.Open;
    QContaReceberMov_Ora.Open;
    While not (QContaReceberCab_Orcl.Eof) Do
     Begin
       Inc(wLidos);
       If QContaReceberCab_OrclNum_Cgc_Cpf.Value = '' Then
          Inc(wRejeitados)
       Else
        Begin
          QCadastro_Cpf_Ora.Close;
          QCadastro_Cpf_Ora.SetVariable('Num_Cgc_Cpf',QContaReceberCab_OrclNum_Cgc_Cpf.Value);
          QCadastro_Cpf_Ora.Open;
          If Not (QCadastro_Cpf_Ora.Eof) Then
           Begin
             Inc(wImportados);
             QContaReceberCab_Ora.Insert;
             QContaReceberCab_OraCOD_CONTA_RECEBER_CAB.Value := DMConecta.Sequencia('CONTA_RECEBER');
             QContaReceberCab_OraCOD_FINALIDADE.Text := QContaReceberCab_OrclCOD_FINALIDADE.Text;
             QContaReceberCab_OraCOD_BANCO_AGENCIA.Text := QContaReceberCab_OrclCOD_BANCO_AGENCIA.Text;
             QContaReceberCab_OraCOD_FILIAL.Value := 5;
             QContaReceberCab_OraNUM_TITULO.Value := QContaReceberCab_OrclNUM_TITULO.Value;
             QContaReceberCab_OraNUM_PARCELA.Value := QContaReceberCab_OrclNUM_PARCELA.Value;
             QContaReceberCab_OraDESC_TIPO_DOCUMENTO.Value := QContaReceberCab_OrclDESC_TIPO_DOCUMENTO.Value;
             QContaReceberCab_OraDT_MOVIMENTO.Value := QContaReceberCab_OrclDT_MOVIMENTO.Value;
             QContaReceberCab_OraDT_BAIXA.Value := QContaReceberCab_OrclDT_BAIXA.Value;
             QContaReceberCab_OraDT_VENCIMENTO.Value := QContaReceberCab_OrclDT_VENCIMENTO.Value;
             QContaReceberCab_OraDT_EMISSAO.Value := QContaReceberCab_OrclDT_EMISSAO.Value;
             QContaReceberCab_OraDT_CAPITALIZACAO.Value := QContaReceberCab_OrclDT_CAPITALIZACAO.Value;
             QContaReceberCab_OraVAL_TITULO.Value := QContaReceberCab_OrclVAL_TITULO.Value;
             QContaReceberCab_OraVAL_NEGOCIO.Value := QContaReceberCab_OrclVAL_NEGOCIO.Value;
             QContaReceberCab_OraIND_ACEITE.Value := QContaReceberCab_OrclIND_ACEITE.Value;
             QContaReceberCab_OraIND_SITUACAO.Value := QContaReceberCab_OrclIND_SITUACAO.Value;
             QContaReceberCab_OraDESC_OBSERVACAO.Value := QContaReceberCab_OrclDESC_OBSERVACAO.Value;
             QContaReceberCab_OraCOD_CADASTRO.Value := QCadastro_Cpf_OraCOD_CADASTRO.Value;
             QContaReceberCab_OraVAL_ORIGINAL.Value := QContaReceberCab_OrclVAL_ORIGINAL.Value;
             QContaReceberCab_OraVAL_JUROS.Value := QContaReceberCab_OrclVAL_JUROS.Value;
             QContaReceberCab_OraCOD_DEPARTAMENTO.Value := QContaReceberCab_OrclCOD_DEPARTAMENTO.Value;
             QContaReceberCab_OraDESC_AVALISTA1.Value := QContaReceberCab_OrclDESC_AVALISTA1.Value;
             QContaReceberCab_OraDESC_AVALISTA2.Value := QContaReceberCab_OrclDESC_AVALISTA2.Value;
             QContaReceberCab_OraCOD_VENDEDOR.Text := QContaReceberCab_OrclCOD_VENDEDOR.Text;
             QContaReceberCab_OraPERC_COMISSAO.Value := QContaReceberCab_OrclPERC_COMISSAO.Value;
             QContaReceberCab_OraDT_CAPITALIZACAO_MOEDA.Value := QContaReceberCab_OrclDT_CAPITALIZACAO_MOEDA.Value;
             QContaReceberCab_OraVAL_PROMISSORIA.Value := QContaReceberCab_OrclVAL_PROMISSORIA.Value;
             QContaReceberCab_OraIND_ENVIADO_BANCO.Value := QContaReceberCab_OrclIND_ENVIADO_BANCO.Value;
             QContaReceberCab_OraCOD_CONTA_CORRENTE.Text := QContaReceberCab_OrclCOD_CONTA_CORRENTE.Text;
             QContaReceberCab_Ora.Post;
             While Not (QContaReceberMov_Orcl.Eof) do
              Begin
                QContaReceberMov_Ora.Insert;
                QContaReceberMov_OraCOD_CONTA_RECEBER_MOV.Value := DMConecta.Sequencia('CONTA_RECEBER_MOV');
                QContaReceberMov_OraCOD_CONTA_RECEBER_CAB.Value := QContaReceberCab_OraCOD_CONTA_RECEBER_CAB.Value;
                QContaReceberMov_OraDT_MOVIMENTO.Value := QContaReceberMov_OrclDT_MOVIMENTO.Value;
                QContaReceberMov_OraVAL_MOVIMENTO.Value := QContaReceberMov_OrclVAL_MOVIMENTO.Value;
                QContaReceberMov_OraDESC_OBSERVACAO.Value := QContaReceberMov_OrclDESC_OBSERVACAO.Value;
                QContaReceberMov_OraCOD_USUARIO.Value := 32;
                QContaReceberMov_OraDT_USUARIO.Value := QContaReceberMov_OrclDT_USUARIO.Value;
                QContaReceberMov_OraIND_TIPO_MOVIMENTO.Value := QContaReceberMov_OrclIND_TIPO_MOVIMENTO.Value;
                QContaReceberMov_Ora.Post;
                QContaReceberMov_Orcl.Next;
              End;
           End
          else
            Inc(wRejeitados);
        End;
        QContaReceberCab_Orcl.Next;
        EdReceberLidos.Text := IntToStr(wLidos);
        EdReceberImportados.Text := IntToStr(wImportados);
        EdReceberRejeitados.Text := IntToStr(wRejeitados);
     End;
    QContaReceberCab_Orcl.Close;
    QContaReceberMov_Orcl.Close;
    QContaReceberCab_Ora.Close;
    QContaReceberMov_Ora.Close;
   End;
end;

procedure TForm1.Button4Click(Sender: TObject);
Var wImportados,wLidos,wRejeitados : Integer;
begin
  wLidos := 0;
  wImportados := 0;
  wRejeitados := 0;
  With DMConecta do
   Begin
    QContaPagarCab_Orcl.Open;
    QContaPagarMov_Orcl.Open;
    QContaPagarCab_Ora.Open;
    QContaPagarMov_Ora.Open;
    While not (QContaPagarCab_Orcl.Eof) Do
     Begin
       Inc(wLidos);
       If QContaPagarCab_OrclNum_Cgc_Cpf.Value = '' Then
          Inc(wRejeitados)
       Else
        Begin
          QCadastro_Cpf_Ora.Close;
          QCadastro_Cpf_Ora.SetVariable('Num_Cgc_Cpf',QContaPagarCab_OrclNum_Cgc_Cpf.Value);
          QCadastro_Cpf_Ora.Open;
          If Not (QCadastro_Cpf_Ora.Eof) Then
           Begin
             Inc(wImportados);
             QContaPagarCab_Ora.Insert;
             QContaPagarCab_OraCOD_CONTA_PAGAR_CAB.Value := DMConecta.Sequencia('CONTA_PAGAR');
             QContaPagarCab_OraCOD_FINALIDADE.Value := QContaPagarCab_OrclCOD_FINALIDADE.Value;
             QContaPagarCab_OraCOD_BANCO_AGENCIA.Text := QContaPagarCab_OrclCOD_BANCO_AGENCIA.Text;
             QContaPagarCab_OraCOD_CADASTRO.Value := QCadastro_Cpf_OraCOD_CADASTRO.Value;
             QContaPagarCab_OraCOD_FILIAL.Value := 5;
             QContaPagarCab_OraNUM_TITULO.Value := QContaPagarCab_OrclNUM_TITULO.Value;
             QContaPagarCab_OraNUM_PARCELA.Value := QContaPagarCab_OrclNUM_PARCELA.Value;
             QContaPagarCab_OraDESC_TIPO_DOCUMENTO.Value := QContaPagarCab_OrclDESC_TIPO_DOCUMENTO.Value;
             QContaPagarCab_OraDT_MOVIMENTO.Value := QContaPagarCab_OrclDT_MOVIMENTO.Value;
             QContaPagarCab_OraDT_BAIXA.Value := QContaPagarCab_OrclDT_BAIXA.Value;
             QContaPagarCab_OraDT_VENCIMENTO.Value := QContaPagarCab_OrclDT_VENCIMENTO.Value;
             QContaPagarCab_OraDT_EMISSAO.Value := QContaPagarCab_OrclDT_EMISSAO.Value;
             QContaPagarCab_OraDT_CAPITALIZACAO.Value := QContaPagarCab_OrclDT_CAPITALIZACAO.Value;
             QContaPagarCab_OraVAL_TITULO.Value := QContaPagarCab_OrclVAL_TITULO.Value;
             QContaPagarCab_OraDESC_OBSERVACAO.Value := QContaPagarCab_OrclDESC_OBSERVACAO.Value;
             QContaPagarCab_OraIND_ACEITE.VAlue := QContaPagarCab_OrclIND_ACEITE.VAlue;
             QContaPagarCab_OraIND_SITUACAO.Value := QContaPagarCab_OrclIND_SITUACAO.Value;
             QContaPagarCab_OraVAL_ORIGINAL.Value := QContaPagarCab_OrclVAL_ORIGINAL.Value;
             QContaPagarCab_OraCOD_DEPARTAMENTO.Text := QContaPagarCab_OrclCOD_DEPARTAMENTO.Text;
             QContaPagarCab_OraDT_VENCIMENTO_PRORROGADO.Value := QContaPagarCab_OrclDT_VENCIMENTO_PRORROGADO.Value;
             QContaPagarCab_Ora.Post;
             While Not (QContaPagarMov_Orcl.Eof) do
              Begin
                QContaPagarMov_Ora.Insert;
                QContaPagarMov_OraCOD_CONTA_PAGAR_MOV.Value := DMConecta.Sequencia('CONTA_PAGAR_MOV');
                QContaPagarMov_OraCOD_CONTA_PAGAR_CAB.Value := QContaPagarCab_OraCOD_CONTA_PAGAR_CAB.Value;
                QContaPagarMov_OraDT_MOVIMENTO.Value := QContaPagarMov_OrclDT_MOVIMENTO.Value;
                QContaPagarMov_OraVAL_MOVIMENTO.Value := QContaPagarMov_OrclVAL_MOVIMENTO.Value;
                QContaPagarMov_OraDESC_OBSERVACAO.Value := QContaPagarMov_OrclDESC_OBSERVACAO.Value;
                QContaPagarMov_OraIND_TIPO_MOVIMENTO.Value := QContaPagarMov_OrclIND_TIPO_MOVIMENTO.Value;
                QContaPagarMov_OraDT_USUARIO.Value := QContaPagarMov_OrclDT_USUARIO.Value;
                QContaPagarMov_OraCOD_USUARIO.Value := 32 ;
                QContaPagarMov_OraIND_FORMA_PAGAMENTO.Value := QContaPagarMov_OrclIND_FORMA_PAGAMENTO.Value;
                QContaPagarMov_Ora.Post;
                QContaPagarMov_Orcl.Next;
              End;
           End
          else
            Inc(wRejeitados);
        End;
        QContaPagarCab_Orcl.Next;
        EdPagarLidos.Text := IntToStr(wLidos);
        EdPagarImportados.Text := IntToStr(wImportados);
        EdPagarRejeitados.Text := IntToStr(wRejeitados);
     End;
    QContaPagarCab_Orcl.Close;
    QContaPagarMov_Orcl.Close;
    QContaPagarCab_Ora.Close;
    QContaPagarMov_Ora.Close;
   End;
end;

procedure TForm1.Button5Click(Sender: TObject);
Var wImportados,wLidos,wRejeitados : Integer;
begin
  wLidos := 0;
  wImportados := 0;
  wRejeitados := 0;
  With DMConecta do
   Begin
    QCaixa_Orcl.Open;
    QCaixa_Ora.Open;
    While not (QCaixa_Orcl.Eof) Do
     Begin
       Inc(wLidos);
       Inc(wImportados);
       QCaixa_Ora.Insert;
       QCaixa_OraCOD_CAIXA_MOV.Value := DMConecta.Sequencia('CAIXA_MOV');
       QCaixa_OraCOD_USUARIO.Value := 32;
       QCaixa_OraCOD_FILIAL.Value := 5;
       QCaixa_OraCOD_DEPARTAMENTO.Text := QCaixa_OrclCOD_DEPARTAMENTO.Text;
       QCaixa_OraCOD_HISTORICO.Value := QCaixa_OrclCOD_HISTORICO.Value;
       QCaixa_OraDT_MOVIMENTO.Value := QCaixa_OrclDT_MOVIMENTO.Value;
       QCaixa_OraVAL_MOVIMENTO.Value := QCaixa_OrclVAL_MOVIMENTO.Value;
       QCaixa_OraDESC_HORARIO.Value := QCaixa_OrclDESC_HORARIO.Value;
       QCaixa_OraNUM_DOCUMENTO.Value := QCaixa_OrclNUM_DOCUMENTO.Value;
       QCaixa_OraDT_USUARIO.Value := QCaixa_OrclDT_USUARIO.Value;
       QCaixa_OraDESC_COMPLEMENTO.Value := QCaixa_OrclDESC_COMPLEMENTO.Value;
       QCaixa_OraDESC_COMPLEMENTO1.Value := QCaixa_OrclDESC_COMPLEMENTO1.Value;
       If QCaixa_OrclNum_Cgc_Cpf.Value <> '' Then
        Begin
          QCadastro_Cpf_Ora.Close;
          QCadastro_Cpf_Ora.SetVariable('Num_Cgc_Cpf',QCaixa_OrclNum_Cgc_Cpf.Value);
          QCadastro_Cpf_Ora.Open;
          If Not (QCadastro_Cpf_Ora.Eof) Then
             QCaixa_OraCOD_CADASTRO.Value := QCadastro_Cpf_OraCod_Cadastro.Value;
        End;
        QCaixa_Ora.Post;
        QCaixa_Orcl.Next;
     End;
     EdCaixaLidos.Text := IntToStr(wLidos);
     EdCaixaImportados.Text := IntToStr(wImportados);
     QCaixa_Orcl.Close;
     QCaixa_Ora.Close;
  End;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  With DMConecta do
   Begin
    QHistorico_Orcl.Open;
    While not (QHistorico_Orcl.Eof) Do
     Begin
       QHistorico_Ora.Close;
       QHistorico_Ora.SetVariable('PK',QHistorico_OrclCod_Historico.Value);
       QHistorico_Ora.Open;
       If QHistorico_Ora.Eof Then
       Begin
         QHistorico_Ora.Insert;
         QHistorico_OraCOD_CONTABIL_DEB.Text := QHistorico_OrclCOD_CONTABIL_DEB.Text;
         QHistorico_OraCOD_HISTORICO_CONTABIL.Text := QHistorico_OrclCOD_HISTORICO_CONTABIL.Text;
         QHistorico_OraIND_EMITE_CHEQUE.Value := QHistorico_OrclIND_EMITE_CHEQUE.Value;
         QHistorico_OraIND_OPERACAO.Value := QHistorico_OrclIND_OPERACAO.Value;
         QHistorico_OraCOD_HISTORICO.Value := QHistorico_OrclCOD_HISTORICO.Value;
         QHistorico_OraCOD_CONTABIL_CRED.Text := QHistorico_OrclCOD_CONTABIL_CRED.Text;
         QHistorico_OraIND_CONCILIA.Value := QHistorico_OrclIND_CONCILIA.Value;
         QHistorico_OraDESC_HISTORICO.Value := QHistorico_OrclDESC_HISTORICO.Value;
         QHistorico_OraCOD_HISTORICO_CAIXA.Text := QHistorico_OrclCOD_HISTORICO_CAIXA.Text;
         QHistorico_OraIND_CUSTOS.Value := QHistorico_OrclIND_CUSTOS.Value;
         QHistorico_OraCOD_GRUPO.Text := QHistorico_OrclCOD_GRUPO.Text;
         QHistorico_OraCOD_DEPARTAMENTO.Text := QHistorico_OrclCOD_DEPARTAMENTO.Text;
         QHistorico_OraIND_SITUACAO.Value := QHistorico_OrclIND_SITUACAO.Value;
         QHistorico_Ora.Post;
       End;
       QHistorico_Orcl.Next;
     End;
    QHistorico_Orcl.Close;
    QHistorico_Ora.Close;
  End;
end;

end.

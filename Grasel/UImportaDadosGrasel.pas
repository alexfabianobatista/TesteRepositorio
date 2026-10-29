unit UImportaDadosGrasel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, Mask,db;

type
  TFImportaDadosGrasel = class(TForm)
    MEImp: TMaskEdit;
    MENaoImp: TMaskEdit;
    Label2: TLabel;
    Label1: TLabel;
    PB: TProgressBar;
    SBBase: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    OpenDialog1: TOpenDialog;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    BitBtn3: TBitBtn;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    BitBtn4: TBitBtn;
    TabSheet5: TTabSheet;
    DBGrid5: TDBGrid;
    BitBtn5: TBitBtn;
    TabSheet6: TTabSheet;
    DBGrid6: TDBGrid;
    BitBtn6: TBitBtn;
    TabSheet7: TTabSheet;
    DBGrid7: TDBGrid;
    BitBtn7: TBitBtn;
    TabSheet8: TTabSheet;
    DBGrid8: TDBGrid;
    BitBtn8: TBitBtn;
    TabSheet9: TTabSheet;
    DBGrid9: TDBGrid;
    BitBtn9: TBitBtn;
    TabSheet10: TTabSheet;
    DBGrid10: TDBGrid;
    BitBtn10: TBitBtn;
    procedure SBBaseClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportaDadosGrasel: TFImportaDadosGrasel;

implementation

uses UImportaGrasel_cl, UOracle_cl, UCadastro_cl;

{$R *.dfm}

procedure TFImportaDadosGrasel.SBBaseClick(Sender: TObject);
begin
  With DMOracle do
  Try

    If SBBase.Down Then
    Begin
      SBBase.Caption := 'Produção';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORA';
      DBCemapa.Connected := True;
    End
    Else
    Begin
      SBBase.Caption := 'Teste';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORCL';
      DBCemapa.Connected := True;
    End;
   // SetaUsuario;
  Except
    MessageDlg('Não foi possível conectar com esta base de dados!'
               +#13+'Certifique-se que esta base existe em seu servidor',mtWarning,[mbOk],0);
  End;

end;

procedure TFImportaDadosGrasel.BitBtn2Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IbqEstado.Open;
    QEstado_Cad.Open;
    IbqEstado.First;
    PB.Max := IbqEstado.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IbqEstado.Eof do
    Begin
      Try
        QEstado_Cad.Insert;
        QEstado_CadCOD_ESTADO.Value := IBQEstadoSIGLA.Value;
        QEstado_CadDESC_ESTADO.Value := IBQEstadoESTADO.Value;
        QEstado_CadPERC_TRIBUTACAO.Value := 1;
        QEstado_CadDESC_SIGLA_ESTADO.Value := IBQEstadoSIGLA.Value;
        QEstado_CadPERC_FRETE.Value := 0;
        QEstado_CadPERC_IMPOSTO_REDUCAO.Value := 0;
        QEstado_CadPERC_IMPOSTO_CESTA.Value := 0;
        QEstado_CadPERC_BASE_SUBST.Value := 0;
        QEstado_CadPERC_ALIQ_SUBST.Value := 0;
    //    QEstado_CadDESC_INSCRICAO_SUBST.Value :=

        QEstado_Cad.Post;
      Except
        If QEstado_Cad.State = dsInsert Then
          QEstado_Cad.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IbqEstado.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDadosGrasel.BitBtn3Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IbqCidades.Open;
    QCidades_Cad.Open;
    IbqCidades.First;
    PB.Max := IbqCidades.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IbqCidades.Eof do
    Begin
      Try
        QCidades_Cad.Insert;
        QCidades_CadCOD_CIDADE.Value := IBQCidadesCODIGO.Value;
        QCidades_CadDESC_CIDADE.Value := IBQCidadesCIDADE.Value;
        QCidades_CadCOD_ESTADO.Value := IBQCidadesESTADO.Value;
//        QCidades_CadCOD_PRACA
//        QCidades_CadCOD_DFC
//        QCidades_CadCOD_MUNICIPIO_SC

        QCidades_Cad.Post;
      Except
        If QEstado_Cad.State = dsInsert Then
          QEstado_Cad.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IbqCidades.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;


end;

procedure TFImportaDadosGrasel.BitBtn1Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IbqCadastro.Open;
    QCadastro_Cad.Open;
    IbqCadastro.First;
    PB.Max := IbqCadastro.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IbqCadastro.Eof do
    Begin
      Try
        QCadastro_Cad.Insert;
        QCadastro_CadCOD_CADASTRO.Value := IBQCadastroCODIGOCLIENTE.Value;
        QCadastro_CadCOD_TIPO_CADASTRO.Value := 1;
        QCadastro_CadCOD_REGIAO.Value := 1;
        QCadastro_CadCOD_PAIS.Value := 1;
        If IBQCadastroESTADOCIVIL.Value = 'S' Then
           QCadastro_CadCOD_ESTADO_CIVIL.Value := 1
        Else
          if IBQCadastroESTADOCIVIL.Value = 'C' Then
             QCadastro_CadCOD_ESTADO_CIVIL.Value := 2
          Else
            if IBQCadastroESTADOCIVIL.Value = 'V' Then
               QCadastro_CadCOD_ESTADO_CIVIL.Value := 3
            Else
              if IBQCadastroESTADOCIVIL.Value = 'D' Then
                 QCadastro_CadCOD_ESTADO_CIVIL.Value := 4
              Else
                 QCadastro_CadCOD_ESTADO_CIVIL.Value := 5;

        QCadastro_CadCOD_RAMO.Value := 1;
        QCadastro_CadCOD_ESTADO.Value := IBQCadastroESTADO.Value;
        QCadastro_CadNOME.Value := IBQCadastroNOME.Value;


        QCadastro_CadDESC_ENDERECO.Value := IBQCadastroENDERECO.Value + ',' + IBQCadastroEnderecoNumeroRua.Text;
        QCadastro_CadDESC_CIDADE.Value := IBQCadastroDesc_Cidade.Value;
        QCadastro_CadDESC_CEP.Text :=  IBQCadastroCEP.Text;
        QCadastro_CadNUM_CGC_CPF.Value := IBQCadastroCPFCNPJ.Value;
        QCadastro_CadNUM_INSCRICAO.Text := IBQCadastroRGIE.Text;
        If IBQCadastroDATAASSOCIACAO.Text = '' Then
           QCadastro_CadDT_CADASTRO.Value := Date
        Else
           QCadastro_CadDT_CADASTRO.Text := IBQCadastroDATAASSOCIACAO.Text;
        QCadastro_CadIND_SEXO_CATEGORIA.Text := IBQCadastroSexo.Text;
        QCadastro_CadNUM_CAIXA_POSTAL.Text := IBQCadastroENDERECOCXPOSTAL.Text;
    //    QCadastro_CadDT_CANCELAMENTO
        QCadastro_CadDESC_TELEFONE.Text := IBQCadastroRESIDENCIALFONE.Text;
        QCadastro_CadDESC_CELULAR.Text := IBQCadastroCOMERCIALFONE.Text;
        QCadastro_CadNOME_CONTATO.Text := IBQCadastroCONTATO.Text;
        QCadastro_CadDT_NASCIMENTO.Text := IBQCadastroDATANASCIMENTO.Text;
        QCadastro_CadDESC_BAIRRO.Text := IBQCadastroENDERECOBAIRRO.Text;
        QCadastro_CadPERC_FUNRURAL.Value := 2.3;
        QCadastro_CadVAL_LIMITE.Value := 0;
        QCadastro_CadDESC_FANTASIA.Text := IBQCadastroAPELIDO.Text;
        QCadastro_CadDESC_CIDADE_COBRANCA.Value := IBQCadastroDesc_Cidade.Value;
        QCadastro_CadDESC_ENDERECO_COBRANCA.Value := IBQCadastroENDERECO.Value;
        QCadastro_CadDESC_ESTADO_COBRANCA.Value := IBQCadastroESTADO.Value;
        QCadastro_CadDESC_CEP_COBRANCA.Text :=  IBQCadastroCEP.Text;
        QCadastro_CadDESC_TELEFONE_COMERCIAL.Text := IBQCadastroCONTATOCELULAR.Text;
    //    QCadastro_CadNUM_JUNTA
    //    QCadastro_CadDT_FUNDACAO
    //    QCadastro_CadDT_JUNTA
        QCadastro_CadDESC_FAX.Text  := IBQCadastroRESIDENCIALFAX.Text;

        QCadastro_CadNOME_MAE.Text := IBQCadastroNOMEMAE.Text;
        QCadastro_CadNOME_PAI.Text := IBQCadastroNOMEPAI.Text;
    //    QCadastro_CadDESC_NATURALIDADE.Text :=
    //    QCadastro_CadDESC_ESTADO_NATURAL: TStringField;
        QCadastro_CadDT_EXPEDICAO_IDENTIDADE.Text := IBQCadastroDATAEMISSAORRG.Text;
        QCadastro_CadDESC_E_MAIL.Text := IBQCadastroEMAIL.Text;
    //    QCadastro_CadDESC_FAX_COBRANCA
        QCadastro_CadIND_SEPROC_SIMNAO.Value := 'NAO';
        QCadastro_CadDESC_INSCRICAO_MUNICIPAL.Text := IBQCadastroINSCRICAOMUNICIPAL.Text;
        QCadastro_CadNOME_CONJUGE.Text := IBQCadastroCONJUGE.Text;
        QCadastro_CadDESC_CPF_CONJUGE.Text := IBQCadastroCPFCNPJ_CONJUGUE.TExt;
        QCadastro_CadDESC_IDENTIDADE_CONJUGE.Text := IBQCadastroRGIE_CONJUGUE.Text;
        QCadastro_CadCOD_CLASS_CADASTRO.Value := 1;
    //    QCadastro_CadCOD_BANCO_AGENCIA
    //    QCadastro_CadCOD_OPERACAO_CC
    //    QCadastro_CadDT_NASCIMENTO_CONTATO
    //    QCadastro_CadNOME_CONTATO2
    //    QCadastro_CadDT_NASCIMENTO2
    //    QCadastro_CadCOD_VENDEDOR
    //    QCadastro_CadPERC_COMISSAO
        QCadastro_CadDESC_COMPLEMENTO.Text := IBQCadastroENDERECOCOMPLEMENTO.TExt;
        QCadastro_CadIND_FISICA_JURIDICA.Text := IBQCadastroPESSOAFISICAJURIDICA.Text;
        QCadastro_CadDESC_ENDERECO_ENTREGA.Text := IBQCadastroENDERECO.Text;
        QCadastro_CadDESC_CIDADE_ENTREGA.Value := IBQCadastroDesc_Cidade.Value;
        QCadastro_CadDESC_BAIRRO_ENTREGA.Text := IBQCadastroENDERECOBAIRRO.Text;
    //    QCadastro_CadDESC_OBS
    //    QCadastro_CadDESC_OBS1
    //    QCadastro_CadDESC_OBS2
    //    QCadastro_CadDESC_FORMA_COMPRA
        QCadastro_CadCOD_USUARIO.Value := 1;
        QCadastro_CadDESC_REF_COMERCIAL1.Text := IBQCadastroREFERENCIACOMERCIAL.Text;
    //    QCadastro_CadDESC_REF_COMERCIAL2
    //    QCadastro_CadDESC_REF_COMERCIAL3
        QCadastro_CadDESC_REF_BANCO1.Text := IBQCadastroREFERENCIABANCARIA.Text;
    //    QCadastro_CadDESC_REF_BANCO2
    //    QCadastro_CadDESC_REF_BANCO3
    //   QCadastro_CadDESC_REF_PARENTE_NOME
    //    QCadastro_CadDESC_REF_PARENTE_ENDERECO
    //    QCadastro_CadDESC_REF_PARENTE_CIDADE
    //    QCadastro_CadDESC_REF_PARENTE_TELEFONE
    //    QCadastro_CadDESC_REF_OUTRAS
    //    QCadastro_CadCOD_CADASTRO_NOVO

        QCadastro_CadDESC_ORGAO_EMISSOR.Text := IBQCadastroORGAOEMISSORRG.Text;
    //    QCadastro_CadDESC_INSCRICAO_INSS
    //    QCadastro_CadDESC_CARTEIRA
    //    QCadastro_CadDT_EXPEDICAO_CARTEIRA
    //    QCadastro_CadIND_LIBERA_VENDA
    //    QCadastro_CadCOD_VENDEDOR_PREPOSTO
    //    QCadastro_CadIND_REGIME_ESPECIAL
        QCadastro_CadCOD_CIDADE.Value := IBQCadastroCidade.Value;
    //    QCadastro_CadDESC_HOBBIE
    //    QCadastro_CadDESC_DESTRITO
    //    QCadastro_CadDESC_AGENCIA
    //    QCadastro_CadDESC_CONTA_CORRENTE
    //    QCadastro_CadCOD_OPERACAO_CC1
    //    QCadastro_CadCOD_OPERACAO_CC2
    //    QCadastro_CadDESC_PLACA
        QCadastro_CadPERC_DESCONTO.Value := 0;
    //    QCadastro_CadIND_LIBERA_BLOQUETO
    //    QCadastro_CadDT_CONSULTA_SINTEGRA
    //    QCadastro_CadDESC_PROFISSAO_CONJUGE
        QCadastro_CadDT_NASCIMENTO_CONJUGE.Text := IBQCadastroCONJUGEDATANASCIMENTO.Text;
    //    QCadastro_CadDESC_EMPRESA_CONJUGE
    //    QCadastro_CadVL_SALARIO_CONJUGE
    //    QCadastro_CadDESC_FUNCAO
    //    QCadastro_CadDESC_EMPRESA
    //    QCadastro_CadDESC_FONE_EMPRESA
    //    QCadastro_CadDESC_TEMPO
        QCadastro_CadVAL_SALARIO.Text := IBQCadastroSALARIO.Text;
    {    QCadastro_CadDESC_PLACA_CARRETA1
        QCadastro_CadDESC_PLACA_CARRETA2
        QCadastro_CadDESC_BAIRRO_COBRANCA
        QCadastro_CadDESC_GARANTIAS
        QCadastro_CadNOME_AUTORIZADO1
        QCadastro_CadNOME_AUTORIZADO2
        QCadastro_CadNOME_AUTORIZADO3
        QCadastro_CadDESC_CPF_AUTORIZADO1
        QCadastro_CadDESC_CPF_AUTORIZADO2
        QCadastro_CadDESC_CPF_AUTORIZADO3
        QCadastro_CadDESC_GARANTIAS_OUTRAS
        QCadastro_CadDESC_COMPLEMENTO_SINTEGRA
        QCadastro_CadDT_SEPROCADO
        QCadastro_CadPERC_META
        QCadastro_CadCOD_PRAZO_VENCIMENTO
        QCadastro_CadIND_SOJICULTOR_PARTICIPANTE
        QCadastro_CadNUM_DIA_VISITA
        QCadastro_CadDESC_FREQUENCIA_VISITA
        QCadastro_CadNUM_HORA_VISITA
        QCadastro_CadNUM_DIA_VENCTO
        QCadastro_CadNOME_TITULAR
    }

        QCadastro_Cad.Post;
      Except
        If QCadastro_Cad.State = dsInsert Then
          QCadastro_Cad.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IbqCadastro.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDadosGrasel.BitBtn4Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCodCadastro, wComando : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IbqFornecedor.Open;
    QCadastro_Cad.Open;
    IbqFornecedor.First;
    PB.Max := IbqFornecedor.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IbqFornecedor.Eof do
    Begin
      Try
        wCodCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','NUM_CGC_CPF = '+ QuotedStr(IBQFornecedorCPFCNPJ.Text));
        If wCodCadastro <> '' Then
         Begin
           With DMOracle do
           Begin
             QExecSQL.Close;
             QExecSQL.SQL.Clear;
             wComando := 'UPDATE TB_CADASTRO SET COD_CADASTRO_NOVO=' + IBQFornecedorCODIGO.Text;
             wComando := wComando + ' WHERE COD_CADASTRO = '+wCodCadastro;
             QExecSQL.SQL.Add(wComando);
             QExecSQL.ExecSQL;
            End;
           IBQFornecedor.Next;
           Continue;
         End;
        QCadastro_Cad.Insert;
//        QCadastro_CadCOD_CADASTRO.Value := IBQCadastroCODIGOCLIENTE.Value;
        QCadastro_CadCOD_TIPO_CADASTRO.Value := 2;
        QCadastro_CadCOD_REGIAO.Value := 1;
        QCadastro_CadCOD_PAIS.Value := 1;
        QCadastro_CadCOD_ESTADO_CIVIL.Value := 5;

        QCadastro_CadCOD_RAMO.Value := 1;
        QCadastro_CadCOD_ESTADO.Value := IBQFornecedorESTADO.Value;
        QCadastro_CadNOME.Value := IBQFornecedorNOME.Value;

        QCadastro_CadDESC_ENDERECO.Value := Trim(IBQFornecedorENDERECO.Value) + ','+IBQFornecedorEnderecoNumeroRua.Text;
        QCadastro_CadDESC_CIDADE.Value := IBQFornecedorDesc_Cidade.Value;
        QCadastro_CadDESC_CEP.Text :=  IBQFornecedorCEP.Text;
        QCadastro_CadNUM_CGC_CPF.Value := IBQFornecedorCPFCNPJ.Value;
        QCadastro_CadNUM_INSCRICAO.Text := IBQFornecedorRGIE.Text;
        QCadastro_CadDT_CADASTRO.Value := Date;
        QCadastro_CadIND_SEXO_CATEGORIA.Text := 'J';
        QCadastro_CadNUM_CAIXA_POSTAL.Text := IBQFornecedorENDERECOCXPOSTAL.Text;
    //    QCadastro_CadDT_CANCELAMENTO
        QCadastro_CadDESC_TELEFONE.Text := IBQFornecedorComercialFONE.Text;
        QCadastro_CadDESC_FAX.Text  := IBQFornecedorComercialFax.Text;
        QCadastro_CadNOME_CONTATO.Text := IBQFornecedorCONTATO.Text;
        QCadastro_CadDESC_BAIRRO.Text := IBQFornecedorENDERECOBAIRRO.Text;
        QCadastro_CadVAL_LIMITE.Value := 0;
        QCadastro_CadDESC_FANTASIA.Text := IBQFornecedorAPELIDO.Text;
        QCadastro_CadDESC_CIDADE_COBRANCA.Value := IBQFornecedorDesc_Cidade.Value;
        QCadastro_CadDESC_ENDERECO_COBRANCA.Value := QCadastro_CadDESC_ENDERECO.Value;
        QCadastro_CadDESC_ESTADO_COBRANCA.Value := IBQFornecedorESTADO.Value;
        QCadastro_CadDESC_CEP_COBRANCA.Text :=  IBQFornecedorCEP.Text;
        QCadastro_CadDESC_TELEFONE_COMERCIAL.Text := IBQFornecedorCONTATOCELULAR.Text;
    //    QCadastro_CadNUM_JUNTA
    //    QCadastro_CadDT_FUNDACAO
    //    QCadastro_CadDT_JUNTA

    //    QCadastro_CadDESC_NATURALIDADE.Text :=
    //    QCadastro_CadDESC_ESTADO_NATURAL: TStringField;
        QCadastro_CadDESC_E_MAIL.Text := IBQFornecedorEMAIL.Text;
    //    QCadastro_CadDESC_FAX_COBRANCA
        QCadastro_CadIND_SEPROC_SIMNAO.Value := 'NAO';
        QCadastro_CadCOD_CLASS_CADASTRO.Value := 1;
    //    QCadastro_CadCOD_BANCO_AGENCIA
    //    QCadastro_CadCOD_OPERACAO_CC
    //    QCadastro_CadDT_NASCIMENTO_CONTATO
    //    QCadastro_CadNOME_CONTATO2
    //    QCadastro_CadDT_NASCIMENTO2
    //    QCadastro_CadCOD_VENDEDOR
    //    QCadastro_CadPERC_COMISSAO
        QCadastro_CadIND_FISICA_JURIDICA.Text := IBQFornecedorPESSOAFISICAJURIDICA.Text;
        QCadastro_CadDESC_ENDERECO_ENTREGA.Text := QCadastro_CadDESC_ENDERECO.Value;
        QCadastro_CadDESC_CIDADE_ENTREGA.Value := IBQFornecedorDesc_Cidade.Value;
        QCadastro_CadDESC_BAIRRO_ENTREGA.Text := IBQFornecedorENDERECOBAIRRO.Text;
    //    QCadastro_CadDESC_OBS
    //    QCadastro_CadDESC_OBS1
    //    QCadastro_CadDESC_OBS2
    //    QCadastro_CadDESC_FORMA_COMPRA
        QCadastro_CadCOD_USUARIO.Value := 1;
    //    QCadastro_CadDESC_REF_COMERCIAL2
    //    QCadastro_CadDESC_REF_COMERCIAL3
    //    QCadastro_CadDESC_REF_BANCO2
    //    QCadastro_CadDESC_REF_BANCO3
    //   QCadastro_CadDESC_REF_PARENTE_NOME
    //    QCadastro_CadDESC_REF_PARENTE_ENDERECO
    //    QCadastro_CadDESC_REF_PARENTE_CIDADE
    //    QCadastro_CadDESC_REF_PARENTE_TELEFONE
    //    QCadastro_CadDESC_REF_OUTRAS
    //    QCadastro_CadCOD_CADASTRO_NOVO

    //    QCadastro_CadDESC_INSCRICAO_INSS
    //    QCadastro_CadDESC_CARTEIRA
    //    QCadastro_CadDT_EXPEDICAO_CARTEIRA
    //    QCadastro_CadIND_LIBERA_VENDA
    //    QCadastro_CadCOD_VENDEDOR_PREPOSTO
    //    QCadastro_CadIND_REGIME_ESPECIAL
        QCadastro_CadCOD_CIDADE.Value := IBQFornecedorCidade.Value;
    //    QCadastro_CadDESC_HOBBIE
        QCadastro_CadDESC_DESTRITO.Text := IBQFornecedorEnderecoComplemento.Text;
    //    QCadastro_CadDESC_AGENCIA
    //    QCadastro_CadDESC_CONTA_CORRENTE
    //    QCadastro_CadCOD_OPERACAO_CC1
    //    QCadastro_CadCOD_OPERACAO_CC2
    //    QCadastro_CadDESC_PLACA
        QCadastro_CadPERC_DESCONTO.Value := 0;
    //    QCadastro_CadIND_LIBERA_BLOQUETO
    //    QCadastro_CadDT_CONSULTA_SINTEGRA
    //    QCadastro_CadDESC_PROFISSAO_CONJUGE
    //    QCadastro_CadDESC_EMPRESA_CONJUGE
    //    QCadastro_CadVL_SALARIO_CONJUGE
    //    QCadastro_CadDESC_FUNCAO
    //    QCadastro_CadDESC_EMPRESA
    //    QCadastro_CadDESC_FONE_EMPRESA
    //    QCadastro_CadDESC_TEMPO
    {    QCadastro_CadDESC_PLACA_CARRETA1
        QCadastro_CadDESC_PLACA_CARRETA2
        QCadastro_CadDESC_BAIRRO_COBRANCA
        QCadastro_CadDESC_GARANTIAS
        QCadastro_CadNOME_AUTORIZADO1
        QCadastro_CadNOME_AUTORIZADO2
        QCadastro_CadNOME_AUTORIZADO3
        QCadastro_CadDESC_CPF_AUTORIZADO1
        QCadastro_CadDESC_CPF_AUTORIZADO2
        QCadastro_CadDESC_CPF_AUTORIZADO3
        QCadastro_CadDESC_GARANTIAS_OUTRAS
        QCadastro_CadDESC_COMPLEMENTO_SINTEGRA
        QCadastro_CadDT_SEPROCADO
        QCadastro_CadPERC_META
        QCadastro_CadCOD_PRAZO_VENCIMENTO
        QCadastro_CadIND_SOJICULTOR_PARTICIPANTE
        QCadastro_CadNUM_DIA_VISITA
        QCadastro_CadDESC_FREQUENCIA_VISITA
        QCadastro_CadNUM_HORA_VISITA
        QCadastro_CadNUM_DIA_VENCTO
        QCadastro_CadNOME_TITULAR
    }

        QCadastro_Cad.Post;
      Except
        If QCadastro_Cad.State = dsInsert Then
          QCadastro_Cad.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IbqFornecedor.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;


end;

procedure TFImportaDadosGrasel.BitBtn5Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IbqProduto.Open;
    QProduto_Cad.Open;
    IbqProduto.First;
    PB.Max := IbqProduto.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IbqProduto.Eof do
    Begin
      Try
        QProduto_Cad.Insert;
        QProduto_CadCOD_PRODUTO.Text := IBQProdutoCODIGO.Text;
        Case  IBQProdutoLINHA.Value of
          0 : QProduto_CadCOD_CLASSE.value := 2;
          1 : QProduto_CadCOD_CLASSE.value := 3;
          2 : QProduto_CadCOD_CLASSE.value := 4;
          4 : QProduto_CadCOD_CLASSE.value := 5;
          5 : QProduto_CadCOD_CLASSE.value := 6;
          6 : QProduto_CadCOD_CLASSE.value := 7;
          7 : QProduto_CadCOD_CLASSE.value := 8;
          10 : QProduto_CadCOD_CLASSE.value := 9;
          11 : QProduto_CadCOD_CLASSE.value := 10;
          12 : QProduto_CadCOD_CLASSE.value := 11;
          13 : QProduto_CadCOD_CLASSE.value := 12;
          14 : QProduto_CadCOD_CLASSE.value := 13;
          15 : QProduto_CadCOD_CLASSE.value := 14;
          16 : QProduto_CadCOD_CLASSE.value := 15;
          17 : QProduto_CadCOD_CLASSE.value := 16;
        End;
        QProduto_CadCOD_TRIBUTACAO.Value := 1;
        QProduto_CadDESC_PRODUTO.Value := copy(IBQProdutoNOME.Value,1,58);
        If QProduto_CadCOD_PRODUTO.Value = 80 then
           QProduto_CadNUM_EMBALAGEM.Value := 40
        Else
           QProduto_CadNUM_EMBALAGEM.Value := IBQProdutoPESO.Value;
        QProduto_CadDESC_UNIDADE.Text := IBQProdutoUNIDADE.Text;
        QProduto_CadVAL_VAREJO.Value := 0;
        QProduto_CadVAL_ATACADO.Value := 0;
        QProduto_CadPERC_DESCONTO_MAXIMO.Value := 0;
        QProduto_CadPERC_IPI.Value := 0;
        QProduto_CadIND_TIPO_PRODUTO.Value := 'COMERCIAL';
        QProduto_CadPERC_COMISSAO.value := 0;
        QProduto_CadPERC_ISS.Value := 0;
        QProduto_CadPERC_INSS.Value := 0;;
        QProduto_CadIND_SITUACAO.Value := 'ATIVO';
        QProduto_CadNUM_VOLUMES.Value := 0;
        QProduto_CadIND_CESTA_BASICA.Value := 'N';
        QProduto_CadIND_ESTOFARIA.Value := 'N';
        QProduto_CadIND_PINTURA.Value := 'N';
        QProduto_Cad.Post;
      Except
        Showmessage('Código:'+IBQProdutoCODIGO.Text);
        If QProduto_Cad.State = dsInsert Then
          QProduto_Cad.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IBQProduto.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;

procedure TFImportaDadosGrasel.BitBtn6Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IbqDesconto.Open;
    QDesconto_Agricola.Open;
    IbqDesconto.First;
    PB.Max := IbqDesconto.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IbqDesconto.Eof do
    Begin
      Try
        QDesconto_Agricola.Insert;
        QDesconto_AgricolaCOD_PRODUTO.text := IBQDescontoCODIGOPRODUTO.Text;
        QDesconto_AgricolaPERC_UMIDADE.Value := IBQDescontoUMIDADE.Value;
        QDesconto_AgricolaPERC_DESCONTO.Value := IBQDescontoDESCONTO.Value;
        QDesconto_AgricolaCOD_FILIAL.Value := 1;
        QDesconto_Agricola.Post;
      Except
        Showmessage('Código:'+IBQDescontoCODIGOPRODUTO.Text);
        If QDesconto_Agricola.State = dsInsert Then
          QDesconto_Agricola.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IBQDesconto.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;

procedure TFImportaDadosGrasel.BitBtn7Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCodCadastro : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IBQContaPagarCab.Open;
    QContaPagarCab.Open;
    QContaPagarMov.Open;
    IBQContaPagarCab.First;
    PB.Max := IBQContaPagarCab.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IBQContaPagarCab.Eof do
    Begin
      Try
        QContaPagarCab.Insert;
        QContaPagarCabCOD_FINALIDADE.Value := 3;
//        QContaPagarCabCOD_BANCO_AGENCIA
        wCodCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','COD_CADASTRO_NOVO = '+ IBQContaPagarCabCODIGOFORNECEDOR.Text);
        If wCodCadastro <> '' Then
           QContaPagarCabCOD_CADASTRO.Value := StrToInt(wCodCadastro)
        Else
           QContaPagarCabCOD_CADASTRO.Value := IBQContaPagarCabCODIGOFORNECEDOR.Value;
        QContaPagarCabCOD_FILIAL.Value := 1;
        QContaPagarCabNUM_TITULO.Value := IBQContaPagarCabNUMERODUPLICATA.Value;
        QContaPagarCabNUM_PARCELA.Value := IBQContaPagarCabNUMEROPARCELA.Value;
        QContaPagarCabCOD_CONTRATO_PJURIDICA.Value := IBQContaPagarCabNUMERODOCUMENTO.Value;
        QContaPagarCabDESC_TIPO_DOCUMENTO.Value := 'NF';
        QContaPagarCabDT_MOVIMENTO.Value := IBQContaPagarCabDATAEMISSAO.Value;
        QContaPagarCabDT_VENCIMENTO.Value := IBQContaPagarCabDATAVENCIMENTO.Value;
        QContaPagarCabDT_EMISSAO.Value := IBQContaPagarCabDATAEMISSAO.Value;
        QContaPagarCabDT_CAPITALIZACAO.Value := IBQContaPagarCabDATAVENCIMENTO.Value;
        QContaPagarCabVAL_TITULO.Value := IBQContaPagarCabVALORSALDO.Value;
        QContaPagarCabDESC_OBSERVACAO.Value := IBQContaPagarCabOBSERVACAO.Value;
        QContaPagarCabVAL_ORIGINAL.Value := IBQContaPagarCabVALORDUPLICATA.Value;
        QContaPagarCabCOD_DEPARTAMENTO.Value := 1;
        QContaPagarCabPERC_DESC_ANTECIPACAO.Value := 0;
        QContaPagarCabPERC_DESC_PONTUALIDADE.Value := 0;
        If QContaPagarCabVAL_TITULO.Value = 0 Then
         Begin
           QContaPagarCabDT_BAIXA.Value := QContaPagarCabDT_VENCIMENTO.Value;
           QContaPagarCabIND_SITUACAO.Value := 'BAIXA TOTAL';
         End
        Else
           QContaPagarCabIND_SITUACAO.Value := 'ABERTO';
        QContaPagarCab.Post;

        QContaPagarMov.Insert;
        QContaPagarMovCOD_CONTA_PAGAR_CAB.Value := QContaPagarCabCod_Conta_Pagar_Cab.Value;
        QContaPagarMovDT_MOVIMENTO.Value := QContaPagarCabDT_EMISSAO.Value;
        QContaPagarMovVAL_MOVIMENTO.Value := QContaPagarCabVAL_ORIGINAL.Value;
        QContaPagarMovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
        QContaPagarMovDT_USUARIO.Value := Date;
        QContaPagarMovCOD_USUARIO.Value := 1;
        QContaPagarMov.Post;
      Except
        If QContaPagarCab.State = dsInsert Then
          QContaPagarCab.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IBQContaPagarCab.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDadosGrasel.BitBtn8Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCodConta_Pagar : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IBQContaPagarMov.Open;
    QContaPagarMov.Open;
    IBQContaPagarMov.First;
    PB.Max := IBQContaPagarMov.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IBQContaPagarMov.Eof do
    Begin
      Try
        wCodConta_Pagar := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB','NUM_TITULO = '+ IBQContaPagarMovNUMERODUPLICATA.Text + ' AND NUM_PARCELA='+IBQContaPagarMovNUMEROPARCELA.Text);
        If wCodConta_Pagar <> '' Then
         Begin
           If IBQContaPagarMovVALORPAGO.Value <> 0 Then
            Begin
              QContaPagarMov.Insert;
              QContaPagarMovCOD_CONTA_PAGAR_CAB.Value := StrToInt(wCodConta_Pagar);
              QContaPagarMovDT_MOVIMENTO.Value := IBQContaPagarMovDATAPAGAMENTO.Value;
              QContaPagarMovVAL_MOVIMENTO.Value := IBQContaPagarMovVALORPAGO.Value;
              QContaPagarMovIND_TIPO_MOVIMENTO.Value := 'PGTO. PRINCIPAL';
              QContaPagarMovDT_USUARIO.Value := Date;
              QContaPagarMovCOD_USUARIO.Value := 1;
              QContaPagarMov.Post;
            End;
           If IBQContaPagarMovVALORDESCONTO.Value <> 0 Then
            Begin
              QContaPagarMov.Insert;
              QContaPagarMovCOD_CONTA_PAGAR_CAB.Value := StrToInt(wCodConta_Pagar);
              QContaPagarMovDT_MOVIMENTO.Value := IBQContaPagarMovDATAPAGAMENTO.Value;
              QContaPagarMovVAL_MOVIMENTO.Value := IBQContaPagarMovVALORDESCONTO.Value;
              QContaPagarMovIND_TIPO_MOVIMENTO.Value := 'DESCONTO';
              QContaPagarMovDT_USUARIO.Value := Date;
              QContaPagarMovCOD_USUARIO.Value := 1;
              QContaPagarMov.Post;
            End;
           If IBQContaPagarMovVALORJUROS.Value <> 0 Then
            Begin
              QContaPagarMov.Insert;
              QContaPagarMovCOD_CONTA_PAGAR_CAB.Value := StrToInt(wCodConta_Pagar);
              QContaPagarMovDT_MOVIMENTO.Value := IBQContaPagarMovDATAPAGAMENTO.Value;
              QContaPagarMovVAL_MOVIMENTO.Value := IBQContaPagarMovVALORJUROS.Value;
              QContaPagarMovIND_TIPO_MOVIMENTO.Value := 'PGTO. JUROS';
              QContaPagarMovDT_USUARIO.Value := Date;
              QContaPagarMovCOD_USUARIO.Value := 1;
              QContaPagarMov.Post;
            End;
         End;
      Except
        If QContaPagarMov.State = dsInsert Then
          QContaPagarMov.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IBQContaPagarMov.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;

procedure TFImportaDadosGrasel.BitBtn9Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IBQContaReceberCab.Open;
    QContaReceberCab.Open;
    QContaReceberMov.Open;
    IBQContaReceberCab.First;
    PB.Max := IBQContaReceberCab.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IBQContaReceberCab.Eof do
    Begin
      Try
        QContaReceberCab.Insert;
        QContaReceberCabCOD_FINALIDADE.Value := 2;
        QContaReceberCabCOD_FILIAL.Value := 1;
        QContaReceberCabNUM_TITULO.Value := IBQContaReceberCabNUMERODUPLICATA.Value;
        QContaReceberCabNUM_PARCELA.Value := IBQContaReceberCabNUMEROPARCELA.Value;
        QContaReceberCabNUM_OS.Value := IBQContaReceberCabNUMERODOCUMENTO.Value;
        QContaReceberCabDESC_TIPO_DOCUMENTO.Value := 'NF';
        QContaReceberCabDT_MOVIMENTO.Text := IBQContaReceberCabDATAEMISSAO.Text;
        QContaReceberCabDT_VENCIMENTO.Text := IBQContaReceberCabDATAVENCIMENTO.Text;
        QContaReceberCabDT_EMISSAO.Text := IBQContaReceberCabDATAEMISSAO.Text;
        QContaReceberCabDT_CAPITALIZACAO.Text := IBQContaReceberCabDATAVENCIMENTO.Text;
        QContaReceberCabVAL_TITULO.Value := IBQContaReceberCabVALORSALDO.Value;
        QContaReceberCabDESC_OBSERVACAO.Text := IBQContaReceberCabOBSERVACAO.Text;
        QContaReceberCabCOD_CADASTRO.Value := IBQContaReceberCabCODIGOCLIENTE.Value;
        QContaReceberCabVAL_ORIGINAL.Value := IBQContaReceberCabVALORDUPLICATA.Value;
        QContaReceberCabCOD_DEPARTAMENTO.Value := 1;
        QContaReceberCabPerc_Comissao.Value := 0;
        QContaReceberCabPERC_COMISSAO1.Value := 0;
        If QContaReceberCabVAL_TITULO.Value = 0 Then
         Begin
           QContaReceberCabDT_BAIXA.Text := IBQContaReceberCabDATAVENCIMENTO.Text;
           QContaReceberCabIND_SITUACAO.Value := 'BAIXA TOTAL';
         End
        Else
          QContaReceberCabIND_SITUACAO.Value := 'ABERTO';
        QContaReceberCab.Post;
        QContaReceberMov.Insert;
        QContaReceberMovCOD_CONTA_RECEBER_CAB.Value := QContaReceberCabCOD_CONTA_RECEBER_CAB.Value;
        QContaReceberMovDT_MOVIMENTO.Text := IBQContaReceberCabDATAEMISSAO.Text;
        QContaReceberMovVAL_MOVIMENTO.Value := QContaReceberCabVAL_ORIGINAL.Value;
        QContaReceberMovCOD_USUARIO.Value := 1;
        QContaReceberMovDT_USUARIO.Value := Date;
        QContaReceberMovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
        QContaReceberMov.Post;
      Except
        If QContaReceberCab.State = dsInsert Then
          QContaReceberCab.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IBQContaReceberCab.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;


end;

procedure TFImportaDadosGrasel.BitBtn10Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCodConta_Receber : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaGrasel do
  Begin
    IBQContaReceberMov.Open;
    QContaReceberMov.Open;
    IBQContaReceberMov.First;
    PB.Max := IBQContaReceberMov.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not IBQContaReceberMov.Eof do
    Begin
      Try
        wCodConta_Receber := DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB','NUM_TITULO = '+ IBQContaReceberMovNUMERODUPLICATA.Text + ' AND NUM_PARCELA='+IBQContaReceberMovNUMEROPARCELA.Text);
        If wCodConta_Receber <> '' Then
         Begin
           If IBQContaReceberMovVALORPAGO.Value <> 0 Then
            Begin
              QContaReceberMov.Insert;
              QContaReceberMovCOD_CONTA_RECEBER_CAB.Value := StrToInt(wCodConta_Receber);
              QContaReceberMovDT_MOVIMENTO.Value := IBQContaReceberMovDATAPAGAMENTO.Value;
              QContaReceberMovVAL_MOVIMENTO.Value := IBQContaReceberMovVALORPAGO.Value;
              QContaReceberMovIND_TIPO_MOVIMENTO.Value := 'PGTO. PRINCIPAL';
              QContaReceberMovDT_USUARIO.Value := Date;
              QContaReceberMovCOD_USUARIO.Value := 1;
              QContaReceberMov.Post;
            End;
           If IBQContaReceberMovVALORDESCONTO.Value <> 0 Then
            Begin
              QContaReceberMov.Insert;
              QContaReceberMovCOD_CONTA_RECEBER_CAB.Value := StrToInt(wCodConta_Receber);
              QContaReceberMovDT_MOVIMENTO.Value := IBQContaReceberMovDATAPAGAMENTO.Value;
              QContaReceberMovVAL_MOVIMENTO.Value := IBQContaReceberMovVALORDESCONTO.Value;
              QContaReceberMovIND_TIPO_MOVIMENTO.Value := 'DESCONTO';
              QContaReceberMovDT_USUARIO.Value := Date;
              QContaReceberMovCOD_USUARIO.Value := 1;
              QContaReceberMov.Post;
            End;
           If IBQContaReceberMovVALORJUROS.Value <> 0 Then
            Begin
              QContaReceberMov.Insert;
              QContaReceberMovCOD_CONTA_RECEBER_CAB.Value := StrToInt(wCodConta_Receber);
              QContaReceberMovDT_MOVIMENTO.Value := IBQContaReceberMovDATAPAGAMENTO.Value;
              QContaReceberMovVAL_MOVIMENTO.Value := IBQContaReceberMovVALORJUROS.Value;
              QContaReceberMovIND_TIPO_MOVIMENTO.Value := 'PGTO. JUROS';
              QContaReceberMovDT_USUARIO.Value := Date;
              QContaReceberMovCOD_USUARIO.Value := 1;
              QContaReceberMov.Post;
            End;
         End;
      Except
        If QContaReceberMov.State = dsInsert Then
          QContaReceberMov.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      IBQContaReceberMov.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

end.





unit UContasReceberVoltaBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Grids, DBGrids, ComCtrls, OracleData, OraTeste;

type
  TFContasReceberVoltaBaixa = class(TForm)
    PCBaixa: TPageControl;
    TS0Localiza: TTabSheet;
    GroupBox1: TGroupBox;
    Fornecedor: TLabel;
    DBGrid1: TDBGrid;
    METexto: TMaskEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    MEDataVencInicial: TMaskEdit;
    MEDataVencFinal: TMaskEdit;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MEDataEmissaoInicial: TMaskEdit;
    MEDataEmissaoFinal: TMaskEdit;
    MECodCliente: TMaskEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    MeNumTitulo: TMaskEdit;
    Label18: TLabel;
    SbProcura: TBitBtn;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    MeDataBaixaInicial: TMaskEdit;
    MeDataBaixaFinal: TMaskEdit;
    Label7: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MECodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MECodClienteExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContasReceberVoltaBaixa: TFContasReceberVoltaBaixa;

implementation

uses UContasReceber_cl, UOracle_cl, UPlanilha_cl, UContasPagar_cl,
  UMoeda_cl, UParamSistema_cl, UCadastroCons, UCadastro_cl, URecibo_Dos,
  UFinalidade_cl, UHistorico_cl, USenha, UUsuario_cl;

{$R *.DFM}

procedure TFContasReceberVoltaBaixa.BitBtn2Click(Sender: TObject);
var
  PosQuery: Integer;
  wTipoRecibo : string;
begin
  If DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= DMContasReceber.QContasReceberBaixaMovDt_Movimento.Value Then
     Raise Exception.Create('Não é Permitido Voltar Confirmação - Fechamento Contabil');
  If Trunc(DMContasReceber.QContasReceberBaixaMovDt_Movimento.Value) <> Trunc(DmOracle.QDataServDTSERVIDOR.Value) Then
   Begin
     If MessageDlg('Está operação poderá alterar o saldo do caixa, confirma?', mtConfirmation, [mbYes, mbNo], 0) = MrYes then
      Begin
        if (DMUsuario.Privilegiado = False) and (DMParamSistema.QParamSistemaDESC_SENHA_OFICINA.Text <> '') then //Não aparecer a tela de senha para usuário privilegiado. Solicit. Plantiagro. Junior - 07/08/2015
        begin
          If FSenha = Nil Then
           FSenha := TFSenha.Create(Application);
          If FSenha.ShowModal = MrOK Then
           If Trim(FSenha.EdSenha.Text) <> DMParamSistema.QParamSistemaDESC_SENHA_OFICINA.Text Then
              Raise Exception.Create('Senha Inválida');
        end;
      End
     Else
      Raise Exception.Create('Operação cancelada');
   End;
  // Impressão de recibo de Volta de Baixa.
  DMFinalidade.QFinalidade.Close;
  DMFinalidade.QFinalidade.SetVariable('PK', DMContasReceber.QContasReceberBaixaCOD_FINALIDADE.Value);
  DMFinalidade.QFinalidade.Open;

  DMHistorico.QHistorico.Close;
  DMHistorico.QHistorico.SetVariable('PK', DMFinalidade.QFinalidadeCOD_HISTORICO_BAIXA.Value);
  DMHistorico.QHistorico.Open;
  with DMContasReceber do
  begin
    if (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value <> 'PRINCIPAL') Then
    begin
      if not(DMOracle.DBCemapa.InTransaction) then
        DMOracle.DBCemapa.StartTransaction;
      PosQuery := QContasReceberBaixa.RecNo;
      Try
        If (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value <> 'JUROS') Then
        Begin
{comentado pois grava o primeiro registro do Audit vazio, apenas com a data do audit e o nome da tabela. Foi movido a linha para o final. Alex 26/05/2023
          DMOracle.Audit( TOracleDataset1 (DMContasReceber.QContasReceber_Cab ), 'Volta Baixa' ); }
          DMPlanilha.Descontabiliza(DMContasReceber.QContasReceberBaixaMovCod_Lancto_contabil_Cred.Value,'CR_CP_MOV');
          DMPlanilha.Descontabiliza(DMContasReceber.QContasReceberBaixaMovCod_Lancto_contabil_Deb.Value,'CR_CP_MOV');
          DMContasPagar.QVoltaMovBanco.SetVariable('COD_BCO_MOVIMENTO',DMContasReceber.QContasReceberBaixaMovCod_Bco_Movimento.Value);
          DMContasPagar.QVoltaMovBanco.ExecSQL;
          DMContasPagar.QVoltaMovCaixa.SetVariable('COD_CAIXA_MOV',DMContasReceber.QContasReceberBaixaMovCod_Caixa_Mov.Value);
          DMContasPagar.QVoltaMovCaixa.ExecSQL;
        End;
        QContasReceber_Cab.Close;
        QContasReceber_Cab.SetVariable('PK',QContasReceberBaixaCod_Conta_Receber_Cab.Value);
        QContasReceber_Cab.Open;
        QContasReceber_Cab.Edit;
        If (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'RECEBTO. PRINCIPAL') then
          QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value+QContasReceberBaixaMovVal_Movimento.Value
        else
          if (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'RECEBTO. JUROS') And (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO') Then
             QContasReceber_CabVal_Juros.Value:=QContasReceber_CabVal_Juros.Value+QContasReceberBaixaMovVal_Movimento.Value
          else
            if (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'DESC. CONCEDIDO') then
               QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value+QContasReceberBaixaMovVal_Movimento.Value
            Else
{                  If (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'JUROS')  Then
                 QContasReceber_CabVal_Juros.Value:=QContasReceber_CabVal_Juros.Value-QContasReceberBaixaMovVal_Movimento.Value
              Else   }
                if (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'DEVOLUCAO') then
                   QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value+QContasReceberBaixaMovVal_Movimento.Value;

        wTipoRecibo := DMHistorico.QHistoricoIND_TIPO_RECIBO.Text;

        if (wTipoRecibo = 'M') then
          if MessageDlg('Deseja emitir recibo de Volta de Baixa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            FRecibo_Dos.ReciboVoltaTitulo40Colunas(QContasReceberBaixaNOME.Text,
              QContasReceberBaixaNUM_PARCELA.Text, QContasReceberBaixaNUM_TITULO.Text,
              QContasReceberBaixaDT_VENCIMENTO.Value, QContasReceberBaixaDT_BAIXA.Value,
              QContasReceberBaixaVAL_ORIGINAL.Value, QContasReceberBaixaMovVAL_MOVIMENTO.Value,
              QContasReceberBaixaVAL_TITULO.Value + QContasReceberBaixaMovVAL_MOVIMENTO.Value,
              QContasReceberBaixaCOD_FILIAL.Value, QContasReceberBaixaCOD_CADASTRO.Value,
              QContasReceberBaixaDESC_FILIAL.Value);

        QContasReceberBaixaMov.Delete;

       // Muda a Situção do Título
        If FormatFloat('#,##0.00', QContasReceber_CabVal_Titulo.Value)
          = FormatFloat('#,##0.00', QContasReceber_CabVal_Original.Value) then
          Begin
            QContasReceber_CabDT_Baixa.Clear;
            QContasReceber_CabInd_Situacao.Value:='ABERTO';
            QContasReceber_CabVal_Juros.Value := 0; // na rotina before post volta a data de capitalizacao para a data de vencto
          End
        Else
          If ((QContasReceber_CabVal_Titulo.Value < QContasReceber_CabVal_Original.Value)) and (QContasReceber_CabVal_Titulo.Value <> 0) then
             QContasReceber_CabInd_Situacao.Value:='BAIXA PARCIAL';

        QContasReceber_Cab.post;
        DMOracle.DBCemapa.Commit;
//Adicionado a linha do Audit aqui. Alex 26/05/2023        
        DMOracle.Audit( TOracleDataset1 (DMContasReceber.QContasReceber_Cab ), 'Volta Baixa' );
{Criado este bloco para apagar os registros da tb_lancamento_cartao. Alex 29/11/2023}
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_LANCAMENTO_CARTAO WHERE COD_CONTA_RECEBER_CAB = ' + QContasReceber_CabCOD_CONTA_RECEBER_CAB.Text);
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
        try
          if PosQuery <= QContasReceberBaixa.RecordCount then
            QContasReceberBaixa.RecNo := PosQuery;
          except
        end;
        raise Exception.Create('Não foi possível voltar este lançamento');
      end;
      QContasReceberBaixaMov.Close;
      QContasReceberBaixa.Close;
      QContasReceberBaixa.Open;
      QContasReceberBaixaMov.Open;
      try
        if PosQuery <= QContasReceberBaixa.RecordCount then
          QContasReceberBaixa.RecNo := PosQuery;
        except
      end;
    end
    Else
      ShowMessage('Não é possível Voltar o Movimento Principal ou Juros');
  end;
end;

procedure TFContasReceberVoltaBaixa.BitBtn1Click(Sender: TObject);
begin
  if FCadastrocons = Nil then
    FCadastrocons:=TFCadastrocons.Create(Application);
  If FCadastrocons.ShowModal=MrOk then
    begin
      MECodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      MECodClienteExit(Self);
    end;
end;

procedure TFContasReceberVoltaBaixa.FormActivate(Sender: TObject);
begin
  DMContasReceber.QContasReceberBaixaMov.Close;
  DMContasReceber.QContasReceberBaixa.Close;
  MECodCliente.SetFocus;
end;

procedure TFContasReceberVoltaBaixa.MECodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 123 then //123 --> F3
    BitBtn1.Click;
end;

procedure TFContasReceberVoltaBaixa.MECodClienteExit(Sender: TObject);
begin
  if Trim(MECodCliente.Text) <> '' then
    MEtexto.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCliente.text)
  else
    MEtexto.Clear;

end;

procedure TFContasReceberVoltaBaixa.BitBtn3Click(Sender: TObject);
var wdata_teste:TDate;
begin
    With DMContasReceber do
      Begin
        QContasReceberBaixa.Close;
        QContasReceberBaixa.Sql.Clear;
        QContasReceberBaixa.Sql.Add('SELECT TB_CADASTRO."NOME" ,TB_CONTA_RECEBER_CAB."COD_CONTA_RECEBER_CAB" , TB_CONTA_RECEBER_CAB."COD_FINALIDADE" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."COD_BANCO_AGENCIA" ,TB_CONTA_RECEBER_CAB."COD_CADASTRO" , TB_CONTA_RECEBER_CAB."COD_FILIAL", TB_FILIAL."DESC_FILIAL" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."COD_DEPARTAMENTO" ,TB_CONTA_RECEBER_CAB."NUM_TITULO" ,TB_CONTA_RECEBER_CAB."NUM_PARCELA" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."DESC_TIPO_DOCUMENTO" ,TB_CONTA_RECEBER_CAB."DT_MOVIMENTO" ,TB_CONTA_RECEBER_CAB."DT_BAIXA" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."DT_VENCIMENTO" ,TB_CONTA_RECEBER_CAB."DT_EMISSAO" ,TB_CONTA_RECEBER_CAB."DT_CAPITALIZACAO" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."DT_CAPITALIZACAO_MOEDA" ,TB_CONTA_RECEBER_CAB."VAL_TITULO" ,TB_CONTA_RECEBER_CAB."COD_NOTA_CAB" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."DESC_OBSERVACAO" ,TB_CONTA_RECEBER_CAB."IND_ACEITE" ,TB_CONTA_RECEBER_CAB."IND_SITUACAO" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."VAL_ORIGINAL",TB_CONTA_RECEBER_CAB."VAL_JUROS",TB_CONTA_RECEBER_CAB."COD_ORDEM_COMPRA_CAB",TB_CLASS_CADASTRO.DESC_CLASSIFICACAO, ');
        QContasReceberBaixa.Sql.Add('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.COD_HISTORICO_DESC,TB_FINALIDADE.DESC_FINALIDADE, TB_FINALIDADE.PERC_JURO_MORA, TB_CONTA_RECEBER_CAB.IND_ENVIADO_BANCO, ');
        QContasReceberBaixa.Sql.Add('(SELECT COUNT(*) FROM TB_CONTA_RECEBER_CAB sub WHERE sub.NUM_TITULO = Tb_conta_receber_cab.NUM_TITULO AND sub.COD_CADASTRO = Tb_conta_receber_cab.COD_CADASTRO) AS QTD_PARCELA, ');
        QContasReceberBaixa.Sql.Add('TB_FINALIDADE.NUM_DIAS_CARENCIA, TB_FINALIDADE.IND_PERMITE_DESCONTO_BAIXA, TB_CADASTRO.DESC_ENDERECO, TB_CADASTRO.DESC_CIDADE, Tb_conta_receber_cab.PERC_DESC_ADIANTAMENTO, ');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO, TB_BANCO_AGENCIA.DESC_BANCO_AGENCIA ');
        QContasReceberBaixa.Sql.Add('FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_CLASS_CADASTRO,TB_FINALIDADE, TB_FILIAL, TB_BANCO_AGENCIA WHERE ');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO');
        QContasReceberBaixa.Sql.Add(' AND TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS_CADASTRO(+)');
        QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE');
        QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
        QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA(+)');
        QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + chr(39) + 'ABERTO' + chr(39));
        If Trim(MECodCliente.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CADASTRO.COD_CADASTRO = ' + Trim(MECodCliente.Text));
        If Trim(MeNumTitulo.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.NUM_TITULO = ' + Trim(MeNumTitulo.Text));
        If Trim(MEDataEmissaoInicial.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO >= ' + chr(39) + Trim(MEDataEmissaoInicial.Text) + chr(39));
        If Trim(MEDataEmissaoFinal.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' + chr(39) + Trim(MEDataEmissaoFinal.Text) + chr(39));
        If Trim(MEDataVencInicial.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + chr(39) + Trim(MEDataVencInicial.Text) + chr(39));
        If Trim(MEDataVencFinal.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + chr(39) + Trim(MEDataVencFinal.Text) + chr(39));
        If Trim(MEDataBaixaInicial.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_BAIXA >= ' + chr(39) + Trim(MEDataBaixaInicial.Text) + chr(39));
        If Trim(MEDataBaixaFinal.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_BAIXA <= ' + chr(39) + Trim(MEDataBaixaFinal.Text) + chr(39));
      QContasReceberBaixa.Open;
      QContasReceberBaixaMov.Open;
   End;
end;

end.

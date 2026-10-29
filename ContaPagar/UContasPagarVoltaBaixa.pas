unit UContasPagarVoltaBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Grids, DBGrids, ComCtrls, OracleData, OraTeste;

type
  TFContaPagarVoltaBaixa = class(TForm)
    PCBaixa: TPageControl;
    TS0Localiza: TTabSheet;
    GroupBox1: TGroupBox;
    SBProcura: TSpeedButton;
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
    MECodFornecedor: TMaskEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    Label13: TLabel;
    MeNumero: TMaskEdit;
    Label5: TLabel;
    MeNrCheque: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure SBProcuraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MECodFornecedorChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContaPagarVoltaBaixa: TFContaPagarVoltaBaixa;

implementation

uses UContasPagar_cl, UCadastroCons, UCadastro_cl, UOracle_cl, UPlanilha_cl,
  UParamSistema_cl, UMoeda_cl, USenha, UUsuario_cl;

{$R *.DFM}

procedure TFContaPagarVoltaBaixa.BitBtn1Click(Sender: TObject);
begin
  if FCadastrocons = Nil then
    FCadastrocons:=TFCadastrocons.Create(Application);
  If FCadastrocons.ShowModal=MrOk then
    begin
      MECodFornecedor.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    end;

end;

procedure TFContaPagarVoltaBaixa.SBProcuraClick(Sender: TObject);
var
  wdata_teste:TDate;
begin
    With DMContasPagar do
      Begin
        QContasPagarBaixa.Close;
        QContasPagarBaixa.Sql.Clear;
        QContasPagarBaixa.Sql.Add('SELECT TB_CADASTRO."NOME" ,TB_CONTA_PAGAR_CAB."COD_CONTA_PAGAR_CAB" ,TB_CONTA_PAGAR_CAB."COD_FINALIDADE" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."COD_BANCO_AGENCIA" ,TB_CONTA_PAGAR_CAB."COD_CADASTRO" ,TB_CONTA_PAGAR_CAB."COD_DEPARTAMENTO" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."COD_FILIAL" ,TB_CONTA_PAGAR_CAB."NUM_TITULO" ,TB_CONTA_PAGAR_CAB.COD_CONTRATO_GP,TB_CONTA_PAGAR_CAB."NUM_PARCELA" ,TB_CONTA_PAGAR_CAB."DESC_TIPO_DOCUMENTO" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."DT_MOVIMENTO" ,TB_CONTA_PAGAR_CAB."DT_BAIXA" ,TB_CONTA_PAGAR_CAB."DT_VENCIMENTO" ,TB_CONTA_PAGAR_CAB."DT_EMISSAO" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."DT_CAPITALIZACAO" ,TB_CONTA_PAGAR_CAB."VAL_TITULO" ,TB_CONTA_PAGAR_CAB."COD_NOTA_CAB" ,TB_CONTA_PAGAR_CAB."DESC_OBSERVACAO" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."IND_ACEITE" ,TB_CONTA_PAGAR_CAB."IND_SITUACAO" ,TB_CONTA_PAGAR_CAB."VAL_ORIGINAL" ,TB_CONTA_PAGAR_CAB."VAL_INDEXADO"');
        QContasPagarBaixa.Sql.Add(' ,TB_CONTA_PAGAR_CAB.DT_ACEITE,TB_FINALIDADE.COD_HISTORICO_DESC,TB_FINALIDADE.DESC_FINALIDADE,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB.PERC_DESC_PONTUALIDADE,TB_CONTA_PAGAR_CAB.PERC_DESC_ANTECIPACAO,TB_CONTA_PAGAR_CAB.DT_VENCIMENTO_PRORROGADO,');
        QContasPagarBaixa.Sql.Add('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.PERC_JURO_MORA, ');
        QContasPagarBaixa.Sql.Add('DECODE(TB_CONTA_PAGAR_CAB.IND_SITUACAO,'+Chr(39)+'ABERTO'+Chr(39)+',TB_FINALIDADE.NUM_DIAS_CARENCIA,0) AS NUM_DIAS_CARENCIA, ');
        QContasPagarBaixa.Sql.Add('TB_OBRA.DESC_OBRA, TB_FILIAL.DESC_FILIAL, TB_CADASTRO.DESC_ENDERECO, TB_CADASTRO.DESC_CIDADE ');
        QContasPagarBaixa.Sql.Add('FROM TB_CONTA_PAGAR_CAB,TB_CADASTRO,TB_FINALIDADE, TB_OBRA, TB_FILIAL  ');
        If Trim(MeNrCheque.Text) <> '' Then
         Begin
           QContasPagarBaixa.Sql.Add(',TB_BCO_MOVIMENTO,TB_CONTA_PAGAR_MOV WHERE TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_CONTA_PAGAR_CAB = TB_CONTA_PAGAR_MOV.COD_CONTA_PAGAR_CAB ');
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_MOV.COD_BCO_MOVIMENTO = TB_BCO_MOVIMENTO.COD_BCO_MOVIMENTO ');
           QContasPagarBaixa.Sql.Add(' AND TB_BCO_MOVIMENTO.NUM_CHEQUE = ' + Trim(MeNrCheque.Text));
         End
        Else
           QContasPagarBaixa.Sql.Add(' WHERE TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE ');
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_OBRA = TB_OBRA.COD_OBRA(+) ');
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
//        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.IND_SITUACAO <> '+Chr(39) + 'ABERTO' +Chr(39)); // um número menor que zero
        If Trim(MeCodFornecedor.Text) <> '' then
           QContasPagarBaixa.Sql.Add(' AND TB_CADASTRO.COD_CADASTRO = ' + Trim(MECodFornecedor.Text));
        If Trim(MeDataVencInicial.Text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO >= ' + chr(39) + Trim(MEDataVencInicial.Text) + chr(39));
        If Trim(MeDataVencFinal.Text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO <= ' + chr(39) + Trim(MEDataVencFinal.Text) + chr(39));
        If Trim(MeDataEmissaoInicial.Text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_EMISSAO >= ' + chr(39) + Trim(MEDataEmissaoInicial.Text) + chr(39));
        If Trim(MeDataEmissaoFinal.Text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_EMISSAO <= ' + chr(39) + Trim(MEDataEmissaoFinal.Text) + chr(39));
        If Trim(MeNumero.Text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.NUM_TITULO = ' + chr(39) + Trim(MeNumero.Text) + chr(39));
        QContasPagarBaixa.Sql.Add(' ORDER BY TB_CADASTRO.NOME, TB_CONTA_PAGAR_CAB.DT_VENCIMENTO');
        QContasPagarBaixa.Open;
        QContasPagarBaixaMov.Open;
      End;
end;

procedure TFContaPagarVoltaBaixa.FormCreate(Sender: TObject);
begin
//  MEDataVencInicial.Text:=DateToStr(DMOracle.DataServ-10);
//  MEDataVencFinal.Text:=DateToStr(DMOracle.DataServ+4);
end;

procedure TFContaPagarVoltaBaixa.MECodFornecedorChange(Sender: TObject);
begin
  if Trim(MECodFornecedor.Text) <>'' then
    MEtexto.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodFornecedor.text)
  else
    MEtexto.Clear;
end;

procedure TFContaPagarVoltaBaixa.BitBtn2Click(Sender: TObject);
var
  wMoeda:String;
  PosQuery: Integer;
begin
  If DMParamSistema.QParamSistemaDT_FECHAMENTO_FINANCEIRO.Value >= DMContasPagar.QContasPagarBaixaMovDT_MOVIMENTO.Value Then
     Raise Exception.Create('Não é Permitido Voltar Confirmação - Fechamento Contabil');
  If Trunc(DMContasPagar.QContasPagarBaixaMovDt_Movimento.Value) <> Trunc(DmOracle.QDataServDTSERVIDOR.Value) Then
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
  with DMContasPagar do
  begin
    if QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value <> 'PRINCIPAL' then
    begin
      if not(DMOracle.DBCemapa.InTransaction) then
        DMOracle.DBCemapa.StartTransaction;
      PosQuery := QContasPagarBaixa.RecNo;
      Try
        DMOracle.Audit( TOracleDataset1 (DMContasPagar.QContasPagar_Cab ), 'Volta Baixa' );
        DMPlanilha.Descontabiliza(DMContasPagar.QContasPagarBaixaMovCod_Lancto_Contabil_Cred.Value,'CR_CP_MOV');
        DMPlanilha.Descontabiliza(DMContasPagar.QContasPagarBaixaMovCod_Lancto_Contabil_Deb.Value,'CR_CP_MOV');
        QVoltaMovBanco.SetVariable('COD_BCO_MOVIMENTO',DMContasPagar.QContasPagarBaixaMovCod_Bco_Movimento.Value);
        QVoltaMovBanco.ExecSQL;
        QVoltaConciliacao.SetVariable('COD_BCO_MOVIMENTO',DMContasPagar.QContasPagarBaixaMovCod_Bco_Movimento.Value);
        QVoltaConciliacao.ExecSQL;
        QVoltaMovCaixa.Close;
        QVoltaMovCaixa.SetVariable('COD_CAIXA_MOV',DMContasPagar.QContasPagarBaixaMovCod_Caixa_Mov.Value);
        QVoltaMovCaixa.ExecSQL;
        QContasPagar_Cab.Close;
        QContasPagar_Cab.SetVariable('PK',QContasPagarBaixaCod_Conta_Pagar_Cab.Value);
        QContasPagar_Cab.Open;
        QContasPagar_Cab.Edit;
        if (QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value='PGTO. PRINCIPAL') Or
           (QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value='TAXA CHEQUE') then
           begin
             wMoeda:=DMOracle.BuscaNome('SELECT COD_MOEDA FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(QContasPagarBaixaCod_FINALIDADE.Value));
             QContasPagar_CabVal_Titulo.Value:=QContasPagar_CabVal_Titulo.Value+QContasPagarBaixaMovVal_Movimento.Value;
             // Variação cambial
             if (StrToFloat(wMoeda)<>DMParamSistema.QParamSistemaCOD_Moeda.Value) And
                (QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value='PGTO. PRINCIPAL') then
                QContasPagar_CabVal_indexado.Value:=QContasPagar_CabVal_Indexado.Value+(QContasPagarBaixaMovVal_Movimento.Value/DMMoeda.MaiorCotacao(StrToFloat(wMoeda),QContasPagarBaixaMovDt_Movimento.Value));
           end;
        QContasPagarBaixaMov.Delete;

       // Muda a Situção do Título
        If QContasPagar_CabVal_Titulo.Value=QContasPagar_CabVal_Original.Value then
          Begin
            QContasPagar_CabDT_Baixa.Clear;
            QContasPagar_CabInd_Situacao.Value:='ABERTO';
            If DMOracle.BuscaNome('SELECT IND_ENCARGO FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(QContasPagar_CabCod_Finalidade.Value)) = 'VENCIMENTO' Then
               QContasPagar_CabDt_Capitalizacao.value:=QContasPagar_CabDt_Vencimento.Value //Data de Capitalizacao é a Data de Vencimento
            Else
               QContasPagar_CabDt_Capitalizacao.value:=QContasPagar_CabDt_Emissao.Value; //Data de Capitalizacao é a Data de Emissão
          End
        Else
          If ((QContasPagar_CabVal_Titulo.Value<QContasPagar_CabVal_Original.Value)) and (QContasPagar_CabVal_Titulo.Value<>0) then
             QContasPagar_CabInd_Situacao.Value:='BAIXA PARCIAL';

        QContasPagar_Cab.post;
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
        try
          if PosQuery <= QContasPagarBaixa.RecordCount then
            QContasPagarBaixa.RecNo := PosQuery;
        except
        end;
        raise Exception.Create('Não foi possível voltar este lançamento');
      end;
      QContasPagarBaixaMov.Close;
      QContasPagarBaixa.Close;
      QContasPagarBaixa.Open;
      QContasPagarBaixaMov.Open;
      MeNumero.Clear;
      try
        if PosQuery <= QContasPagarBaixa.RecordCount then
          QContasPagarBaixa.RecNo := PosQuery;
        except
      end;
//      ShowMessage('Lançamento Excluído.');
    end
    Else
      ShowMessage('Não é possível Voltar o Movimento Principal.');
  end;
end;

procedure TFContaPagarVoltaBaixa.FormActivate(Sender: TObject);
begin
   DMContasPagar.QContasPagarBaixaMov.Close;
   DMContasPagar.QContasPagarBaixa.Close;
end;

procedure TFContaPagarVoltaBaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    With DmContasPagar Do
     Begin
       QContasPagarBaixaMov.Close;
       QContasPagarBaixa.Close;
     End;
end;

end.

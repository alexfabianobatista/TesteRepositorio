unit UThreadNotaSincronismo;

interface

uses
  Classes, Dialogs, SysUtils, OraTeste, Forms, Controls;

type
  ThreadNotaSincronismo = class(TThread)
  private
    { Private declarations }
    wForm: TForm;
    
  protected
    procedure Execute; override;
    procedure Sincroniza;
    procedure AbreQuery(query: TOracleDataSet1);

  public
    property pForm: TForm read wForm write wForm;
  end;

implementation

uses UNotaSaida_cl, UPedido_cl, UNotaSaidaAutomatica_cl, UOracle_cl, StdCtrls;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure UThreadNotaSincronismo.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ UThreadNotaSincronismo }

procedure ThreadNotaSincronismo.AbreQuery(query: TOracleDataSet1);
var cont: integer;
begin
  try
    query.open;
  except
    for cont := 0 to pForm.ComponentCount -1 do
    begin
      if pForm.Components[cont].Name = 'PnRodando' then
      begin
        TControl(pForm.Components[cont]).Visible := false;
      end;
      if pForm.Components[cont].Name = 'PnParado' then
      begin
        TControl(pForm.Components[cont]).Visible := true;
      end;
      if pForm.Components[cont].Name = 'lbMensagem' then
      begin
        TLabel(pForm.Components[cont]).Caption := 'Sem conexão com o servidor';
      end;
    end;
    pForm.Refresh;
    //Suspend;             
  end;
end;

procedure ThreadNotaSincronismo.Execute;
begin
  { Place thread code here }

//  while true do
//  begin
    Synchronize(Sincroniza);
//    sleep(5000);
//  end;

end;

procedure ThreadNotaSincronismo.Sincroniza;
var
  wCodEstado, wCodSerieModelo, wCodSerie: string;
  exec: TExecutador;
begin
  with DMNotaSaida, DMNotaSaidaAutomatica do
  begin

    QPedidoSincronismo.Close;
    QPedidoSincronismo.SetVariable('DT_EMISSAO', DMOracle.DataServ);
    AbreQuery(QPedidoSincronismo);

    QNotaSaida.Close;
    AbreQuery(QNotaSaida);
    QItemNF.Close;
    AbreQuery(QItemNF);
    DMNotaSaidaAutomatica.QAtuBaixaPed.Close;
    AbreQuery(DMNotaSaidaAutomatica.QAtuBaixaPed);

    try

      if QPedidoSincronismo.Eof then
        exit;

      wCodEstado := DMOracle.FastSelect('COD_ESTADO', 'TB_CADASTRO',
        'COD_CADASTRO = ' + QPedidoSincronismoCOD_CADASTRO.Text);
      wCodSerieModelo := DMOracle.FastSelect('COD_SERIE_MODELO', 'TB_OPERACAO',
        'COD_OPERACAO = ' + QPedidoSincronismoCOD_OPERACAO.Text);
      wCodSerie := DMOracle.FastSelect('COD_SERIE', 'TB_OPERACAO',
        'COD_OPERACAO = ' + QPedidoSincronismoCOD_OPERACAO.Text);

      if wCodSerieModelo <> '55' then
      begin
        exec := TExecutador.Create;
        exec.Adiciona('UPDATE TB_PEDIDO_CAB SET STEP_SINCRONIZACAO = '
          + quotedStr('NAO_SINCRONIZAR') + ' WHERE COD_PEDIDO_CAB = '
          + QPedidoSincronismoCOD_PEDIDO_CAB.Text);
        exec.Executar(true,true);
        exit;
      end;

      QNotaSaida.Insert;
      QNotaSaidaCOD_USUARIO.Value :=  QPedidoSincronismoCOD_USUARIO.Value;
      QNotaSaidaCOD_FILIAL.Value := QPedidoSincronismoCOD_FILIAL.Value;
      QNotaSaidaCOD_MENSAGEM.Value := QPedidoSincronismoCOD_MENSAGEM.Value;
      QNotaSaidaCOD_OPERACAO.Value := QPedidoSincronismoCOD_OPERACAO.Value;
      QNotaSaidaCOD_ESTADO.Text := wCodEstado;
      QNotaSaidaCOD_VENDEDOR.Value := QPedidoSincronismoCOD_VENDEDOR.Value;
      QNotaSaidaCOD_CADASTRO.Value := QPedidoSincronismoCOD_CADASTRO.Value;
      QNotaSaidaNUM_NOTA.Value := 0; // Pega sequencia ao confirmar a nota
      QNotaSaidaCOD_SERIE.Value := wCodSerie;
      QNotaSaidaIND_SITUACAO.Value := '1';
      
      if QPedidoSincronismoIND_TIPO_PAGAMENTO.Value = 'A VISTA' then
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '1'
      else if QPedidoSincronismoIND_TIPO_PAGAMENTO.Value = 'A PRAZO' then
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '2'
      else
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '3';

      QNotaSaidaDT_EMISSAO.Value := QPedidoSincronismoDT_EMISSAO.Value;
      QNotaSaidaDT_MOVIMENTO.Value := QPedidoSincronismoDT_EMISSAO.Value;
      QNotaSaidaDT_RECEBIMENTO.Value := QPedidoSincronismoDT_EMISSAO.Value;
      QNotaSaidaIND_ENTRADA_SAIDA.Value := 'S';
      QNotaSaidaVAL_DESCONTO.Value := QPedidoSincronismoVAL_DESCONTO.Value;
      QNotaSaidaCOD_TRANSPORTADOR.Text := QPedidoSincronismoCOD_CADASTRO_TRANSPORTADORA.Text;
      QNotaSaidaIND_TIPO_FRETE.Value := QPedidoSincronismoIND_TIPO_FRETE.Value;
      QNotaSaidaDESC_OBS_CORPO_NOTA.Value := QPedidoSincronismoDESC_OBSERVACAO.Value;
      QNotaSaidaOBS.Value := QPedidoSincronismoDESC_COMPLEMENTO_OBS.Value;
      QNotaSaidaOBS_COMPLEMENTO.Value := QPedidoSincronismoDESC_COMPLEMENTO_OBS2.Value;
      QNotaSaidaDT_USUARIO.Value := QPedidoSincronismoDT_USUARIO.Value;
      QNotaSaidaPERC_COMISSAO.Value := QPedidoSincronismoPERC_COMISSAO.Value;
      QNotaSaidaNUM_PEDIDO.Value := QPedidoSincronismoNUM_PEDIDO.Value;
      QNotaSaidaCOD_PRAZO_VENCIMENTO.Value := QPedidoSincronismoCOD_PRAZO_VENCIMENTO.Value;
      QNotaSaidaIND_TIPO_CONHECIMENTO.Value := QPedidoSincronismoIND_TIPO_FRETE.Value;
      QNotaSaidaCOD_SERIE_MODELO.Value := wCodSerieModelo;
      QNotaSaidaIND_CONSUMIDOR_FINAL.Value := QPedidoSincronismoIND_CONSUMIDOR_FINAL.Value;
      QNotaSaidaIND_TIPO_PAGAMENTO.Value := QPedidoSincronismoIND_TIPO_PAGAMENTO.Value;
      qnotasaida.Post;

      QPedidoItemSincronismo.Close;
      QPedidoItemSincronismo.SetVariable('COD_PEDIDO_CAB', QPedidoSincronismoCOD_PEDIDO_CAB.Value);
      AbreQuery(QPedidoItemSincronismo);

      QNotaSaida.Edit;

      while not QPedidoItemSincronismo.Eof do
      begin
        QItemNF.Append;
        QItemNFCOD_NOTA_CAB.Value := QNotaSaidaCOD_NOTA_CAB.Value;
        QItemNFCOD_TRIBUTACAO.Value := QPedidoItemSincronismoCOD_TRIBUTACAO.Value;
        QItemNFQT_QUANTIDADE.Value := QPedidoItemSincronismoQT_PEDIDO.Value;
        QItemNFVAL_TOTAL.Value :=
          QPedidoItemSincronismoVAL_UNITARIO.Value * QPedidoItemSincronismoQT_PEDIDO.Value;
        QItemNFPERC_COMISSAO.Value := QPedidoItemSincronismoPERC_COMISSAO.Value;
        QItemNFCOD_PRODUTO.Value := QPedidoItemSincronismoCOD_PRODUTO.Value;
        QItemNFCOD_LOTE_TIPO.Value := QPedidoItemSincronismoCOD_LOTE_TIPO.Value;
        QItemNFVAL_DESCONTO.Value := QPedidoItemSincronismoVAL_DESCONTO.Value;
        QItemNFPERC_DESCONTO.Value := QPedidoItemSincronismoPERC_DESCONTO.Value;
        QItemNFVAL_IPI.Value := QPedidoItemSincronismoVAL_IPI.Value;
        QItemNFVAL_UNITARIO.Value := QPedidoItemSincronismoVAL_UNITARIO.Value;
        QItemNFVAL_ICMS_SUBST.Value := QPedidoItemSincronismoVAL_ICMS_SUBST.Value;
        QItemNFNUM_FABRICANTE.Value := QPedidoItemSincronismoNUM_FABRICANTE.Value;
        QItemNFCOD_CFOP.Text := QPedidoItemSincronismoCOD_CFOP.Text;
        QItemNFCOD_TABELA_PRECO_CAB.Text := QPedidoItemSincronismoCOD_TABELA_PRECO_CAB.Text;
        QItemNF.Post;

        // Adiciona registro na tabela associativa TB_BAIXA_PEDIDO
        DMNotaSaidaAutomatica.QAtuBaixaPed.Insert;
        DMNotaSaidaAutomatica.QAtuBaixaPedCOD_NOTA_ITEM.Value := QItemNFCOD_NOTA_ITEM.Value;
        DMNotaSaidaAutomatica.QAtuBaixaPedCOD_PEDIDO_ITEM.Value := QPedidoItemSincronismoCOD_PEDIDO_ITEM.Value;
        DMNotaSaidaAutomatica.QAtuBaixaPedQT_BAIXA.Value := QPedidoItemSincronismoQT_PEDIDO.Value;
        DMNotaSaidaAutomatica.QAtuBaixaPed.Post;

        QPedidoItemSincronismo.Next;
      end;

      QNotaSaida.Post;

      // Deve atualizar o status do pedido para que não seja sincronizado novamente
      exec := TExecutador.Create;
      exec.Adiciona('UPDATE TB_PEDIDO_CAB SET STEP_SINCRONIZACAO = '
        + quotedStr('SINCRONIZADO') + ' WHERE COD_PEDIDO_CAB = '
        + QPedidoSincronismoCOD_PEDIDO_CAB.Text);
      exec.Executar(true,true);
    Except
      on e: exception do
      begin
        //MessageDlg('Erro: ' + e.message, mtError, [mbOk], 0);
      end;
    end;
    
  end;
end;

end.

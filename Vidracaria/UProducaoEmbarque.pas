unit UProducaoEmbarque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Mask, UFmCadastro,DB, DBCtrls;

type
  TFProducaoEmbarque = class(TForm)
    DBGrid8: TDBGrid;
    FmCadastro1: TFmCadastro;
    EdEmbarque: TEdit;
    Label1: TLabel;
    MEEmbarque: TMaskEdit;
    SBEmbarque: TSpeedButton;
    EdCodBarra: TEdit;
    Label2: TLabel;
    SBVisualizar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBVoltaPeca: TSpeedButton;
    SBVoltaPedido: TSpeedButton;
    SBAbertoNaoForno: TSpeedButton;
    SBFaturadoNaoEmbarcado: TSpeedButton;
    SBPedidoAberto: TSpeedButton;
    SBMostraEmbarque: TSpeedButton;
    procedure SBEmbarqueClick(Sender: TObject);
    procedure FmCadastro1BtCadastroClick(Sender: TObject);
    procedure MEEmbarqueExit(Sender: TObject);
    procedure FmCadastro1MeCadastroExit(Sender: TObject);
    procedure EdCodBarraChange(Sender: TObject);
    procedure DBGrid8DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FmCadastro1MeCadastroChange(Sender: TObject);
    procedure SBVisualizarClick(Sender: TObject);
    procedure DBGrid8CellClick(Column: TColumn);
    procedure DBGrid8ColEnter(Sender: TObject);
    procedure DBGrid8DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid8EndDock(Sender, Target: TObject; X, Y: Integer);
    procedure DBGrid8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBVoltaPecaClick(Sender: TObject);
    procedure SBVoltaPedidoClick(Sender: TObject);
    procedure SBPedidoAbertoClick(Sender: TObject);
    procedure SBFaturadoNaoEmbarcadoClick(Sender: TObject);
    procedure SBAbertoNaoFornoClick(Sender: TObject);
    procedure SBMostraEmbarqueClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FProducaoEmbarque: TFProducaoEmbarque;
  wRecNo: Integer;

implementation

uses UOracle_cl, UPedido_cl, UEmbarque_cl, UEmbarqueCons, UMostraImagem,
  UParamSistema_cl, UVidracaria_cl, UProducaoReposicao, UTProducao,
  URPecaNaoEmbarcada, UPedidoParam, UUsuario_cl, URPedido_Aberto,
  URPedFaturadoNaoEmbarcado, URPedidoAberto;

{$R *.dfm}

procedure TFProducaoEmbarque.SBEmbarqueClick(Sender: TObject);
begin
  if FEmbarqueCons = nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  if FEmbarqueCons.ShowModal = mrOk then
    MeEmbarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    MEEmbarqueExit(Self);
end;

procedure TFProducaoEmbarque.FmCadastro1BtCadastroClick(Sender: TObject);
begin
  FmCadastro1.BtCadastroClick(Sender);
end;

procedure TFProducaoEmbarque.MEEmbarqueExit(Sender: TObject);
Var
wEmbarqueCompleto, wFaturado : string;
begin
   If Trim(MEEmbarque.Text) <> '' Then
    EdEmbarque.Text := DMOracle.BuscaNome('SELECT NOME_MOTORISTA FROM TB_EMBARQUE','COD_EMBARQUE = '+Trim(MEembarque.Text))
  Else
    Raise Exception.Create('Informe o Embarque!');
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') Then
  Begin
    DMEmbarque.QREmbarquePedido.Close;
    DMEmbarque.QREmbarquePedido.SetVariable('EMBARQUE',Trim(MEEmbarque.Text));
    DMEmbarque.QREmbarquePedido.SetVariable('COD_CADASTRO',NULL);
    DMEmbarque.QREmbarquePedido.Open;
    DMEmbarque.QREmbarquePedido.First;

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERFOZ' then  
    while not DMEmbarque.QREmbarquePedido.Eof do
    Begin
      wFaturado := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB','NUM_PEDIDO= '+DMEmbarque.QREmbarquePedidoCOD_PEDIDO_CAB.Text);
      if wFaturado = '' then
        Raise Exception.Create('Pedidos Não Faturados Não Podem Ser Embarcados!');
      DMEmbarque.QREmbarquePedido.Next;
    end;
  end;

  DMEmbarque.QAcompanhaEmbarque.Close;
  DMEmbarque.QAcompanhaEmbarque.SetVariable('COD_EMBARQUE',Trim(MEEmbarque.Text));
  if Trim(FmCadastro1.MeCadastro.Text) <> '' then
    DMEmbarque.QAcompanhaEmbarque.SetVariable('COD_CADASTRO',Trim(FmCadastro1.MeCadastro.Text))
  else
    DMEmbarque.QAcompanhaEmbarque.SetVariable('COD_CADASTRO',NULL);
  DMEmbarque.QAcompanhaEmbarque.Open;
  wEmbarqueCompleto := DMOracle.BuscaNome('SELECT TB_ACOMPANHAMENTO_PEDIDO.COD_ACOMPANHAMENTO_PEDIDO FROM TB_PEDIDO_CAB,TB_EMBARQUE_ITEM,TB_ACOMPANHAMENTO_PEDIDO ',
                                            'TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_EMBARQUE_ITEM.COD_PEDIDO_CAB AND TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_ACOMPANHAMENTO_PEDIDO.COD_PEDIDO_CAB AND TB_ACOMPANHAMENTO_PEDIDO.IND_EMBARQUE = ''N'' AND TB_EMBARQUE_ITEM.COD_EMBARQUE ='+Trim(MEEmbarque.Text));
  if wEmbarqueCompleto = '' then
    ShowMessage('EMBARQUE COMPLETO!');
end;

procedure TFProducaoEmbarque.FmCadastro1MeCadastroExit(Sender: TObject);
begin
  MEEmbarqueExit(Self);
end;

procedure TFProducaoEmbarque.EdCodBarraChange(Sender: TObject);
var
wPedidoItem, wPedido, wSerie, wPeca, wEmbarque, wEmbarqueCompleto, wEmbarcado: String;
begin
  if Length(EdCodBarra.Text) = 12 then
  Begin  
    wSerie := copy(EdCodBarra.Text,11,1);
    wPeca := IntToStr(StrToInt(copy(EdCodBarra.Text,1,6)));
    wPedidoItem := DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_MATERIAL','COD_PECA='+chr(39)+wPeca+chr(39)+' AND NUM_SERIE='+wSerie);
    if DMOracle.BuscaNome('SELECT IND_EMBARQUE FROM TB_ACOMPANHAMENTO_PEDIDO','COD_PEDIDO_ITEM='+wPedidoItem) = 'S' then
    Begin
      EdCodBarra.Text := '';
      Raise Exception.Create('Peça já Embarcada!');
    end;
   // if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' Then
   // Begin
      wPedido := DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_ITEM','COD_PEDIDO_ITEM= '+wPedidoItem);
      if wPedido <> '' then
        wEmbarque := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM','COD_PEDIDO_CAB =' + wPedido);
      if wEmbarque = Trim(MEEmbarque.Text) then
      Begin
        DMEmbarque.QAcompanhaEmbarque.First;
        while wPedidoItem <> DMEmbarque.QAcompanhaEmbarqueCOD_PEDIDO_ITEM.Text do
          DMEmbarque.QAcompanhaEmbarque.Next;
        wRecNo := DMEmbarque.QAcompanhaEmbarque.RecNo;
   // end;
      DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_EMBARQUE = ''S'' , DT_EMBARQUE = CAST(' + QuotedStr(FormatDateTime('dd/MM/yyyy hh:mm:ss', DMOracle.DataHoraServ)) + ' AS TIMESTAMP) WHERE COD_PEDIDO_ITEM=' + wPedidoItem);
      //DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_EMBARQUE = ''S'' WHERE COD_PEDIDO_ITEM = '+wPedidoItem);

      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') Then
      Begin
        wEmbarqueCompleto := DMOracle.BuscaNome('SELECT TB_ACOMPANHAMENTO_PEDIDO.COD_ACOMPANHAMENTO_PEDIDO FROM TB_PEDIDO_CAB,TB_EMBARQUE_ITEM,TB_ACOMPANHAMENTO_PEDIDO ',
                                            'TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_EMBARQUE_ITEM.COD_PEDIDO_CAB AND TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_ACOMPANHAMENTO_PEDIDO.COD_PEDIDO_CAB AND TB_ACOMPANHAMENTO_PEDIDO.IND_EMBARQUE = ''N'' AND TB_EMBARQUE_ITEM.COD_EMBARQUE ='+Trim(MEEmbarque.Text));
        if wEmbarqueCompleto = '' then
          ShowMessage('EMBARQUE COMPLETO!');
      end;

      DMEmbarque.QAcompanhaEmbarque.Close;
      DMEmbarque.QAcompanhaEmbarque.SetVariable('COD_EMBARQUE',Trim(MEEmbarque.Text));
      if Trim(FmCadastro1.MeCadastro.Text) <> '' then
        DMEmbarque.QAcompanhaEmbarque.SetVariable('COD_CADASTRO',Trim(FmCadastro1.MeCadastro.Text))
      else
        DMEmbarque.QAcompanhaEmbarque.SetVariable('COD_CADASTRO',NULL);
      DMEmbarque.QAcompanhaEmbarque.Open;
      EdCodBarra.Text := '';
      EdCodBarra.SetFocus;
      DMEmbarque.QAcompanhaEmbarque.RecNo := wRecNo;
    end
    else
    Begin
      EdCodBarra.Text := '';
      MessageDlg('Peça Não Pertence a esse Embarque!', mtError, [mbOK], 0);
      MessageDlg('Peça Não Pertence a esse Embarque!', mtError, [mbOK], 0);
      EdCodBarra.SetFocus;
    end;
  end;
end;

procedure TFProducaoEmbarque.DBGrid8DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if DMEmbarque.QAcompanhaEmbarque.RecNo = wRecNo then
  Begin
    If Column.FieldName = 'NOME_CADASTRO' Then
      DBGrid8.Canvas.Brush.Color := clRed;
    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if Column.FieldName = 'DESC_QUEBRAS' then
  begin
    if DmEmbarque.QAcompanhaEmbarqueIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Font.Color := clRed;
//      ImageList1.Draw(DBGrid8.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_EMBARQUE') then
  begin
    if dmembarque.QAcompanhaembarqueIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else
      if dmembarque.QAcompanhaembarqueIND_EMBARQUE.Value = 'N' then
        DBGrid8.Canvas.Brush.Color := clYellow
      else
        DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_FORNO') then
  begin
    if dmembarque.QAcompanhaembarqueIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else
      if dmembarque.QAcompanhaembarqueIND_FORNO.Value = 'N' then
        DBGrid8.Canvas.Brush.Color := clYellow
      else
        DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_CALCULO') then
  begin
    if dmembarque.QAcompanhaembarqueIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else
      if dmembarque.QAcompanhaembarqueIND_CALCULO.Value = 'N' then
        DBGrid8.Canvas.Brush.Color := clYellow
      else
        DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_CORTE') then
  begin
    if dmembarque.QAcompanhaembarqueIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else
      if dmembarque.QAcompanhaembarqueIND_CORTE.Value = 'N' then
        DBGrid8.Canvas.Brush.Color := clYellow
      else
        DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_USINAGEM') then
  begin
    if dmembarque.QAcompanhaembarqueIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else
      if dmembarque.QAcompanhaembarqueIND_USINAGEM.Value = 'N' then
        DBGrid8.Canvas.Brush.Color := clYellow
      else
        DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_MARCACAO') then
  begin
    if dmembarque.QAcompanhaembarqueIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else
      if dmembarque.QAcompanhaembarqueIND_MARCACAO.Value = 'N' then
        DBGrid8.Canvas.Brush.Color := clYellow
      else
        DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFProducaoEmbarque.FmCadastro1MeCadastroChange(Sender: TObject);
begin
  If Trim(FmCadastro1.MeCadastro.Text) <> '' then
    MEEmbarqueExit(Self);
end;

procedure TFProducaoEmbarque.SBVisualizarClick(Sender: TObject);
begin
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;
end;

procedure TFProducaoEmbarque.DBGrid8CellClick(Column: TColumn);
begin
  EdCodBarra.SetFocus;
end;

procedure TFProducaoEmbarque.DBGrid8ColEnter(Sender: TObject);
begin
  EdCodBarra.SetFocus;
end;

procedure TFProducaoEmbarque.DBGrid8DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
EdCodBarra.SetFocus;
end;

procedure TFProducaoEmbarque.DBGrid8EndDock(Sender, Target: TObject; X,
  Y: Integer);
begin
EdCodBarra.SetFocus;
end;

procedure TFProducaoEmbarque.DBGrid8MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
EdCodBarra.SetFocus;
end;

procedure TFProducaoEmbarque.SpeedButton1Click(Sender: TObject);
begin
  if Trim(MEEmbarque.Text) = '' then
    Raise Exception.Create('Informe o Embarque');
  DMEmbarque.QAcompanhaEmbarque.Close;
  DMEmbarque.QAcompanhaEmbarque.SetVariable('COD_EMBARQUE',Trim(MEEmbarque.Text));
  DMEmbarque.QAcompanhaEmbarque.Open;
  if FRPecaNaoEmbarcada = nil then
    FRPecaNaoEmbarcada := TFRPecaNaoEmbarcada.Create(Application);
    FRPecaNaoEmbarcada.qrltitulo.Caption := 'Embarque: '+ DMEmbarque.QEmbarqueCOD_EMBARQUE.Text;
  FRPecaNaoEmbarcada.QRPrimario.Preview;
end;

procedure TFProducaoEmbarque.FormCreate(Sender: TObject);
begin
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') then
  Begin
    SBVoltaPeca.Enabled := True;
    SBVoltaPeca.Visible := True;
    SBVoltaPedido.Enabled := True;
    SBVoltaPedido.Visible := True;
    SBPedidoAberto.Enabled := True;
    SBPedidoAberto.Visible := True;
    SBMostraEmbarque.Enabled := True;
    SBMostraEmbarque.Visible := True;
    SBFaturadoNaoEmbarcado.Enabled := True;
    SBFaturadoNaoEmbarcado.Visible := True;
    SBAbertoNaoForno.Enabled := True;
    SBAbertoNaoForno.Visible := True;
  end;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') then
  Begin
    SBVoltaPeca.Enabled := True;
    SBVoltaPeca.Visible := True;
    SBVoltaPedido.Enabled := True;
    SBVoltaPedido.Visible := True;
    SBMostraEmbarque.Enabled := True;
    SBMostraEmbarque.Visible := True;
    SBFaturadoNaoEmbarcado.Enabled := True;
    SBFaturadoNaoEmbarcado.Visible := True;
    SBAbertoNaoForno.Enabled := True;
    SBAbertoNaoForno.Visible := True;
  end;
end;

procedure TFProducaoEmbarque.SBVoltaPecaClick(Sender: TObject);
var
wPeca, wPedidoItem : string;
begin
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') then
  Begin
    wPeca := InputBox('Peça', 'Digite o número da peça: ', '');
    if wPeca <> '' then
    Begin
      wPedidoitem := DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_MATERIAL', 'COD_PECA = ' +wPeca);
      DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_EMBARQUE = ''N'' WHERE COD_PEDIDO_ITEM =' + wPedidoItem);
    end;
  end;
end;

procedure TFProducaoEmbarque.SBVoltaPedidoClick(Sender: TObject);
var
wPedido : String;
begin
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') then
  Begin
    wPedido := InputBox('Peça', 'Digite o número do pedido: ', '');
    if wPedido <> '' then
      DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_EMBARQUE = ''N'' WHERE COD_PEDIDO_CAB =' + wPedido);
  end;
end;

procedure TFProducaoEmbarque.SBPedidoAbertoClick(Sender: TObject);
begin
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME0Filial.Text), 'VENDA');
      QRPedAberto.Close;
      QRPedAberto.SetVariable('DATA_I', FPedidoParam.ME0DataI.Text);
      QRPedAberto.SetVariable('DATA_F', FPedidoParam.ME0DataF.Text);
      if Trim(FPedidoParam.ME0DtEntregaI.Text) <> '' then
        QRPedAberto.SetVariable('DT_ENTREGA_I', FPedidoParam.ME0DtEntregaI.Text)
      else
        QRPedAberto.SetVariable('DT_ENTREGA_I', NULL);

      if Trim(FPedidoParam.ME0DtEntregaF.Text) <> '' then
        QRPedAberto.SetVariable('DT_ENTREGA_F', FPedidoParam.ME0DtentregaF.Text)
      else
        QRPedAberto.SetVariable('DT_ENTREGA_F', NULL);
        
      if Trim(FPedidoParam.ME0Filial.Text) = '' then
        QRPedAberto.SetVariable('FILIAL', Null)
      else
        QRPedAberto.SetVariable('FILIAL', FPedidoParam.ME0Filial.Text);
      if Trim(FPedidoParam.ME0Cadastro.Text) = '' then
        QRPedAberto.SetVariable('CADASTRO', Null)
      else
        QRPedAberto.SetVariable('CADASTRO', FPedidoParam.ME0Cadastro.Text);
      
      if Trim(FPedidoParam.ME0Produto.Text) = '' then
        QRPedAberto.SetVariable('PRODUTO', Null)
      else
        QRPedAberto.SetVariable('PRODUTO', FPedidoParam.ME0Produto.Text);
      if Trim(FPedidoParam.ME0Vendedor.Text) = '' then
        QRPedAberto.SetVariable('VENDEDOR', Null)
      else
        QRPedAberto.SetVariable('VENDEDOR', FPedidoParam.ME0Vendedor.Text);

      if Trim(FPedidoParam.ME0Classe.Text) = '' then
        QRPedAberto.SetVariable('CLASSE', Null)
      else
        QRPedAberto.SetVariable('CLASSE', FPedidoParam.ME0Classe.Text);
      if (Trim(FPedidoParam.ME0SubClasse.Text) = '') or (Trim(FPedidoParam.ME0SubClasse.Text) = '0') then
        QRPedAberto.SetVariable('SUB_CLASSE', Null)
      else
        QRPedAberto.SetVariable('SUB_CLASSE', FPedidoParam.ME0SubClasse.Text);

      if Trim(FPedidoParam.ME0Operacao1.Text) <> '' then
        QRPedAberto.SetVariable('COD_OPERACAO1', Trim(FPedidoParam.ME0Operacao1.Text))
      Else
        QRPedAberto.SetVariable('COD_OPERACAO1', NULL);
      if Trim(FPedidoParam.ME0Regiao.Text) <> '' then
        QRPedAberto.SetVariable('REGIAO', Trim(FPedidoParam.ME0Regiao.Text))
      Else
        QRPedAberto.SetVariable('REGIAO', NULL);
      case FPedidoParam.Rg0TipoPagto.ItemIndex of
        0: QRPedAberto.SetVariable('TIPO_PAGTO', Null);
        1: QRPedAberto.SetVariable('TIPO_PAGTO', 'A VISTA');
        2: QRPedAberto.SetVariable('TIPO_PAGTO', 'A PRAZO');
        3: QRPedAberto.SetVariable('TIPO_PAGTO', 'OUTROS');
      end; // Case  

      QRPedAberto.SQL[QRPedAberto.SQL.count - 1] := '';
      case FPedidoParam.CB0Ordem.ItemIndex of
        0: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PEDIDO_ITEM.COD_PRODUTO');
        1: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_CAB.DT_ENTREGA, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PEDIDO_ITEM.COD_PRODUTO');
        2: QRPedAberto.SQL.Add('ORDER BY TB_CADASTRO.NOME, TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB');
        3: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_ITEM.COD_PRODUTO, TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB');
      else
        raise Exception.Create('Nenhuma ordem selecionada!');
      end; // Case

      QRPedAberto.Open;
      if FRPedido_Aberto = nil then
        FRPedido_Aberto := TFRPedido_Aberto.Create(Application);
      FRpedido_Aberto.QRLTitulo.Caption := 'Pedido em Aberto (' + FPedidoParam.ME0DataI.text + ' - ' + FPedidoParam.ME0DataF.Text + ')';  

      case FPedidoParam.Rg0TipoPagto.ItemIndex of
        0: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Todos';
        1: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Vista';
        2: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Prazo';
        3: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Outros';
      end;  

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Aberto.QRPrimario.Preview
      else
        FRPedido_Aberto.QRPrimario.Print;
      QRPedAberto.Close;
    end;  
end;

procedure TFProducaoEmbarque.SBFaturadoNaoEmbarcadoClick(Sender: TObject);
begin
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[16].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
  with DMPedido do
  Begin
    QRPedFaturadoNaoEmbarcado.Close;
    if Trim(FPedidoParam.FmCadastro16.MeCadastro.Text) = '' then
      QRPedFaturadoNaoEmbarcado.SetVariable('CADASTRO', Null)
    else
      QRPedFaturadoNaoEmbarcado.SetVariable('CADASTRO', Trim(FPedidoParam.FmCadastro16.MeCadastro.Text));
    if Trim(FPedidoParam.FmRegiao16.MeRegiao.Text) = '' then
      QRPedFaturadoNaoEmbarcado.SetVariable('REGIAO', Null)
    else
      QRPedFaturadoNaoEmbarcado.SetVariable('REGIAO', Trim(FPedidoParam.FmRegiao16.MeRegiao.Text));
    QRPedFaturadoNaoEmbarcado.Open;
  end;
  if FRPedFaturadoNaoEmbarcado = nil then
    FRPedFaturadoNaoEmbarcado := TFRPedFaturadoNaoEmbarcado.Create(Application);

    FRPedFaturadoNaoEmbarcado.QRLParam.Caption := 'Região.:'+FPedidoParam.FMRegiao16.EdRegiao.Text + '  Cliente.:'+FPedidoParam.FMCadastro16.edCadastro.Text;
  FRPedFaturadoNaoEmbarcado.QRPrimario.Preview;
  DMPedido.QRPedFaturadoNaoEmbarcado.Close;

end;

procedure TFProducaoEmbarque.SBAbertoNaoFornoClick(Sender: TObject);
begin
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[15].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
  with DMPedido do
  begin
    QRPedidoAberto.Close;
    if Trim(FPedidoParam.FmCadastro15.MeCadastro.Text) = '' then
      QRPedidoAberto.SetVariable('COD_CADASTRO', Null)
    else
      QRPedidoAberto.SetVariable('COD_CADASTRO', Trim(FPedidoParam.FmCadastro15.MeCadastro.Text));
    if Trim(FPedidoParam.FmRegiao15.MeRegiao.Text) = '' then
      QRPedidoAberto.SetVariable('COD_REGIAO', Null)
    else
      QRPedidoAberto.SetVariable('COD_REGIAO', Trim(FPedidoParam.FmRegiao15.MeRegiao.Text));
    if (FPedidoParam.FmDatas15.MeDtInicial.Text = '') or (FPedidoParam.FmDatas15.MeDtFinal.Text = '') then
      raise Exception.create('É Preciso informar a data');
    QRPedidoAberto.SetVariable('DT_ENTREGA_I', trim(FPedidoParam.FmDatas15.MeDtInicial.Text));
    QRPedidoAberto.SetVariable('DT_ENTREGA_F', trim(FPedidoParam.FmDatas15.MeDtFinal.Text));
    QRPedidoAberto.Open;

    if FrPedidoAberto = nil then
      FrPedidoAberto := TFrPedidoAberto.Create(Application);
    FrPedidoAberto.QRLTitulo.Caption := 'Pedidos Abertos';
    if FPedidoParam.RGPreview.ItemIndex = 0 then
      FrPedidoAberto.QRPrimario.Preview
    else
      FrPedidoAberto.QRPrimario.Print;
    QRPedidoAberto.Close;
  end;
end;

procedure TFProducaoEmbarque.SBMostraEmbarqueClick(Sender: TObject);
var
wPedido,wEmbarque : string;
begin
  wEmbarque := '';
  wPedido := InputBox('Peça', 'Digite o número do pedido: ', '');
  wEmbarque := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM ',' COD_PEDIDO_CAB='+wPedido);
  if wEmbarque <> '' then
    showMessage('Está no EMbarque '+wEmbarque)
  else
    ShowMessage('O Pedido não está em embarque!');  
end;

end.

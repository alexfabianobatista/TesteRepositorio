unit ULiberaPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, variants, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFLiberaPedido = class(TFTCadSimples)
    Label1: TLabel;
    SbVendedor: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    MeVendedor: TMaskEdit;
    MeDtInicial: TMaskEdit;
    MeDtFinal: TMaskEdit;
    BtProcura: TBitBtn;
    Opes1: TMenuItem;
    LiberarCadastro1: TMenuItem;
    ListView1: TListView;
    LiberarFinanceiro1: TMenuItem;
    LiberarComercial1: TMenuItem;
    PedidoscomProblemaComercial1: TMenuItem;
    PedidoscomProblemaFinanceiro1: TMenuItem;
    PedidoscomProblemaCadastro1: TMenuItem;
    procedure SbVendedorClick(Sender: TObject);
    procedure BtProcuraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LiberarCadastro1Click(Sender: TObject);
    procedure LiberarFinanceiro1Click(Sender: TObject);
    procedure LiberarComercial1Click(Sender: TObject);
    procedure PedidoscomProblemaComercial1Click(Sender: TObject);
    procedure PedidoscomProblemaFinanceiro1Click(Sender: TObject);
    procedure PedidoscomProblemaCadastro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiberaPedido: TFLiberaPedido;

implementation

uses UVendedorCons, UVendedor_cl, ULiberarPedido_cl,
   UOracle_cl, UUsuario_cl, UConfirmacaoLiberarComercial,
  ULiberaPedidoParam, URPedidosProblemaComercial,
  URPedidosProblemaFinanceiro, URPedidosProblemaCadastro,
  UVerbaRepresentante_cl, UOperacao_cl;

{$R *.DFM}

procedure TFLiberaPedido.SbVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil Then
     FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = MrOk Then
     MeVendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFLiberaPedido.FormCreate(Sender: TObject);
var
  lc : TListColumn;
  i : integer;
begin
  inherited;

  lc := ListView1.Columns.Add;
  lc.Caption := 'X';
  lc.Width := 20;

  //comeca pelo segundo (i:=1) pq o código do pedido vai ficar na coluna X definida acima
  for i:=1 to DMLiberarPedido.QPedidosPendentes.Fields.Count-1 do
  begin
    if DMLiberarPedido.QPedidosPendentes.FieldList[i].Visible then
    begin
      lc := ListView1.Columns.Add;
      lc.Caption := DMLiberarPedido.QPedidosPendentes.FieldList[i].DisplayLabel;// DBGrid1.Columns.Items[i].Title.Caption;
      lc.Width := DMLiberarPedido.QPedidosPendentes.Fields[i].DisplayWidth*5 + 5;
      lc.Alignment := DMLiberarPedido.QPedidosPendentes.Fields[i].Alignment;
    end;
  end;
end;

procedure TFLiberaPedido.BtProcuraClick(Sender: TObject);
var li : TListItem;
    i : integer;
begin
  inherited;
  With DMLiberarPedido Do
  Begin
    QPedidosPendentes.Close;
    QPedidosPendentes.SetVariable('DT_EMISSAO_INIC',MeDtInicial.Text);
    QPedidosPendentes.SetVariable('DT_EMISSAO_FIM',MeDtFinal.Text);
    If Trim(MeVendedor.Text) = '' Then
       QPedidosPendentes.SetVariable('COD_VENDEDOR',Null)
    Else
       QPedidosPendentes.SetVariable('COD_VENDEDOR',Trim(MeVendedor.Text));
    QPedidosPendentes.Open;

    ListView1.Items.Clear;
    while not DMLiberarPedido.QPedidosPendentes.Eof do
    begin
      li := ListView1.Items.Add;
      li.Caption := DMLiberarPedido.QPedidosPendentesCOD_PEDIDO_CAB.AsString;
      for i:=1 to DMLiberarPedido.QPedidosPendentes.FieldCount-1 do
        li.SubItems.add(DMLiberarPedido.QPedidosPendentes.Fields[i].AsString);
      DMLiberarPedido.QPedidosPendentes.next;
    end;
  End;
end;

procedure TFLiberaPedido.LiberarCadastro1Click(Sender: TObject);
var wAux : string;
i: integer;
begin
  inherited;
  if MessageDlg('Deseja realmente liberar o Cadastro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMOracle.DBCemapa.StartTransaction;
    try
      for i:=0 to ListView1.Items.Count-1 do
      begin
        if ListView1.Items.Item[i].Checked then
        begin
          wAux := DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_PEDIDO_CAB ', ' COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption);
          if (wAux = 'SIM') or (copy(waux, 3, 1) = '0') then
            raise Exception.create('Algum pedido já foi liberado ou não estava bloqueado pelo cadastro');
          wAux := copy(waux, 1, 2) + '0';//aqui é a parte que define que foi liberado
          DMOracle.QExecSQL.close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET IND_LIBERADO = ''' + wAux + ''', ' +
                                    'COD_USUARIO_LIB_CAD = ' + IntToStr(DMUSUARIO.CodUsuarioCorrente) +
                                    ' WHERE COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption);
          DMOracle.QExecSQL.ExecSQL;
        end;
      end;
      DMOracle.DBCemapa.Commit;
      MessageDlg('Pedidos liberados com sucesso', mtInformation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TFLiberaPedido.LiberarFinanceiro1Click(Sender: TObject);
var wAux : string;
i: integer;
begin
  inherited;
  if MessageDlg('Deseja realmente liberar o Financeiro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMOracle.DBCemapa.StartTransaction;
    try
      for i:=0 to ListView1.Items.Count-1 do
      begin
        if ListView1.Items.Item[i].Checked then
        begin
          wAux := DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_PEDIDO_CAB ', ' COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption);
          if (wAux = 'SIM') or (copy(waux, 1, 1) = '0') then
            raise Exception.create('Algum pedido já foi liberado ou não estava bloqueado pelo financeiro');
          wAux := '0' + copy(waux, 2, 2); //aqui é a parte que define que foi liberado
          DMOracle.QExecSQL.close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET IND_LIBERADO = ''' + wAux + ''', ' +
                                    ' COD_USUARIO_LIB_FIN = ' + IntToStr(DMUSUARIO.CodUsuarioCorrente) +
                                    ' WHERE COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption);
          DMOracle.QExecSQL.ExecSQL;
        end;
      end;
      DMOracle.DBCemapa.Commit;
      MessageDlg('Pedidos liberados com sucesso', mtInformation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TFLiberaPedido.LiberarComercial1Click(Sender: TObject);
var wAux : string;
    i,wOperacao,wVendedor: integer;
    wAno,wMes,wDia : Word;
    wVal_Outros : Real;
begin
  inherited;
{  if MessageDlg('Deseja realmente liberar o Comercial?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMOracle.DBCemapa.StartTransaction;
    try
      for i:=0 to ListView1.Items.Count-1 do
      begin
        if ListView1.Items.Item[i].Checked then
        begin
          wAux := DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_PEDIDO_CAB ', ' COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption);
          wAux := copy(waux, 1, 1) + '0' + copy(waux, 3, 1); //aqui é a parte que define que foi liberado
          DMOracle.QExecSQL.close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET IND_LIBERADO = ''' + wAux + ''', ' +
                                    ' COD_USUARIO_LIB_COM = ' + IntToStr(DMUSUARIO.CodUsuarioCorrente) +
                                    ' WHERE COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption);
          DMOracle.QExecSQL.ExecSQL;
        end;
      end;

      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
 }
  if FConfirmacaoLiberarComercial = nil then
    FConfirmacaoLiberarComercial := TFConfirmacaoLiberarComercial.create(application);

  if FConfirmacaoLiberarComercial.showmodal = mryes then
  begin
    for i:=0 to ListView1.Items.Count-1 do
    begin
      if ListView1.Items.Item[i].Checked then
      begin
        DMOracle.DBCemapa.StartTransaction;
        try
           // se o pedido for brinde ou bonificacao - vai verificar se o vendedor possui verba
           wOperacao := StrToInt(DMOracle.BuscaNome('SELECT COD_OPERACAO FROM TB_PEDIDO_CAB ', ' COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption));
           DMOperacao.QOperacao.Close;
           DMOperacao.QOperacao.SetVariable('Pk',wOperacao);
           DMOperacao.QOperacao.Open;
           If (DMOperacao.QOperacaoInd_Bonificacao.Value = 'S') Or
              (DMOperacao.QOperacaoInd_Brinde.Value = 'S') Then
            Begin
              With DMVerbaRepresentante do
              Begin
                DecodeDate(Date,wAno,wMes,wDia);
                wVendedor := StrToInt(DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_PEDIDO_CAB ', ' COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption));
                QVerbaVendedorCons.Close;
                QVerbaVendedorCons.SetVariable('Ano',wAno);
                QVerbaVendedorCons.SetVariable('Mes',wMes);
                QVerbaVendedorCons.SetVariable('Vendedor',wVendedor);
                QVerbaVendedorCons.Open;
                if Not(QVerbaVendedorCons.Eof) Then
                  Begin
                    wVal_Outros := StrToFloat(DMOracle.BuscaNome('SELECT Sum(QT_PEDIDO * VAL_UNITARIO) FROM TB_PEDIDO_ITEM ', ' COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption));
                    If QVerbaVendedorConsVal_Verba.Value < QVerbaVendedorConsVal_Utilizado.Value + wVal_Outros Then
                      Raise Exception.Create('Vendedor não possui verba para brinde/bonificação')
                    Else
                      Begin
                        QVerbaVendedor.Close;
                        QVerbaVendedor.SetVariable('Num_Ano',wAno);
                        QVerbaVendedor.SetVariable('Num_Mes',wMes);
                        QVerbaVendedor.SetVariable('Cod_Vendedor',wVendedor);
                        QVerbaVendedor.SetVariable('Cod_Verba_Representante',QVerbaVendedorConsCod_Verba_Representante.Value);
                        QVerbaVendedor.Open;
                        If not(QVerbaVendedor.Eof) Then
                         Begin
                          wVal_Outros := wVal_Outros + QVerbaVendedorVal_Utilizado.Value;
                          QVerbaVendedor.Edit;
                          QVerbaVendedorVal_Utilizado.Value := wVal_Outros;
                          QVerbaVendedor.Post;
                         End;
                      End;
                  End;
              End;
            End;
          wAux := DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_PEDIDO_CAB ', ' COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption);
          if (wAux = 'SIM') or (copy(waux, 2, 1) = '0') then
            raise Exception.create('Algum pedido já foi liberado ou não estava bloqueado pelo comercial');
          wAux := copy(waux, 1, 1) + '0' + copy(waux, 3, 1); //aqui é a parte que define que foi liberado
          DMOracle.QExecSQL.close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET IND_LIBERADO = ''' + wAux + ''', ' +
                                    ' COD_USUARIO_LIB_COM = ' + IntToStr(DMUSUARIO.CodUsuarioCorrente) +
                                    ' WHERE COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption);
          DMOracle.QExecSQL.ExecSQL;

          //quando alterar a parte comercial pode ser alterada a comissao.
          if FConfirmacaoLiberarComercial.MeComissao.Text <> '' then
           Begin
            DMOracle.QExecSQL.close;
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_ITEM SET PERC_COMISSAO = ' + StringReplace(FConfirmacaoLiberarComercial.meComissao.Text,',','.',[]) );
            DMOracle.QExecSQL.SQL.Add(' WHERE COD_PEDIDO_CAB = ' + ListView1.Items.Item[i].Caption);
            DMOracle.QExecSQL.ExecSQL;
           End;
          DMOracle.DBCemapa.Commit;
          MessageDlg('Pedidos liberados com sucesso', mtInformation, [mbok], 0);
        except
          DMOracle.DBCemapa.Rollback;
          raise;
        end;
      end;
    end;
  end;
end;

procedure TFLiberaPedido.PedidoscomProblemaComercial1Click(
  Sender: TObject);
begin
  inherited;
  If FLiberaPedidoParam = Nil then
     FLiberaPedidoParam := TFLiberaPedidoParam.Create(Application);
  FLiberaPedidoParam.PGRelatorio.Pages[0].TabVisible := True;
  If FLiberaPedidoParam.ShowModal = MrOk then
  begin
    DMLiberarPedido.QRPedidosProblemaComercial.Close;
    if trim(FLiberaPedidoParam.Me0Vendedor.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('COD_VENDEDOR', strtoint(trim(FLiberaPedidoParam.Me0Vendedor.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('COD_VENDEDOR', null);
    if trim(FLiberaPedidoParam.Me0Supervisor.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('COD_SUPERVISOR', strtoint(trim(FLiberaPedidoParam.Me0Supervisor.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('COD_SUPERVISOR', null);

    if trim(FLiberaPedidoParam.Me0Filial.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('COD_FILIAL', strtoint(trim(FLiberaPedidoParam.Me0Filial.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('COD_FILIAL', null);

    if trim(FLiberaPedidoParam.Me0DtInicial.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('DT_INICIO', strtoDate(trim(FLiberaPedidoParam.Me0DtInicial.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('DT_INICIO', null);

    if trim(FLiberaPedidoParam.Me0DtFinal.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('DT_FIM', strtoDate(trim(FLiberaPedidoParam.Me0DtFinal.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaComercial.SetVariable('DT_FIM', null);

    DMLiberarPedido.QRPedidosProblemaComercial.Open;

    if FRPedidosProblemaComercial = nil then
      FRPedidosProblemaComercial := TFRPedidosProblemaComercial.create(application);

    FRPedidosProblemaComercial.QRLVendedor.Caption := 'Vendedor: ' + FLiberaPedidoParam.ed0Vendedor.Text;
    FRPedidosProblemaComercial.QRLFilial.Caption := 'Filial: ' + FLiberaPedidoParam.ed0Filial.Text;
    FRPedidosProblemaComercial.QRLPeriodo.Caption := 'Período: ' + FLiberaPedidoParam.Me0DtInicial.Text + ' a ' + FLiberaPedidoParam.Me0DtFinal.Text;              

    If FLiberaPedidoParam.RGPreview.ItemIndex = 0 then
      FRPedidosProblemaComercial.QRPrimario.Preview
    else
      FRPedidosProblemaComercial.QRPrimario.Print;
    DMLiberarPedido.QRPedidosProblemaComercial.Close;
  end;
end;

procedure TFLiberaPedido.PedidoscomProblemaFinanceiro1Click(
  Sender: TObject);
begin
  inherited;
  If FLiberaPedidoParam = Nil then
     FLiberaPedidoParam := TFLiberaPedidoParam.Create(Application);
  FLiberaPedidoParam.PGRelatorio.Pages[1].TabVisible := True;
  If FLiberaPedidoParam.ShowModal = MrOk then
  begin
    DMLiberarPedido.QRPedidosProblemaFinanceiro.Close;
    if trim(FLiberaPedidoParam.Me1Vendedor.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaFinanceiro.SetVariable('COD_VENDEDOR', strtoint(trim(FLiberaPedidoParam.Me1Vendedor.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaFinanceiro.SetVariable('COD_VENDEDOR', null);

    if trim(FLiberaPedidoParam.Me1Filial.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaFinanceiro.SetVariable('COD_FILIAL', strtoint(trim(FLiberaPedidoParam.Me1Filial.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaFinanceiro.SetVariable('COD_FILIAL', null);

    if trim(FLiberaPedidoParam.Me1DtInicial.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaFinanceiro.SetVariable('DT_INICIO', strtoDate(trim(FLiberaPedidoParam.Me1DtInicial.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaFinanceiro.SetVariable('DT_INICIO', null);

    if trim(FLiberaPedidoParam.Me1DtFinal.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaFinanceiro.SetVariable('DT_FIM', strtoDate(trim(FLiberaPedidoParam.Me1DtFinal.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaFinanceiro.SetVariable('DT_FIM', null);

    DMLiberarPedido.QRPedidosProblemaFinanceiro.Open;

    if FRPedidosProblemaFinanceiro = nil then
      FRPedidosProblemaFinanceiro := TFRPedidosProblemaFinanceiro.create(application);

    FRPedidosProblemaFinanceiro.QRLVendedor.Caption := 'Vendedor: ' + FLiberaPedidoParam.ed1Vendedor.Text;
    FRPedidosProblemaFinanceiro.QRLFilial.Caption := 'Filial: ' + FLiberaPedidoParam.ed1Filial.Text;
    FRPedidosProblemaFinanceiro.QRLPeriodo.Caption := 'Período: ' + FLiberaPedidoParam.Me1DtInicial.Text + ' a ' + FLiberaPedidoParam.Me1DtFinal.Text;

    If FLiberaPedidoParam.RGPreview.ItemIndex = 0 then
      FRPedidosProblemaFinanceiro.QRPrimario.Preview
    else
      FRPedidosProblemaFinanceiro.QRPrimario.Print;
    DMLiberarPedido.QRPedidosProblemaFinanceiro.Close;
  end;
end;

procedure TFLiberaPedido.PedidoscomProblemaCadastro1Click(Sender: TObject);
begin
  inherited;
  If FLiberaPedidoParam = Nil then
     FLiberaPedidoParam := TFLiberaPedidoParam.Create(Application);
  FLiberaPedidoParam.PGRelatorio.Pages[2].TabVisible := True;
  If FLiberaPedidoParam.ShowModal = MrOk then
  begin
    DMLiberarPedido.QRPedidosProblemaCadastro.Close;
    if trim(FLiberaPedidoParam.Me2Vendedor.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaCadastro.SetVariable('COD_VENDEDOR', strtoint(trim(FLiberaPedidoParam.Me2Vendedor.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaCadastro.SetVariable('COD_VENDEDOR', null);

    if trim(FLiberaPedidoParam.Me2Filial.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaCadastro.SetVariable('COD_FILIAL', strtoint(trim(FLiberaPedidoParam.Me2Filial.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaCadastro.SetVariable('COD_FILIAL', null);

    if trim(FLiberaPedidoParam.Me2DtInicial.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaCadastro.SetVariable('DT_INICIO', strtoDate(trim(FLiberaPedidoParam.Me2DtInicial.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaCadastro.SetVariable('DT_INICIO', null);

    if trim(FLiberaPedidoParam.Me2DtFinal.Text) <> '' then
      DMLiberarPedido.QRPedidosProblemaCadastro.SetVariable('DT_FIM', strtoDate(trim(FLiberaPedidoParam.Me2DtFinal.Text)))
    else
      DMLiberarPedido.QRPedidosProblemaCadastro.SetVariable('DT_FIM', null);

    DMLiberarPedido.QRPedidosProblemaCadastro.Open;

    if FRPedidosProblemaCadastro = nil then
      FRPedidosProblemaCadastro := TFRPedidosProblemaCadastro.create(application);

    FRPedidosProblemaCadastro.QRLVendedor.Caption := 'Vendedor: ' + FLiberaPedidoParam.ed2Vendedor.Text;
    FRPedidosProblemaCadastro.QRLFilial.Caption := 'Filial: ' + FLiberaPedidoParam.ed2Filial.Text;
    FRPedidosProblemaCadastro.QRLPeriodo.Caption := 'Período: ' + FLiberaPedidoParam.Me2DtInicial.Text + ' a ' + FLiberaPedidoParam.Me2DtFinal.Text;

    If FLiberaPedidoParam.RGPreview.ItemIndex = 0 then
      FRPedidosProblemaCadastro.QRPrimario.Preview
    else
      FRPedidosProblemaCadastro.QRPrimario.print;
    DMLiberarPedido.QRPedidosProblemaCadastro.Close;
  end;
end;

end.

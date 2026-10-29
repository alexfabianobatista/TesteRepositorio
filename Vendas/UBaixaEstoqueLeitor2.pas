unit UBaixaEstoqueLeitor2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmPedido, UFmEmbarque, StdCtrls, Mask, Buttons, UFmProduto,
  ActnList, Menus, Grids, DBGrids, ExtCtrls, CPort, StrUtils, Oracle,
  DBCtrls;

type
  TCodBarraType = (cbtDesconhecido, cbtEmbarque, cbtPedido, cbtPesagem, cbtComando);

  TCodBarraIdent = class
  private
  protected
  public
    function Identifica(CodBarra: String): TCodBarraType;
  end;

  TFBaixaEstoqueLeitor2 = class(TForm)
    FmEmbarque: TFmEmbarque;
    FmPedido: TFmPedido;
    MECodBarra: TMaskEdit;
    Label1: TLabel;
    FmProduto: TFmProduto;
    LTotalEmbarcado: TLabel;
    BtnDestravar: TBitBtn;
    SBBaixar: TSpeedButton;
    BtSair: TBitBtn;
    ALBaixaEstoqueLeitor: TActionList;
    ActBaixaEtiqueta: TAction;
    DBGPedido: TDBGrid;
    MMBaixaEstoqueLeitor: TMainMenu;
    Relatrios1: TMenuItem;
    CpLeitor: TComPort;
    LLeitor: TLabel;
    PDados: TPanel;
    PQtPedido: TPanel;
    Label2: TLabel;
    PQtVol: TPanel;
    Label3: TLabel;
    PQtEmbarcado: TPanel;
    Label4: TLabel;
    PUltPeso: TPanel;
    Label5: TLabel;
    MePeso: TMaskEdit;
    OPBaixaEstoqueLeitor: TOraclePackage;
    DBEQtPedido: TDBEdit;
    DBENumVolumes: TDBEdit;
    DBEQtEmbarcado: TDBEdit;
    Estoquebaixado1: TMenuItem;
    Produtosembarcados1: TMenuItem;
    ActConferidoMotorista: TAction;
    CBConferidoMotorista: TCheckBox;
    Cdigosdebarradecomandospembarque1: TMenuItem;
    DBETotalVol: TDBEdit;
    LBLVolBarra: TLabel;
    Label6: TLabel;
    procedure FmEmbarqueMeEmbarqueExit(Sender: TObject);
    procedure FmPedidoMePedidoExit(Sender: TObject);
    procedure MECodBarraKeyPress(Sender: TObject; var Key: Char);
    procedure ActBaixaEtiquetaExecute(Sender: TObject);
    procedure SBBaixarClick(Sender: TObject);
    procedure FmProdutoMeProdutoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CpLeitorRxChar(Sender: TObject; Count: Integer);
    procedure FormActivate(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure BtnDestravarClick(Sender: TObject);
    procedure FmEmbarqueBtEmbarqueClick(Sender: TObject);
    procedure FmPedidoBtPedidoClick(Sender: TObject);
    procedure FmProdutoMeProdutoChange(Sender: TObject);
    procedure DBGPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Estoquebaixado1Click(Sender: TObject);
    procedure Produtosembarcados1Click(Sender: TObject);
    procedure ActConferidoMotoristaExecute(Sender: TObject);
    procedure CBConferidoMotoristaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cdigosdebarradecomandospembarque1Click(Sender: TObject);
    procedure DBGPedidoCellClick(Column: TColumn);
    procedure MECodBarraExit(Sender: TObject);
  private
    FCodBarra: String;
    FLeitura: String;
    FConLeitor: Boolean;
    FUltPeso: Extended;
    FPesoTot: Extended;
    FCodProduto: Integer;
    FCodEmbarque: Integer;
    FCorItemOk: TColor;
    FCodBarraIdent: TCodBarraIdent;
    function BaixaEtiqueta: Boolean;
    function PesoTotalEmbarque: Extended;
    procedure ConectaLeitor;
    procedure ErroLeitor(Erro: String);
    procedure UpdateUI;
    procedure UpdateGrid;
    procedure BloqueiaLeitura;
    procedure LiberaLeitura;
    procedure ProcessaCodBarra(CodBarra: String);
  public
  end;

var
  FBaixaEstoqueLeitor2: TFBaixaEstoqueLeitor2;

const
  ID_COMANDO_CONF_MOTORISTA: Integer = 1;
  ID_COMANDO_SAIR: Integer = 2;
  ID_COMANDO_ENTER: Integer = 3;
  ID_COMANDO_BAIXA: Integer = 4;

implementation

uses
  UMsgPersonalizadaEmbarque, UOracle_cl, UEmbarque_cl, OracleData, DB,
  URBaixaEstoqueLeitor, UEmbarqueParam, URProdutoEmbarcado2, UBiblioteca,
  URCodigoBarraComando;

{$R *.dfm}

procedure TFBaixaEstoqueLeitor2.UpdateUI;
begin
  if FConLeitor then
  begin
    LLeitor.Caption := 'Leitor conectado';
    LLeitor.Hint := '';
    LLeitor.Font.Color := FCorItemOk;
  end
  else
  begin
    LLeitor.Caption := 'Leitor desconectado';
    LLeitor.Font.Color := clRed;
  end;
  LTotalEmbarcado.Caption := 'Total do Embarque: ' + FormatFloat('#,##0.00', FPesoTot) + ' KG';
  MePeso.Text := FormatFloat('#,##0.00', FUltPeso);
  MECodBarra.Text := FCodBarra;
  if Trim(FmProduto.MeProduto.Text) <> IntToStr(FCodProduto) then
  begin
    if FCodProduto = 0 then
      FmProduto.MeProduto.Text := ''
    else
      FmProduto.MeProduto.Text := IntToStr(FCodProduto);
  end;

  PDados.Color := Self.Color;
  with DMEmbarque do
    if (not QRBaixaEstoqueLeitor.Eof) then
    begin
      if QRBaixaEstoqueLeitorind_situacao.Value = SIT_ITEM_EMBARQUE_ATENDIDO then
        PDados.Color := FCorItemOk
      else if QRBaixaEstoqueLeitorind_situacao.Value = SIT_ITEM_EMBARQUE_EXCEDIDO then
        PDados.Color := clRed;
    end;
end;

procedure TFBaixaEstoqueLeitor2.FmEmbarqueMeEmbarqueExit(Sender: TObject);
var
  Emb: Integer;
begin
  FmEmbarque.MeEmbarqueExit(Sender);
  if Trim(FmEmbarque.MeEmbarque.Text) = '' then
    FmEmbarque.EdEmbarque.Text := 'Informe um embarque';
  FPesoTot := PesoTotalEmbarque;
  UpdateGrid;
  Emb := StrToInt('0' + Trim(FmEmbarque.MeEmbarque.Text));
  if (FCodEmbarque <> Emb) then
    CBConferidoMotorista.Checked := (Emb > 0) and (DMOracle.FastSelect('IND_CONFERIDO_MOTORISTA',
      'TB_EMBARQUE', 'COD_EMBARQUE = ' + IntToStr(Emb)) = 'S');
  FCodEmbarque := Emb;
end;

procedure TFBaixaEstoqueLeitor2.FmPedidoMePedidoExit(Sender: TObject);
begin
  FmPedido.MePedidoExit(Sender);
  if Trim(FmPedido.MePedido.Text) = '' then
    FmPedido.EdPedido.Text := 'Informe um pedido';
  UpdateGrid;
end;

procedure TFBaixaEstoqueLeitor2.MECodBarraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (GetKeyState(VK_CONTROL) >= 0) and (not (Key in ['0'..'9', #8, #13])) then
    Key := #0;
end;

procedure TFBaixaEstoqueLeitor2.ActBaixaEtiquetaExecute(Sender: TObject);
begin
  FCodBarra := MECodBarra.Text;
  BaixaEtiqueta;
  UpdateGrid;
end;

procedure TFBaixaEstoqueLeitor2.SBBaixarClick(Sender: TObject);
begin
  ActBaixaEtiquetaExecute(Sender);
end;

function TFBaixaEstoqueLeitor2.BaixaEtiqueta: Boolean;
var
  CodEmbarque, CodPedido, CodProduto: Integer;
  QtPeso: Extended;
  Passo, StrRetorno: String;
  Retorno: Integer;
begin
  Result := False;
  //Baixando etiqueta
  try
    //Validando campos
    Passo := 'validar campos.';
    if FCodBarra = '' then
      Raise Exception.Create('Código de barras em branco.');
    CodEmbarque := StrToInt('0' + Trim(FmEmbarque.MeEmbarque.Text));
    if (CodEmbarque <= 0) or (Trim(FmEmbarque.EdEmbarque.Text) = '') then
      Raise Exception.Create('Embarque inválido.');
    CodPedido := StrToInt('0' + Trim(FmPedido.MePedido.Text));
    if (CodPedido <= 0) or (Trim(FmPedido.EdPedido.Text) = '') then
      Raise Exception.Create('Pedido inválido.');

    //Extraindo dados da Etiqueta
    Passo := 'ler etiqueta (código da pesagem).';
    StrToInt(Copy(FCodBarra, 1, 7));
    Passo := 'ler etiqueta (código do produto).';
    CodProduto := StrToInt(Copy(FCodBarra, 8, 3));
    Passo := 'ler etiqueta (peso).';
    QtPeso := StrToFloat(Copy(FCodBarra, 11, 2) + ',' + Copy(FCodBarra, 13, 2));
    FCodProduto := CodProduto;

    Passo := 'baixar etiqueta no banco.';
    Retorno := OPBaixaEstoqueLeitor.CallIntegerFunction('BAIXAR_ETIQUETA',
      ['PEMBARQUE', CodEmbarque, 'PPEDIDO', CodPedido, 'PBARRA', FCodBarra,
      'PRETORNO', parString]);
    StrRetorno := OPBaixaEstoqueLeitor.GetParameter('PRETORNO');
    if Retorno > 0 then
      Raise Exception.Create(StrRetorno);

    try
      FPesoTot := FPesoTot + StrToFloat('0' + StrRetorno);
    except
      on E: Exception do
      begin
        LLeitor.Hint := e.Message;
        FPesoTot := FPesoTot + QtPeso;
      end;
    end;
    FCodProduto := CodProduto;
    FCodBarra := '';
    FUltPeso := QtPeso;

    DMOracle.DBCemapa.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      Passo := 'Erro na baixa da etiqueta.' + #13 + #10 +
            'Erro ao ' + Passo + #13 + #10 +
            E.Message;
      if FConLeitor then
        ErroLeitor(Passo)
      else
        MessageDlg(Passo, mtError, [mbOK], 0);
      DMOracle.DBCemapa.Rollback;
      UpdateUI;
      MECodBarra.SelectAll;
    end;
  end;
end;

procedure TFBaixaEstoqueLeitor2.ConectaLeitor;
begin
  try
    CpLeitor.Connected := True;
  except
    on E: Exception do
      LLeitor.Hint := E.Message;
  end;
  FConLeitor := CpLeitor.Connected;
end;

procedure TFBaixaEstoqueLeitor2.FmProdutoMeProdutoExit(Sender: TObject);
begin
  FmProduto.MeProdutoExit(Sender);
  if Trim(FmProduto.MeProduto.Text) = '' then
    FmProduto.EdProduto.Text := '';
end;

procedure TFBaixaEstoqueLeitor2.FormCreate(Sender: TObject);
begin
  FCodBarra := '';
  FUltPeso := 0;
  FPesoTot := 0;
  FCodProduto := 0;
  FCodEmbarque := 0;
  FCorItemOk := Bib.HexToTColor('32CD32');
  FCodBarraIdent := TCodBarraIdent.Create;
end;

procedure TFBaixaEstoqueLeitor2.BloqueiaLeitura;
begin
  CpLeitor.ClearBuffer(True, True);
  Sleep(10);
  CpLeitor.WriteStr(#2 + '999999' + #3);
  Sleep(10);
  CpLeitor.WriteStr(#2 + '100103' + #3);
  Sleep(10);
  CpLeitor.WriteStr(#2 + '999999' + #3);
  Sleep(10);
  CpLeitor.ClearBuffer(True, True);
end;

procedure TFBaixaEstoqueLeitor2.LiberaLeitura;
begin
  CpLeitor.ClearBuffer(True, True);
  Sleep(10);
  CpLeitor.WriteStr(#2 + '999999' + #3);
  Sleep(10);
  CpLeitor.WriteStr(#2 + '100113' + #3);
  Sleep(10);
  CpLeitor.WriteStr(#2 + '999999' + #3);
  Sleep(10);
  CpLeitor.ClearBuffer(True, True);
end;

procedure TFBaixaEstoqueLeitor2.CpLeitorRxChar(Sender: TObject;
  Count: Integer);
var
  wAux: string;
begin
  CpLeitor.ReadStr(wAux, Count);
  if (PosEx(#6, wAux) > 0) and (Length(FLeitura + wAux) < 14) then
  begin
    FLeitura := '';
    wAux := '';
    CpLeitor.ClearBuffer(True, True);
  end;

  FLeitura := FLeitura + wAux;
  if Length(FLeitura) >= 14 then
  begin
    FLeitura := Copy(FLeitura, 1, 14);
    ProcessaCodBarra(FLeitura);
    FLeitura := '';
  end;
end;

procedure TFBaixaEstoqueLeitor2.ProcessaCodBarra(CodBarra: String);
var
  wInt : integer;
begin
  case FCodBarraIdent.Identifica(CodBarra) of
    cbtPesagem:
    begin
      FCodBarra := CodBarra;
      BaixaEtiqueta;
      UpdateGrid;
    end;
    cbtPedido:
    begin
      FmPedido.MePedido.Text := IntToStr(StrToInt(Copy(CodBarra, 9, 6)));
      FmPedidoMePedidoExit(Self);
    end;
    cbtEmbarque:
    begin
      FmEmbarque.MeEmbarque.Text := IntToStr(StrToInt(Copy(CodBarra, 9, 6)));
      FmEmbarqueMeEmbarqueExit(Self);
    end;
    cbtComando:
    begin
      //Código de barra representa um comando
      CodBarra := Copy(CodBarra, 9, 6); //Últimos 6 dígitos representam o ID do comando.
      wInt := StrToInt('0' + Trim(CodBarra));
      if wInt = ID_COMANDO_CONF_MOTORISTA then
        ActConferidoMotorista.Execute
      else if wInt = ID_COMANDO_ENTER then
        PostMessage(GetActiveWindow, WM_KEYDOWN, VK_RETURN, 0)
      else if wInt = ID_COMANDO_BAIXA then
        ActBaixaEtiqueta.Execute
      else if wInt = ID_COMANDO_SAIR then
        Close;
    end;
  end;
end;

procedure TFBaixaEstoqueLeitor2.ErroLeitor(Erro: String);
begin
  if FConLeitor then
    BloqueiaLeitura;
  try
    if FMsgPersonalizadaEmbarque = nil then
      FMsgPersonalizadaEmbarque := TFMsgPersonalizadaEmbarque.Create(Application);
    FMsgPersonalizadaEmbarque.lbMensagem.Caption := Erro;
    FMsgPersonalizadaEmbarque.ShowModal;
  finally
    if FConLeitor then
      LiberaLeitura;
  end;
end;

procedure TFBaixaEstoqueLeitor2.FormActivate(Sender: TObject);
begin
  ConectaLeitor;
  UpdateUI;
  MECodBarra.SetFocus;
end;

procedure TFBaixaEstoqueLeitor2.BtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFBaixaEstoqueLeitor2.BtnDestravarClick(Sender: TObject);
begin
  if FConLeitor then
    LiberaLeitura;
end;

procedure TFBaixaEstoqueLeitor2.UpdateGrid;
begin
  with DMEmbarque.QRBaixaEstoqueLeitor do
  begin
    Close;
    if (Trim(FmEmbarque.MeEmbarque.Text) <> '') and
      (Trim(FmPedido.MePedido.Text) <> '') then
    begin
      SetVariable('EMBARQUE', Trim(FmEmbarque.MeEmbarque.Text));
      SetVariable('COD_PEDIDO', Trim(FmPedido.MePedido.Text));
      Open;
      if FCodProduto > 0 then
        while (not Eof) and (FCodProduto <> FieldByName('COD_PRODUTO').Value) do
          Next;
    end;
    UpdateUI;
  end;
end;

procedure TFBaixaEstoqueLeitor2.FmEmbarqueBtEmbarqueClick(Sender: TObject);
begin
  FmEmbarque.BtEmbarqueClick(Sender);
  FmEmbarqueMeEmbarqueExit(Sender);
end;

procedure TFBaixaEstoqueLeitor2.FmPedidoBtPedidoClick(Sender: TObject);
begin
  FmPedido.BtPedidoClick(Sender);
  FmPedidoMePedidoExit(Sender);
end;

procedure TFBaixaEstoqueLeitor2.FmProdutoMeProdutoChange(Sender: TObject);
begin
  FmProdutoMeProdutoExit(Sender);
end;

function TFBaixaEstoqueLeitor2.PesoTotalEmbarque: Extended;
begin
  Result := 0;
  if Trim(FmEmbarque.MeEmbarque.Text) <> '' then
    Result := StrToFloat(DMOracle.FastSelect('NVL(SUM(EB.QT_PESO_EMBARCADO + NVL(P.NUM_EMBALAGEM,0)),0)',
          'TB_ESTOQUE_EMBARCADO EB, TB_PRODUTO P',
          'EB.COD_PRODUTO = P.COD_PRODUTO AND EB.COD_EMBARQUE = ' + Trim(FmEmbarque.MeEmbarque.Text)));
end;

procedure TFBaixaEstoqueLeitor2.DBGPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  DBGPedido.Canvas.Brush.Color := clWhite;
  DBGPedido.Canvas.Font.Color := clBlack;
  with DMEmbarque do
    if (not QRBaixaEstoqueLeitor.Eof) then
    begin
      if QRBaixaEstoqueLeitorind_situacao.Value in [SIT_ITEM_EMBARQUE_ATENDIDO,
        SIT_ITEM_EMBARQUE_EXCEDIDO] then
      begin
        DBGPedido.Canvas.Brush.Color := FCorItemOk;
        DBGPedido.Canvas.Font.Color := clWhite;
      end;
      DBGPedido.Canvas.FillRect(Rect);
      DBGPedido.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TFBaixaEstoqueLeitor2.Estoquebaixado1Click(Sender: TObject);
begin
  if (Trim(FmEmbarque.MeEmbarque.Text) = '') then
    raise Exception.Create('Informe o embarque.');
  with DMEmbarque do
  begin
    if QEmbarqueCOD_EMBARQUE.Text <> Trim(FmEmbarque.MeEmbarque.Text) then
    begin
      QEmbarque.Close;
      QEmbarque.SetVariable('PK', Trim(FmEmbarque.MeEmbarque.Text));
      QEmbarque.Open;
    end;
    QRBaixaEstoqueLeitor.Close;
    QRBaixaEstoqueLeitor.SetVariable('EMBARQUE', Trim(FmEmbarque.MeEmbarque.Text));
    QRBaixaEstoqueLeitor.Open;
    if FrBaixaEstoqueLeitor = nil then
      FrBaixaEstoqueLeitor := TFrBaixaEstoqueLeitor.Create(Application);
    FrBaixaEstoqueLeitor.QRLEmbarque.Caption := 'Embarque: ' + (FmEmbarque.MeEmbarque.Text) +
      'Motorista: ' + QEmbarqueNOME_MOTORISTA.Value + ' - ' + QEmbarqueDT_EMBARQUE.Text;
    FrBaixaEstoqueLeitor.QRPrimario.Preview;
  end;
end;

procedure TFBaixaEstoqueLeitor2.Produtosembarcados1Click(Sender: TObject);
begin
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.AtivaPagina(13);
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QRProdutoEmbarcado2.Close;
      if (FEmbarqueParam.Me14DtInicial.Text = '') or (FEmbarqueParam.Me14DtFinal.Text = '') then
      begin
        QRProdutoEmbarcado2.SetVariable('DT_INICIAL', Null);
        QRProdutoEmbarcado2.SetVariable('DT_FINAL', Null);
      end
      else
      begin
        QRProdutoEmbarcado2.SetVariable('DT_INICIAL', trim(FEmbarqueParam.Me14DtInicial.Text));
        QRProdutoEmbarcado2.SetVariable('DT_FINAL', trim(FEmbarqueParam.Me14DtFinal.Text));
      end;

      if Trim(FEmbarqueParam.Me14Embarque.Text) = '' then
        QRProdutoEmbarcado2.SetVariable('EMBARQUE', Null)
      else
        QRProdutoEmbarcado2.SetVariable('EMBARQUE', trim(FEmbarqueParam.Me14Embarque.Text));

      if Trim(FEmbarqueParam.Me14Pedido.Text) = '' then
        QRProdutoEmbarcado2.SetVariable('PEDIDO', Null)
      else
        QRProdutoEmbarcado2.SetVariable('PEDIDO', trim(FEmbarqueParam.Me14Pedido.Text));

      if Trim(FEmbarqueParam.Fm14Produto.MeProduto.Text) = '' then
        QRProdutoEmbarcado2.SetVariable('PRODUTO', Null)
      else
        QRProdutoEmbarcado2.SetVariable('PRODUTO', trim(FEmbarqueParam.Fm14Produto.MeProduto.Text));

      if (Trim(FEmbarqueParam.Me14Classe.Text) = '') then
        QRProdutoEmbarcado2.SetVariable('CLASSE', Null)
      else
        QRProdutoEmbarcado2.SetVariable('CLASSE', trim(FEmbarqueParam.Me14Classe.Text));

      if trim(FEmbarqueParam.FmCadastro14.MeCadastro.Text) = '' then
        QRProdutoEmbarcado2.SetVariable('COD_CADASTRO', null)
      else
        QRProdutoEmbarcado2.SetVariable('COD_CADASTRO', trim(FEmbarqueParam.FmCadastro14.MeCadastro.Text));

      QRProdutoEmbarcado2.Open;
      if FrProdutoEmbarcado2 = nil then
        FrProdutoEmbarcado2 := TFrProdutoEmbarcado2.Create(Application);
      FrProdutoEmbarcado2.QRLPeriodo.Caption := 'Período: ' + FEmbarqueParam.ME14DtInicial.text + ' até ' + FEmbarqueParam.ME14DtFinal.Text +
        'Embarque: ' + FEmbarqueParam.ME14Embarque.Text + ' Classe: ' + FEmbarqueParam.ME14Classe.Text;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FrProdutoEmbarcado2.QRPrimario.Preview
      else
        FrProdutoEmbarcado2.QRPrimario.Print;
      QRProdutoEmbarcado2.Close;
    end;
end;

procedure TFBaixaEstoqueLeitor2.ActConferidoMotoristaExecute(
  Sender: TObject);
begin
  if Trim(FmEmbarque.MeEmbarque.Text) <> '' then
    CBConferidoMotorista.Checked := not CBConferidoMotorista.Checked;
end;

procedure TFBaixaEstoqueLeitor2.CBConferidoMotoristaClick(Sender: TObject);
var
  Embarque: String;
begin
  Embarque := Trim(FmEmbarque.MeEmbarque.Text);
  if StrToInt('0' + Embarque) > 0 then
    DMOracle.ExecutaSql('UPDATE TB_EMBARQUE SET IND_CONFERIDO_MOTORISTA = ' +
      QuotedStr(IfThen(CBConferidoMotorista.Checked,'S', 'N')) +
      ' WHERE COD_EMBARQUE = ' + Embarque)
  else
    CBConferidoMotorista.Checked := False;
end;

procedure TFBaixaEstoqueLeitor2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FConLeitor then
    CpLeitor.Connected := False;
end;

procedure TFBaixaEstoqueLeitor2.Cdigosdebarradecomandospembarque1Click(
  Sender: TObject);
begin
  with DMEmbarque.CDSCodigoBarraComando do
  begin
    First;
    while not Eof do
      Delete;

    Append;
    FieldByName('CODIGO').Value := '0000000' + '0' + FormatFloat('000000', ID_COMANDO_CONF_MOTORISTA);
    FieldByName('DESCRICAO').Value := 'Conferido Motorista';
    Post;

    Append;
    FieldByName('CODIGO').Value := '0000000' + '0' + FormatFloat('000000', ID_COMANDO_ENTER);
    FieldByName('DESCRICAO').Value := 'Tecla Enter';
    Post;

    Append;
    FieldByName('CODIGO').Value := '0000000' + '0' + FormatFloat('000000', ID_COMANDO_BAIXA);
    FieldByName('DESCRICAO').Value := 'Baixar Etiqueta';
    Post;

    Append;
    FieldByName('CODIGO').Value := '0000000' + '0' + FormatFloat('000000', ID_COMANDO_SAIR);
    FieldByName('DESCRICAO').Value := 'Sair';
    Post;

    if FRCodigoBarraComando = nil then
      FRCodigoBarraComando := TFRCodigoBarraComando.Create(Application);
    FRCodigoBarraComando.QRPrimario.Preview;
  end;
end;

procedure TFBaixaEstoqueLeitor2.DBGPedidoCellClick(Column: TColumn);
begin
  UpdateUI;
end;

{ TCodBarraIdent }

function TCodBarraIdent.Identifica(CodBarra: String): TCodBarraType;
(*
 * Identificando o tipo de um código de barras lido.
 * Identificação feita separadamente para facilitar a manutenção da lógica de
 * interpretação das etiquetas.
 *)
begin
  Result := cbtDesconhecido;
  if Length(CodBarra) = 14 then
  begin
    if Copy(CodBarra, 1, 7) <> Bib.Chars('0', 7) then
      Result := cbtPesagem
    else if Copy(CodBarra, 8, 1) = '2' then
      Result := cbtPedido
    else if Copy(CodBarra, 8, 1) = '1' then
      Result := cbtEmbarque
    else if Copy(CodBarra, 8, 1) = '0' then
      Result := cbtComando;
  end;
end;

procedure TFBaixaEstoqueLeitor2.MECodBarraExit(Sender: TObject);
begin
  if Length(MECodBarra.Text) >= 14 then
  begin
    ProcessaCodBarra(MECodBarra.Text);
    MECodBarra.SetFocus;
  end;
end;

end.


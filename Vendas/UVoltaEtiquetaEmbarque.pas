unit UVoltaEtiquetaEmbarque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, CPort, StrUtils;

type
  TFVoltaEtiquetaEmbarque = class(TForm)
    MEVoltaEtiqueta: TMaskEdit;
    EdVoltaEtiqueta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BtConfirma: TButton;
    MEEmbarque: TMaskEdit;
    MePedido: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdEmbarque: TEdit;
    EdPedido: TEdit;
    CpLeitor: TComPort;
    procedure FormActivate(Sender: TObject);
    procedure MEVoltaEtiquetaExit(Sender: TObject);
    procedure BtConfirmaClick(Sender: TObject);
    procedure MEEmbarqueExit(Sender: TObject);
    procedure MePedidoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CpLeitorRxChar(Sender: TObject; Count: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVoltaEtiquetaEmbarque: TFVoltaEtiquetaEmbarque;
  CodBarras: String;

implementation

uses UOracle_cl, UEmbarque_cl, UBiblioteca;

{$R *.dfm}

procedure TFVoltaEtiquetaEmbarque.FormActivate(Sender: TObject);
begin
  MEEmbarque.SetFocus;
  try
    CpLeitor.Connected := True;
  except
  end;
end;

procedure TFVoltaEtiquetaEmbarque.MEVoltaEtiquetaExit(Sender: TObject);
begin
  if MEVoltaEtiqueta.Text <> '' then
    EdVoltaEtiqueta.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO =' + copy(MEVoltaEtiqueta.Text,7,6));

end;

procedure TFVoltaEtiquetaEmbarque.BtConfirmaClick(Sender: TObject);
var
wEmbarque, wPeso, wPesoEmbarcado, wProduto, wPedidoItem, wSituacao : string;
wVol, wCont, wVolume : integer;
begin
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PESAGEM_PRODUCAO','COD_PESAGEM='+copy(MEVoltaEtiqueta.Text,1,7));
  If wSituacao = 'CANCELADA' Then
    Raise Exception.Create('Essa etiqueta já está Cancelada!');
  If wSituacao = 'CONFIRMADO' Then
    Raise Exception.Create('Essa etiqueta não foi Embarcada!');
       
  if Trim(MeEmbarque.Text) = '' then
    Raise Exception.Create('Informe o Embarque!');
  if Trim(MePedido.Text) = '' then
    Raise Exception.Create('Informe o Pedido!');
  if Trim(MEVoltaEtiqueta.Text) = '' then
    Raise Exception.Create('Informe a Etiqueta!');
  wProduto := copy(MEVoltaEtiqueta.Text,8,3);
  wPedidoItem := DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB='+MePedido.Text+
                                    ' AND COD_PRODUTO = '+wProduto);
  wPeso := copy(MEVoltaEtiqueta.Text,11,2) + ',' + copy(MEVoltaEtiqueta.Text,13,2);
  wPesoEmbarcado := DMOracle.BuscaNome('SELECT QT_QUANTIDADE_AUX FROM TB_PEDIDO_ITEM','COD_PEDIDO_ITEM='+wPedidoItem);
  wVolume := StrToInt(DMOracle.BuscaNome('SELECT QT_EMBALAGEM FROM TB_PEDIDO_ITEM','COD_PEDIDO_ITEM='+wPedidoItem));
  wVolume := wVolume - 1;
  if (wPesoEmbarcado = '') or (wPesoEmbarcado = '0') then
    Raise Exception.Create('Este Item do Pedido não foi embarcado!');

  wPeso := FloatToStr(StrToFloat(wPesoEmbarcado) - StrToFloat(wPeso));

  Executador.Limpa;
  Executador.Adiciona('DELETE FROM TB_ESTOQUE_EMBARCADO WHERE NUM_CONTROLE ='+Copy(MEVoltaEtiqueta.Text,1,7));
  Executador.Adiciona('UPDATE TB_PESAGEM_PRODUCAO SET IND_SITUACAO = ''CANCELADA'' WHERE COD_PESAGEM ='+Copy(MEVoltaEtiqueta.Text,1,7));
  Executador.Adiciona('UPDATE TB_PEDIDO_ITEM SET QT_QUANTIDADE_AUX ='+chr(39)+wPeso+chr(39)+'WHERE COD_PEDIDO_ITEM ='+ wPedidoItem);
  Executador.Adiciona('UPDATE TB_PEDIDO_ITEM SET QT_EMBALAGEM ='+ chr(39)+IntToStr(wVolume)+chr(39)+'WHERE COD_PEDIDO_ITEM ='+ wPedidoItem);
  Executador.Executar(True, True);

  showmessage('Volta das Etiquetas do realizada com sucesso!');
  MEVoltaEtiqueta.Text := '';
  MePedido.Text := '';
  MEEmbarque.Text := '';  
end;

procedure TFVoltaEtiquetaEmbarque.MEEmbarqueExit(Sender: TObject);
begin
  if Trim(MeEmbarque.Text) <> '' then
    EdEmbarque.Text := DMOracle.BuscaNome('SELECT NOME_MOTORISTA FROM TB_EMBARQUE ','COD_EMBARQUE='+MEEmbarque.Text);
end;

procedure TFVoltaEtiquetaEmbarque.MePedidoExit(Sender: TObject);
VAR
wNome : string;
begin
  if Trim(MePedido.Text) <> '' then
  Begin
    wNome := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB ','COD_PEDIDO_CAB ='+MePedido.Text);
    EdPedido.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO ','COD_CADASTRO ='+ wNome);
  end;
end;

procedure TFVoltaEtiquetaEmbarque.BitBtn1Click(Sender: TObject);
begin
  CLose;
end;

procedure TFVoltaEtiquetaEmbarque.CpLeitorRxChar(Sender: TObject;
  Count: Integer);
var
  wCodBarrasTemp: string;
begin
  CpLeitor.ReadStr(wCodBarrasTemp, Count);

  if (PosEx(#6, wCodBarrasTemp) > 0) and (Length(CodBarras + wCodBarrasTemp) < 14) then
  begin
    CodBarras := '';
    wCodBarrasTemp := '';
    CpLeitor.ClearBuffer(True, True);
  end;

  CodBarras := CodBarras + wCodBarrasTemp;
  if Length(CodBarras) >= 14 then
  begin
    MEVoltaEtiqueta.Text := copy(Bib.LimpaNumero(CodBarras), 1, 14);
    CodBarras := '';
    wCodBarrasTemp := '';
    CpLeitor.ClearBuffer(True, True);
    BtConfirma.SetFocus;
  end;
end;

procedure TFVoltaEtiquetaEmbarque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if CpLeitor.Connected then
    CpLeitor.Connected := False;
end;

end.


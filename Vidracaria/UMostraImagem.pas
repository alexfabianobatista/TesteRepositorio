unit UMostraImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, shellapi;

type
  TFMostraImagem = class(TForm)
    DBGrid1: TDBGrid;
    EdCodBarra: TEdit;
    Label1: TLabel;
    BtVizualizar: TBitBtn;
    procedure EdCodBarraChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtVizualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure JumpTo(const aAdress: string);
  end;

var
  FMostraImagem: TFMostraImagem;

implementation

uses UPedido_cl, UOracle_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFMostraImagem.EdCodBarraChange(Sender: TObject);
var
wPedido : string;
begin
  if Length(EdCodBarra.Text) = 12 then
  Begin
    wPedido := DMOracle.BuscaNome('SELECT COD_PEDIDO FROM TB_MATERIAL','COD_PECA='+chr(39)+copy(EdCodBarra.Text,1,6)+chr(39)+' AND NUM_SERIE='+copy(EdCodBarra.Text,9,3));
    if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'TEMPERFOZ') OR (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'VETRO')) Then
      wPedido := DMOracle.BuscaNome('SELECT COD_PEDIDO FROM Tb_MATERIAL','COD_PECA='+COPY(EDCODBARRA.Text,1,6)+' AND NUM_SERIE='+copy(EdCodBarra.Text,9,3));
    DMPedido.QImagemPedido.Close;
    DMPedido.QImagemPedido.SetVariable('COD_PEDIDO_CAB',wPedido);
    DMPedido.QImagemPedido.Open;
    EdCodBarra.Text := '';
    EdCodBarra.SetFocus;
  end;
end;

procedure TFMostraImagem.JumpTo(const aAdress: string);
var
  buffer: string;
begin
  buffer := aAdress;
  ShellExecute(Application.Handle, nil, PChar(buffer), nil, nil, SW_SHOWNORMAL);
end;

procedure TFMostraImagem.FormActivate(Sender: TObject);
begin
  EdCodBarra.SetFocus;
end;

procedure TFMostraImagem.BtVizualizarClick(Sender: TObject);
var
  wCaminho: string;
begin
  wCaminho := DMPedido.QImagemPedidoDESC_CAMINHO.Text;
  JumpTo(wCaminho);
end;

procedure TFMostraImagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMPedido.QImagemPedido.Close;
end;

end.

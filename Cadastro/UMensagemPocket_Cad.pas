unit UMensagemPocket_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFMensagemPocket_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    BitBtn1: TBitBtn;
    DBEdit19: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemPocket_Cad: TFMensagemPocket_Cad;

implementation

uses UMensagemPocket_cl, UVendedorCons, UVendedor_cl, UMensagemPocket_Cons;

{$R *.DFM}

procedure TFMensagemPocket_Cad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMMensagemPocket.QMensagemPocket_CadCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;

end;

procedure TFMensagemPocket_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMMensagemPocket.QMensagemPocket_Cad.Open;
end;

procedure TFMensagemPocket_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMMensagemPocket.QMensagemPocket_Cad.Close;

end;

procedure TFMensagemPocket_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FMensagemPocket_Cons = Nil then
    FMensagemPocket_Cons := TFMensagemPocket_Cons.Create(Application);
  If FMensagemPocket_Cons.ShowModal = mrOk then
  With DMMensagemPocket do
  Begin
    QMensagemPocket_Cad.Close;
    QMensagemPocket_Cad.SetVariable('PK',QMensagemPocket_ConsCod_Mensagem_Pocket.Value);
    QMensagemPocket_Cad.Open;
  End;

end;

end.

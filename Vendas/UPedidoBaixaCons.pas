unit UPedidoBaixaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFPedidoBaixaCons = class(TFTConsulta)
    Label2: TLabel;
    MEFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    MEDtInicial: TMaskEdit;
    Label3: TLabel;
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoBaixaCons: TFPedidoBaixaCons;

implementation

uses UPedido_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFPedidoBaixaCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
   // MEFilialExit(Self);
  End;

end;

procedure TFPedidoBaixaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPedido do
  Begin
    QPedidoBaixaCons.Close;
    If Trim(METexto.Text) = '' then
      QPedidoBaixaCons.SetVariable('PEDIDO',Null)
    Else
      QPedidoBaixaCons.SetVariable('PEDIDO',METexto.Text);
    If Trim(MEFilial.Text) = '' then
      QPedidoBaixaCons.SetVariable('FILIAL',Null)
    Else
      QPedidoBaixaCons.SetVariable('FILIAL',MEFilial.Text);
    If Trim(MEDtInicial.Text) = '' then
      QPedidoBaixaCons.SetVariable('DATA_I',Null)
    Else
      QPedidoBaixaCons.SetVariable('DATA_I',MEDtInicial.Text);

    QPedidoBaixaCons.Open;
  end;

end;

procedure TFPedidoBaixaCons.FormCreate(Sender: TObject);
begin
  inherited;
  MeDtInicial.Text := DateToStr(Date);
end;

end.

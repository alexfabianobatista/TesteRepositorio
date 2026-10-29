unit UVendaPerdidaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, DBPanel, StdCtrls, Buttons, Mask, DBCtrls,
  ActnList, ComCtrls;

type
  TFVendaPerdidaCad = class(TForm)
    DsVendaPerdida: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    BtConfirma: TBitBtn;
    BitBtn1: TBitBtn;
    DBPanel1: TDBPanel;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    procedure FormActivate(Sender: TObject);
    procedure BtConfirmaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendaPerdidaCad: TFVendaPerdidaCad;

implementation

uses UProduto_cl, UUsuario_cl, UOracle_cl, UMotivoCons, UParamSistema_cl,
  UImpressoraFiscal;

{$R *.dfm}

procedure TFVendaPerdidaCad.FormActivate(Sender: TObject);
begin
  DMProduto.QVendaPerdida.Close;
  DMProduto.QVendaPerdida.Open;
  DMProduto.QVendaPerdida.Insert;
  DMProduto.QVendaPerdidaCod_Produto.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
  DMProduto.QVendaPerdidaCod_Vendedor.Value := DMUsuario.CodVendedorPadrao;
  DMProduto.QVendaPerdidaDt_Venda_Perdida.Value := DMOracle.DataServ;
end;

procedure TFVendaPerdidaCad.BtConfirmaClick(Sender: TObject);
begin
  DMProduto.QVendaPerdida.Post;
end;

procedure TFVendaPerdidaCad.BitBtn1Click(Sender: TObject);
begin
  DMProduto.QVendaPerdida.Cancel;
end;

procedure TFVendaPerdidaCad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  FormConsulta := @FMotivoCons;
  Classe := TFMotivoCons;

end;

procedure TFVendaPerdidaCad.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressorafiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.

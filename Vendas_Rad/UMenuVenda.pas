unit UMenuVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuVenda = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Pedido1: TMenuItem;
    NotaVenda1: TMenuItem;
    NotaaoConsumidor1: TMenuItem;
    ImpressoraFiscal1: TMenuItem;
    SeguroNotas1: TMenuItem;
    DesdobramentoClaspar1: TMenuItem;
    NotadeTransfernciaFiliais1: TMenuItem;
    LimpezaNotasVendas1: TMenuItem;
    Contabilizao1: TMenuItem;
    Vendasporvendedorregio1: TMenuItem;
    Notas1: TMenuItem;
    Frete1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure NotaVenda1Click(Sender: TObject);
    procedure NotaaoConsumidor1Click(Sender: TObject);
    procedure ImpressoraFiscal1Click(Sender: TObject);
    procedure SeguroNotas1Click(Sender: TObject);
    procedure DesdobramentoClaspar1Click(Sender: TObject);
    procedure NotadeTransfernciaFiliais1Click(Sender: TObject);
    procedure LimpezaNotasVendas1Click(Sender: TObject);
    procedure Vendasporvendedorregio1Click(Sender: TObject);
    procedure Notas1Click(Sender: TObject);
    procedure Frete1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuVenda: TFMenuVenda;

implementation

uses UPedidoCad, UTela_cl, UNotaSaidaCad, UNotaConsumidor,
  UImpressoraFiscal, ULiberaFrete, UParamSistema_cl, UDesdobramentoCad,
  UDesdobramento_ClasparCons, UNotaTransfFilialCad, ULimpezaVendas,
  UContabilidadeParam, UVenda_Regiao;

{$R *.DFM}

procedure TFMenuVenda.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'VENDA';
end;

procedure TFMenuVenda.Pedido1Click(Sender: TObject);
begin
  inherited;
  If FPedidoCad = Nil then
    FPedidoCad := TFPedidoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPedidoCad.Caption,FPedidoCad.Name);
  If (DmParamSistema.QParamSistemaCod_Empresa.Value <> 'CGS') And
     (DmParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') Then
   Begin
    FPedidoCad.DbEdit12.Visible := False;
    FPedidoCad.Label12.Visible := False;
   End;
  If DmParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
   Begin
     FPedidoCad.DbEdit37.Visible := True;
     FPedidoCad.Label30.Visible := True;
     FPedidoCad.BitBtn2.Visible := True;
   End;
  FPedidoCad.ShowModal;
end;

procedure TFMenuVenda.NotaVenda1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCad = Nil then
    FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaSaidaCad.Caption,FNotaSaidaCad.Name);
  FNotaSaidaCad.ShowModal;
end;

procedure TFMenuVenda.NotaaoConsumidor1Click(Sender: TObject);
begin
  inherited;
  If FNotaConsumidor = Nil then
    FNotaConsumidor := TFNotaConsumidor.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaConsumidor.Caption,FNotaConsumidor.Name);
  FNotaConsumidor.ShowModal;
end;

procedure TFMenuVenda.ImpressoraFiscal1Click(Sender: TObject);
begin
  inherited;
  If FImpressoraFiscal = Nil Then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFMenuVenda.SeguroNotas1Click(Sender: TObject);
begin
  inherited;
  If FLiberaFrete = Nil then
    FLiberaFrete := TFLiberaFrete.Create(Application);
  DMTela.VerificaTela(pModulo,FLiberaFrete.Caption,FLiberaFrete.Name);
  FLiberaFrete.ShowModal;
end;

procedure TFMenuVenda.DesdobramentoClaspar1Click(Sender: TObject);
begin
  inherited;
  If FDesdobramentoCad = Nil then
    FDesdobramentoCad := TFDesdobramentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FDesdobramentoCad.Caption,FDesdobramentoCad.Name);
  FDesdobramentoCad.ShowModal;

end;

procedure TFMenuVenda.NotadeTransfernciaFiliais1Click(Sender: TObject);
begin
  inherited;
  If FNotaTransfFilialCad = Nil then
    FNotaTransfFilialCad := TFNotaTransfFilialCad.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaTransfFilialCad.Caption,FNotaTransfFilialCad.Name);
  FNotaTransfFilialCad.ShowModal;

end;

procedure TFMenuVenda.LimpezaNotasVendas1Click(Sender: TObject);
begin
  inherited;
  If FLimpezaVendas = Nil then
    FLimpezaVendas := TFLimpezaVendas.Create(Application);
//  DMTela.VerificaTela(pModulo,FNotaTransfFilialCad.Caption);
  FLimpezaVendas.ShowModal;

end;

procedure TFMenuVenda.Vendasporvendedorregio1Click(Sender: TObject);
begin
  inherited;
  if FVenda_regiao = nil then
     FVenda_regiao := TFVenda_regiao.Create(Application);
  DMTela.VerificaTela(pModulo,FVenda_regiao.Caption,FVenda_regiao.Name);
  FVenda_regiao.ShowModal;
end;

procedure TFMenuVenda.Notas1Click(Sender: TObject);
begin
  inherited;
  If FContabilidadeParam = Nil then
    FContabilidadeParam := TFContabilidadeParam.Create(Application);
  DMTela.VerificaTela(pModulo,FContabilidadeParam.Caption,FContabilidadeParam.Name);
  FContabilidadeParam.PGRelatorio.Pages[0].TabVisible := True;
  FContabilidadeParam.BtOk.Visible := True;
  FContabilidadeParam.BtCancela.Visible := True;
  FContabilidadeParam.BitBtn1.Visible := True;
  FContabilidadeParam.ShowModal;

end;

procedure TFMenuVenda.Frete1Click(Sender: TObject);
begin
  inherited;
  If FContabilidadeParam = Nil then
    FContabilidadeParam := TFContabilidadeParam.Create(Application);
  DMTela.VerificaTela(pModulo,FContabilidadeParam.Caption,FContabilidadeParam.Name);
  FContabilidadeParam.PGRelatorio.Pages[1].TabVisible := True;
  FContabilidadeParam.BtOk.Visible := False;
  FContabilidadeParam.BtCancela.Visible := False;
  FContabilidadeParam.BitBtn1.Visible := False;
  FContabilidadeParam.ShowModal;

end;

end.

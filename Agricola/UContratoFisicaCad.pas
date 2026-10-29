unit UContratoFisicaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu;

type
  TFContratoFisicaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label14: TLabel;
    Label23: TLabel;
    Label19: TLabel;
    DBEdit1: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit23: TDBEdit;
    BtParceiro: TBitBtn;
    DBEdit19: TDBEdit;
    BtFielDepositario: TBitBtn;
    DBDirceu1: TDBDirceu;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BtFilial: TBitBtn;
    DBFilial: TDBDirceu;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BTAvalista: TBitBtn;
    DBAvalista: TDBDirceu;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    btcliente: TBitBtn;
    DBcliente: TDBDirceu;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    btproduto: TBitBtn;
    DBProduto: TDBDirceu;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    procedure BtParceiroClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure btclienteClick(Sender: TObject);
    procedure btprodutoClick(Sender: TObject);
    procedure BtFielDepositarioClick(Sender: TObject);
    procedure BTAvalistaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoFisicaCad: TFContratoFisicaCad;

implementation

uses Ucontrato_cl, UCadastroCons, UFilialCons, UProdutoCons, UCadastro_cl,
  UFilial_cl, UProduto_cl, UContratoCons;

{$R *.DFM}

procedure TFContratoFisicaCad.BtParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMcontrato.QcontratoCompra_PFisicaCod_Cadastro_Parceiro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoFisicaCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialcons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMContrato.QContratoCompra_PFisicaCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFContratoFisicaCad.btclienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMcontrato.QContratoCompra_PFisicaCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoFisicaCad.btprodutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutocons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMcontrato.QContratoCompra_PFisicaCod_Produto.Value:=Trunc(DMProduto.QProdutoConsCod_Produto.Value);

end;

procedure TFContratoFisicaCad.BtFielDepositarioClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMcontrato.QContratoCompra_PFisicaCod_Fiel_Depositario.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoFisicaCad.BTAvalistaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMcontrato.QContratoCompra_PFisicaCod_Avalista.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoFisicaCad.FormActivate(Sender: TObject);
begin
  inherited;
     DMContrato.QContratoCompra_PFisica.open;
end;

procedure TFContratoFisicaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     DMContrato.QContratoCompra_PFisica.close;
     Action := CaFree;
     FContratoFisicaCad := Nil;
end;

procedure TFContratoFisicaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContratoCons = Nil then
    FContratoCons := TFContratoCons.Create(Application);
  if FContratoCons.ShowModal = mrOk then
    with DMContrato do
      begin
        QContratoCompra_PFisica.Close;
        QContratoCompra_PFisica.SetVariable('PK',QContratoConsCod_contrato.Value);
        QContratoCompra_PFisica.Open;
        QContratoCons.Close;
      end;

end;

end.

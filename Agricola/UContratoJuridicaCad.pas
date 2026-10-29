unit UContratoJuridicaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu;

type
  TFContratoJuridicaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label14: TLabel;
    Label23: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label5: TLabel;
    Label18: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit23: TDBEdit;
    BtParceiro: TBitBtn;
    DBEdit19: TDBEdit;
    BtFielDepositario: TBitBtn;
    DBEdit2: TDBEdit;
    BtFilial: TBitBtn;
    DBEdit4: TDBEdit;
    BTAvalista: TBitBtn;
    DBEdit3: TDBEdit;
    btcliente: TBitBtn;
    DBEdit8: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit5: TDBEdit;
    btproduto: TBitBtn;
    DBEdit18: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit9: TDBEdit;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    RGSituacao: TDBRadioGroup;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure BtParceiroClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure btclienteClick(Sender: TObject);
    procedure btprodutoClick(Sender: TObject);
    procedure BtFielDepositarioClick(Sender: TObject);
    procedure BTAvalistaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoJuridicaCad: TFContratoJuridicaCad;

implementation

uses UContratoJuridica_cl, UContratoJuridicaCons, UCadastroCons,
  UFilialCons, UProdutoCons, UCadastro_cl, UFilial_cl, UProduto_cl,
  UParamSistema_cl, UNotaSaida_cl;

{$R *.DFM}

procedure TFContratoJuridicaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContratoJuridicaCons = Nil then
    FContratoJuridicaCons := TFContratoJuridicaCons.Create(Application);
  if FContratoJuridicaCons.ShowModal = mrOk then
    with DMContratoJuridica do
      begin
        QContratoCompra_PJuridica.Close;
        QContratoCompra_PJuridica.SetVariable('PK',QContratoCompraJuridicaConsCod_Contrato_Juridica.Value);
        QContratoCompra_PJuridica.Open;
        QContratoCompraJuridicaCons.Close;
      end;

end;

procedure TFContratoJuridicaCad.BtParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DbEdit23.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
    

end;

procedure TFContratoJuridicaCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialcons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  DMcontratoJuridica.QcontratoCompra_PJuridicaCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFContratoJuridicaCad.btclienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMContratoJuridica.QContratoCompra_PJuridicaCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContratoJuridicaCad.btprodutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutocons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMContratoJuridica.QContratoCompra_PJuridicaCod_Produto.Value:=DMProduto.QProdutoConsCod_Produto.Value;

end;

procedure TFContratoJuridicaCad.BtFielDepositarioClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMContratoJuridica.QContratoCompra_PJuridicaCod_Fiel_Depositario.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoJuridicaCad.BTAvalistaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
   DMContratoJuridica.QContratoCompra_PJuridicaCod_Avalista.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoJuridicaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMContratoJuridica.QContratoCompra_PJuridica.Open;
end;

procedure TFContratoJuridicaCad.DBEdit3Change(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') And
     (Trim(DbEdit3.Text) <> '') Then
     DMNotaSaida.MostraMsg(StrToInt(Trim(DbEdit3.Text)));

end;

end.

unit UContratoImplantacaoSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFContratoImplantacaoSaldoCad = class(TFTCadSimples)
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
    BtConsCadastro: TBitBtn;
    BtConsProduto: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoImplantacaoSaldoCad: TFContratoImplantacaoSaldoCad;

implementation

uses UContratoArroz_cl, UCadastroCons, UProdutoCons, UCadastro_cl, UProduto_cl,
  UContratoImplantacaoSaldoCons;

{$R *.DFM}

procedure TFContratoImplantacaoSaldoCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMContratoArroz.QContratoImplantacaoSaldoCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContratoImplantacaoSaldoCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    DMContratoArroz.QContratoImplantacaoSaldoCod_Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFContratoImplantacaoSaldoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMContratoArroz.QContratoImplantacaoSaldo.Close;
  action :=caFree;
  FContratoImplantacaoSaldoCad:=nil;
end;

procedure TFContratoImplantacaoSaldoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMContratoArroz.QContratoImplantacaoSaldo.Close;
  DMContratoArroz.QContratoImplantacaoSaldo.Close;
  DMContratoArroz.QContratoImplantacaoSaldo.open;
end;

procedure TFContratoImplantacaoSaldoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FContratoImplantacaoSaldoCons = Nil then
    FContratoImplantacaoSaldoCons := TFContratoImplantacaoSaldoCons.Create(Application);
  If FContratoImplantacaoSaldoCons.ShowModal = mrOk then
  With DMContratoArroz do
  Begin
    QContratoImplantacaoSaldo.Close;
    QContratoImplantacaoSaldo.SetVariable('PK',QContratoImplantacaoSaldoConsCod_Contrato_Arroz_Saldo.Value);
    QContratoImplantacaoSaldo.Open;
  End;
end;

end.

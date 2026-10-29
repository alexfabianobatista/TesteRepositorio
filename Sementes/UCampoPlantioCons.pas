unit UCampoPlantioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFCampoPlantioCons = class(TFTConsulta)
    MECultivar: TMaskEdit;
    BTCultivarCons: TBitBtn;
    MECadastro: TMaskEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    MESafra: TMaskEdit;
    Label3: TLabel;
    MECultura: TMaskEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    procedure BTCultivarConsClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCampoPlantioCons: TFCampoPlantioCons;

implementation

uses UCadastroCons, UCulturaCons, UCultura_cl, UCampoPlantio_cl,
  UProdutoCons, UCadastro_cl, UProduto_cl;

{$R *.DFM}

procedure TFCampoPlantioCons.BTCultivarConsClick(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      FCampoPlantioCons.MECultivar.Text:=(DMProduto.QProdutoConsCod_Produto.text);
  end;
end;

procedure TFCampoPlantioCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    FCampoPlantioCons.MECadastro.text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFCampoPlantioCons.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FCulturaCons = nil then
     FCulturaCons:= TFCulturaCons.Create(Application);
   if FCulturaCons.ShowModal = mrOk then
   begin
     FCampoPlantioCons.MECultura.Text:=DMCultura.QCulturaConsCod_Cultura.Text;
   end;
end;

procedure TFCampoPlantioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMCampoPlantio do
  Begin
    QCampoPlantioCons.Close;
    if length(Trim(MESafra.Text)) > 2 then
      QCampoPlantioCons.SetVariable('SAFRA',Trim(MESafra.Text))
    else
      QCampoPlantioCons.SetVariable('SAFRA',null);
    if Trim(MECultura.Text) <> '' then
      QCampoPlantioCons.SetVariable('CULTURA',Trim(MECultura.Text))
    else
      QCampoPlantioCons.SetVariable('CULTURA',null);
    if Trim(MECadastro.Text) <> '' then
      QCampoPlantioCons.SetVariable('CADASTRO',Trim(MECadastro.Text))
    else
      QCampoPlantioCons.SetVariable('CADASTRO',null);
    if Trim(MECultivar.Text) <> '' then
      QCampoPlantioCons.SetVariable('CULTIVAR',Trim(MECultivar.Text))
    else
      QCampoPlantioCons.SetVariable('CULTIVAR',null);
    QCampoPlantioCons.Open;
  End;
end;

end.

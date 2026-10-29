unit UReposicaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFReposicaoCons = class(TFTConsulta)
    MEPromotor: TMaskEdit;
    MECadastro: TMaskEdit;
    Label2: TLabel;
    MEData_I: TMaskEdit;
    MEData_F: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    BTPromotorCons: TBitBtn;
    BTCadastroCons: TBitBtn;
    procedure BTPromotorConsClick(Sender: TObject);
    procedure BTCadastroConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReposicaoCons: TFReposicaoCons;

implementation

uses UPromoto_cl, UPromotorCons, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFReposicaoCons.BTPromotorConsClick(Sender: TObject);
begin
  inherited;
  If FPromotorCons = Nil then
    FPromotorCons := TFPromotorCons.Create(Application);
  If FPromotorCons.ShowModal = mrOk then
    MEPromotor.text := DMPromotor.QPromotorConsCod_Promotor.Text;
end;

procedure TFReposicaoCons.BTCadastroConsClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    MECadastro.text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFReposicaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPromotor do
  Begin
    QReposicaoCons.Close;

    if trim(MECadastro.text) <> '' then
      QReposicaoCons.SetVariable('COD_CADASTRO',Trim(MECadastro.Text))
    else
      QReposicaoCons.SetVariable('COD_CADASTRO',null);

    if trim(MEPromotor.text) <> '' then
      QReposicaoCons.SetVariable('COD_PROMOTOR',Trim(MEPromotor.Text))
    else
      QReposicaoCons.SetVariable('COD_PROMOTOR',null);

    if trim(MEData_I.Text) <> '' then
      QReposicaoCons.SetVariable('DATA_I',Trim(MEData_I.Text))
    else
      QReposicaoCons.SetVariable('DATA_I',null);

    if trim(MEData_F.Text) <> '' then
      QReposicaoCons.SetVariable('DATA_F',Trim(MEData_F.Text))
    else
      QReposicaoCons.SetVariable('DATA_F',null);

    QReposicaoCons.Open;
  End;
end;

end.

unit UDespesaAntecipadaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFDespesaAntecipadaCons = class(TFTConsulta)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    MEData_I: TMaskEdit;
    Label3: TLabel;
    MEData_F: TMaskEdit;
    SBFilial: TSpeedButton;
    Label4: TLabel;
    MECadastro: TMaskEdit;
    SBCadastro: TSpeedButton;
    procedure SBFilialClick(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDespesaAntecipadaCons: TFDespesaAntecipadaCons;

implementation

uses UDespesaAntecipada_cl, UFilialCons, UFilial_cl, UCadastroCons,
  UCadastro_cl;

{$R *.DFM}

procedure TFDespesaAntecipadaCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    METexto.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

procedure TFDespesaAntecipadaCons.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    MECadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFDespesaAntecipadaCons.FormActivate(Sender: TObject);
begin
  inherited;
  MEData_I.Text := DateToStr(Date-60);
  MEData_F.Text := DateToStr(Date);
end;

procedure TFDespesaAntecipadaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMDespesaAntecipada do
  begin
    QDespesaAntecipadaCons.Close;
    if Trim(METexto.Text) <> '' then
      QDespesaAntecipadaCons.SetVariable('FILIAL',Trim(METexto.Text))
    else
      QDespesaAntecipadaCons.SetVariable('FILIAL',NULL);
    if Trim(MECadastro.Text) <> '' then
      QDespesaAntecipadaCons.SetVariable('CADASTRO',Trim(MECadastro.Text))
    else
      QDespesaAntecipadaCons.SetVariable('CADASTRO',NULL);
    QDespesaAntecipadaCons.SetVariable('DATA_I',Trim(MEData_I.Text));
    QDespesaAntecipadaCons.SetVariable('DATA_F',Trim(MEData_F.Text));
    QDespesaAntecipadaCons.Open;
  end;
end;

end.

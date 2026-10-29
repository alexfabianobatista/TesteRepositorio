unit UMenuObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls;

type
  TFMenuObra = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    CadastrodeObra1: TMenuItem;
    CadastroRequisio1: TMenuItem;
    CadastroContrato1: TMenuItem;
    CadastroMovimentoMquinas1: TMenuItem;
    CadastrodeManutenodeObra1: TMenuItem;
    CadastrodeRevisodeMquinas1: TMenuItem;
    CadastrodeCondomnio1: TMenuItem;
    CadastrodeImvel1: TMenuItem;
    CadastroContratoLocatrio1: TMenuItem;
    CadastroContratoLocador1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastrodeObra1Click(Sender: TObject);
    procedure CadastroRequisio1Click(Sender: TObject);
    procedure CadastroContrato1Click(Sender: TObject);
    procedure CadastroMovimentoMquinas1Click(Sender: TObject);
    procedure CadastrodeManutenodeObra1Click(Sender: TObject);
    procedure CadastrodeRevisodeMquinas1Click(Sender: TObject);
    procedure CadastrodeCondomnio1Click(Sender: TObject);
    procedure CadastrodeImvel1Click(Sender: TObject);
    procedure CadastroContratoLocatrio1Click(Sender: TObject);
    procedure CadastroContratoLocador1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuObra: TFMenuObra;

implementation

uses UObraCad, UTela_cl, UObra_Requisicao_Cab, UObraContrato_Cad,
  UMaquinaMovCad, UMaquinaManuCad, UMaquinaRevCad, UCondominio_Cad,
  UImovel_Cad, UContratoLocatario_Cad, UContratoLocador_Cad;

{$R *.DFM}

procedure TFMenuObra.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'OBRA';
end;

procedure TFMenuObra.CadastrodeObra1Click(Sender: TObject);
begin
  inherited;
  If FObraCad = Nil then
    FObraCad := TFObraCad.Create(Application);
  DMTela.VerificaTela(pModulo,FObraCad.Caption,FObraCad.Name);
  FObraCad.ShowModal;
end;

procedure TFMenuObra.CadastroRequisio1Click(Sender: TObject);
begin
  inherited;
  If FObra_Requisicao_Cab = Nil then
    FObra_Requisicao_Cab := TFObra_Requisicao_Cab.Create(Application);
  DMTela.VerificaTela(pModulo,FObra_Requisicao_Cab.Caption,FObra_Requisicao_Cab.Name);
  FObra_Requisicao_Cab.ShowModal;

end;

procedure TFMenuObra.CadastroContrato1Click(Sender: TObject);
begin
  inherited;
  If FObraContrato_Cad = Nil then
    FObraContrato_Cad := TFObraContrato_Cad.Create(Application);
  DMTela.VerificaTela(pModulo,FObraContrato_Cad.Caption,FObraContrato_Cad.Name);
  FObraContrato_Cad.ShowModal;
end;

procedure TFMenuObra.CadastroMovimentoMquinas1Click(Sender: TObject);
begin
  inherited;
  if FMaquinaMovCad = nil then
    FMaquinaMovCad := TFMaquinaMovCad.Create(Application);
  DMTela.VerificaTela(pModulo,FMaquinaMovCad.Caption,FMaquinaMovCad.Name);
  FMaquinaMovCad.showModal;
end;

procedure TFMenuObra.CadastrodeManutenodeObra1Click(Sender: TObject);
begin
  inherited;
  if FMaquinaManuCad = nil then
    FMaquinaManuCad := TFMaquinaManuCad.Create(Application);
  DMTela.VerificaTela(pModulo,FMaquinaManuCad.Caption,FMaquinaManuCad.Name);
  FMaquinaManuCad.showModal;
end;

procedure TFMenuObra.CadastrodeRevisodeMquinas1Click(Sender: TObject);
begin
  inherited;
  if FMaquinaRevCad = nil then
    FMaquinaRevCad := TFMaquinaRevCad.Create(Application);
  DMTela.VerificaTela(pModulo,FMaquinaRevCad.Caption,FMaquinaRevCad.Name);
  FMaquinaRevCad.showModal;
end;

procedure TFMenuObra.CadastrodeCondomnio1Click(Sender: TObject);
begin
  inherited;
  If FCondominio_Cad = Nil then
    FCondominio_Cad := TFCondominio_Cad.Create(Application);
  DMTela.VerificaTela(pModulo,FCondominio_Cad.Caption,FCondominio_Cad.Name);
  FCondominio_Cad.ShowModal;

end;

procedure TFMenuObra.CadastrodeImvel1Click(Sender: TObject);
begin
  inherited;
  If FImovel_Cad = Nil then
    FImovel_Cad := TFImovel_Cad.Create(Application);
  DMTela.VerificaTela(pModulo,FImovel_Cad.Caption,FImovel_Cad.Name);
  FImovel_Cad.ShowModal;

end;

procedure TFMenuObra.CadastroContratoLocatrio1Click(Sender: TObject);
begin
  inherited;
  If FContratoLocatario_Cad = Nil then
    FContratoLocatario_Cad := TFContratoLocatario_Cad.Create(Application);
  DMTela.VerificaTela(pModulo,FContratoLocatario_Cad.Caption,FContratoLocatario_Cad.Name);
  FContratoLocatario_Cad.ShowModal;

end;

procedure TFMenuObra.CadastroContratoLocador1Click(Sender: TObject);
begin
  inherited;
  If FContratoLocador_Cad = Nil then
    FContratoLocador_Cad := TFContratoLocador_Cad.Create(Application);
  DMTela.VerificaTela(pModulo,FContratoLocador_Cad.Caption,FContratoLocador_Cad.Name);
  FContratoLocador_Cad.ShowModal;

end;

end.

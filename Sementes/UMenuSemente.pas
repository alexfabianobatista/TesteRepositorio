unit UMenuSemente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMenuPrincipal, Menus, Buttons, ExtCtrls;

type
  TFMenuSemente = class(TFTMenuPrincipal)
    Manutenao1: TMenuItem;
    CadastroClassePlantio1: TMenuItem;
    CadastroPlantioSafra1: TMenuItem;
    CadastroCampoPlantio1: TMenuItem;
    CadastroMetaEstimativa1: TMenuItem;
    CadastroreaCultivar1: TMenuItem;
    LaudoFlorao1: TMenuItem;
    LaudoPrColheita1: TMenuItem;
    N1: TMenuItem;
    CadastroPrevisoColheita1: TMenuItem;
    CadastroDoena1: TMenuItem;
    CadastrodeProduo1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    CadastroLoteSemente1: TMenuItem;
    CadastroAtestado1: TMenuItem;
    N4: TMenuItem;
    CadastroFuncionrio1: TMenuItem;
    CadastroEstimativaPProduto1: TMenuItem;
    N5: TMenuItem;
    CadastrodeLaudodeVistoria1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastroClassePlantio1Click(Sender: TObject);
    procedure CadastroPlantioSafra1Click(Sender: TObject);
    procedure CadastroCampoPlantio1Click(Sender: TObject);
    procedure CadastroMetaEstimativa1Click(Sender: TObject);
    procedure CadastroreaCultivar1Click(Sender: TObject);
    procedure LaudoFlorao1Click(Sender: TObject);
    procedure LaudoPrColheita1Click(Sender: TObject);
    procedure CadastroPrevisoColheita1Click(Sender: TObject);
    procedure CadastroDoena1Click(Sender: TObject);
    procedure CadastrodeProduo1Click(Sender: TObject);
    procedure CadastroLoteSemente1Click(Sender: TObject);
    procedure CadastroAtestado1Click(Sender: TObject);
    procedure CadastroFuncionrio1Click(Sender: TObject);
    procedure CadastroEstimativaPProduto1Click(Sender: TObject);
    procedure CadastrodeLaudodeVistoria1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuSemente: TFMenuSemente;

implementation

uses UTela_cl, UCultivarCad, UClassePlantioCad, UPlantioSafraCad,
  UCampoPlantioCad, UEstimativaMetaCad, USementeParam, UEstimativaMeta_cl,
  URDadosGerais, UAreaCultivarCad, ULaudoFloracaoCad, ULaudoPreColheitaCad,
  UPrevisaoColheitaCad, UPrevisaoLaudoCad, UDoencaCad, UProducaoSementeCad,
  ULoteSementeCad, UAtestadoCad, UFuncionarioCad, UEstimativaProduto_Cad,
  ULaudoVistoriaCad;

{$R *.DFM}

procedure TFMenuSemente.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:='SEMENTES';
end;

procedure TFMenuSemente.CadastroClassePlantio1Click(Sender: TObject);
begin
  inherited;
  If FClassePlantioCad = Nil then
    FClassePlantioCad := TFClassePlantioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FClassePlantioCad.Caption,FClassePlantioCad.Name);
  FClassePlantioCad.ShowModal;
end;

procedure TFMenuSemente.CadastroPlantioSafra1Click(Sender: TObject);
begin
  inherited;
   If FPlantioSafraCad = Nil then
    FPlantioSafraCad := TFPlantioSafraCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPlantioSafraCad.Caption,FPlantioSafraCad.Name);
  FPlantioSafraCad.ShowModal;
end;

procedure TFMenuSemente.CadastroCampoPlantio1Click(Sender: TObject);
begin
  inherited;
  If FCampoPlantioCad = Nil then
    FCampoPlantioCad := TFCampoPlantioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCampoPlantioCad.Caption,FCampoPlantioCad.Name);
  FCampoPlantioCad.ShowModal;
end;

procedure TFMenuSemente.CadastroMetaEstimativa1Click(Sender: TObject);
begin
  inherited;
  If FEstimativaMetaCad = Nil then
    FEstimativaMetaCad := TFEstimativaMetaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FEstimativaMetaCad.Caption,FEstimativaMetaCad.Name);
  FEstimativaMetaCad.ShowModal;
end;

procedure TFMenuSemente.CadastroreaCultivar1Click(Sender: TObject);
begin
  inherited;
  If  FAreaCultivarCad = Nil then
    FAreaCultivarCad := TFAreaCultivarCad.Create(Application);
  DMTela.VerificaTela(pModulo,FAreaCultivarCad.Caption,FAreaCultivarCad.Name);
  FAreaCultivarCad.ShowModal;
end;

procedure TFMenuSemente.LaudoFlorao1Click(Sender: TObject);
begin
  inherited;
  If FLaudoFloracaoCad = Nil then
    FLaudoFloracaoCad := TFLaudoFloracaoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FLaudoFloracaoCad.Caption,FLaudoFloracaoCad.Name);
  FLaudoFloracaoCad.ShowModal;
end;

procedure TFMenuSemente.LaudoPrColheita1Click(Sender: TObject);
begin
  inherited;
   If FLaudoPreColheitaCad = Nil then
    FLaudoPreColheitaCad := TFLaudoPreColheitaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FLaudoPreColheitaCad.Caption,FLaudoPreColheitaCad.Name);
  FLaudoPreColheitaCad.ShowModal;
end;

procedure TFMenuSemente.CadastroPrevisoColheita1Click(Sender: TObject);
begin
  inherited;
  If FPrevisaoLaudoCad = Nil then
    FPrevisaoLaudoCad := TFPrevisaoLaudoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPrevisaoLaudoCad.Caption,FPrevisaoLaudoCad.Name);
  FPrevisaoLaudoCad.ShowModal;
end;

procedure TFMenuSemente.CadastroDoena1Click(Sender: TObject);
begin
  inherited;
  If  FDoencaCad = Nil then
    FDoencaCad := TFDoencaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FDoencaCad.Caption,FDoencaCad.Name);
  FDoencaCad.ShowModal;

end;

procedure TFMenuSemente.CadastrodeProduo1Click(Sender: TObject);
begin
  inherited;
  If FProducaoSementeCad = Nil then
    FProducaoSementeCad := TFProducaoSementeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FProducaoSementeCad.Caption,FProducaoSementeCad.Name);
  FProducaoSementeCad.ShowModal;
end;

procedure TFMenuSemente.CadastroLoteSemente1Click(Sender: TObject);
begin
  inherited;
  If FLoteSementeCad = Nil then
    FLoteSementeCad := TFLoteSementeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FLoteSementeCad.Caption,FLoteSementeCad.Name);
  FLoteSementeCad.ShowModal;
end;

procedure TFMenuSemente.CadastroAtestado1Click(Sender: TObject);
begin
  inherited;
  If FAtestadoCad = Nil then
    FAtestadoCad := TFAtestadoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FAtestadoCad.Caption,FAtestadoCad.Name);
  FAtestadoCad.ShowModal;
end;

procedure TFMenuSemente.CadastroFuncionrio1Click(Sender: TObject);
begin
  inherited;
  If FFuncionarioCad=Nil then
    FFuncionarioCad:=TFFuncionarioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFuncionarioCad.Caption,FFuncionarioCad.Name);
  FFuncionarioCad.ShowModal;
end;

procedure TFMenuSemente.CadastroEstimativaPProduto1Click(Sender: TObject);
begin
  inherited;
  If FEstimativaProduto_Cad = Nil then
    FEstimativaProduto_Cad := TFEstimativaProduto_Cad.Create(Application);
  DMTela.VerificaTela(pModulo,FEstimativaProduto_Cad.Caption,FEstimativaProduto_Cad.Name);
  FEstimativaProduto_Cad.ShowModal;
End;

procedure TFMenuSemente.CadastrodeLaudodeVistoria1Click(Sender: TObject);
begin
  inherited;
  If FLaudoVistoriaCad = Nil then
    FLaudoVistoriaCad := TFLaudoVistoriaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FLaudoVistoriaCad.Caption,FLaudoVistoriaCad.Name);
  FLaudoVistoriaCad.ShowModal; 

end;

end.

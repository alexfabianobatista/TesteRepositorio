unit UMenuAssitencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuAssistencia = class(TFTMenuPrincipal)
    OrdemdeServio1: TMenuItem;
    OrdemdeServio2: TMenuItem;
    CadastroContratos1: TMenuItem;
    CadastrodePeas1: TMenuItem;
    ContratoFornecedor1: TMenuItem;
    CadastroVeculo1: TMenuItem;
    CadastrodeTipodeContrato1: TMenuItem;
    CadastrodeEquipamento1: TMenuItem;
    CadastroModelodeVeculo1: TMenuItem;
    CadastrodeFabricante1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure OrdemdeServio2Click(Sender: TObject);
    procedure CadastroContratos1Click(Sender: TObject);
    procedure CadastrodePeas1Click(Sender: TObject);
    procedure ContratoFornecedor1Click(Sender: TObject);
    procedure CadastroVeculo1Click(Sender: TObject);
    procedure CadastrodeTipodeContrato1Click(Sender: TObject);
    procedure CadastrodeEquipamento1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CadastroModelodeVeculo1Click(Sender: TObject);
    procedure CadastrodeFabricante1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuAssistencia: TFMenuAssistencia;

implementation

uses UOrdemServicoCad, UTela_cl, UContratoMensalCad, UPecasMesCad, UVeiculoFabricanteCad,
  UContratoFornecedorCad, UVeiculoCad, UTipoContratoCad, UEquipamentoCad,
  UParamSistema_cl, UVeiculoModeloCad;

{$R *.DFM}

procedure TFMenuAssistencia.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'ASSISTENCIA TECNICA';

end;

procedure TFMenuAssistencia.OrdemdeServio2Click(Sender: TObject);
begin
  inherited;
  If FOrdemServicoCad = Nil then
    FOrdemServicoCad := TFOrdemServicoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FOrdemServicoCad.Caption,FOrdemServicoCad.Name);
  FOrdemServicoCad.ShowModal;
end;

procedure TFMenuAssistencia.CadastroContratos1Click(Sender: TObject);
begin
  inherited;
  If FContratoMensalCad = Nil then
    FContratoMensalCad := TFContratoMensalCad.Create(Application);
  DMTela.VerificaTela(pModulo,FContratoMensalCad.Caption,FContratoMensalCad.Name);
  FContratoMensalCad.ShowModal;
end;

procedure TFMenuAssistencia.CadastrodePeas1Click(Sender: TObject);
begin
  inherited;
  If FPecasMesCad = Nil then
    FPecasMesCad := TFPecasMesCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPecasMesCad.Caption,FPecasMesCad.Name);
  FPecasMesCad.ShowModal;
end;

procedure TFMenuAssistencia.ContratoFornecedor1Click(Sender: TObject);
begin
  inherited;
  if FContratoFornecedorCad = Nil then
    FContratoFornecedorCad := TFContratoFornecedorCad.Create(Application);
  FContratoFornecedorCad.ShowModal();
end;

procedure TFMenuAssistencia.CadastroVeculo1Click(Sender: TObject);
begin
  inherited;
  if FVeicCad = Nil then
    FVeicCad := TFVeicCad.Create(Application);
  FVeicCad.ShowModal();
end;
procedure TFMenuAssistencia.CadastrodeTipodeContrato1Click(
  Sender: TObject);
begin
  inherited;
  if FTipoContratoCad = Nil then
    FTipoContratoCad := TFTipoContratoCad.Create(Application);
  FTipoContratoCad.ShowModal();
end;

procedure TFMenuAssistencia.CadastrodeEquipamento1Click(Sender: TObject);
begin
  inherited;
  if FEquipamentoCad = Nil then
    FEquipamentoCad := TFEquipamentoCad.Create(Application);
  FEquipamentoCad.ShowModal();
end;

procedure TFMenuAssistencia.FormActivate(Sender: TObject);
begin
  inherited;
  DMParamSistema.QParamSistema.Open;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'RETIFOZ') then
  begin
    CadastrodeEquipamento1.Visible := false;
    CadastrodeEquipamento1.Enabled := false;
  end;
end;

procedure TFMenuAssistencia.CadastroModelodeVeculo1Click(Sender: TObject);
begin
  inherited;
  if FVeiculoModeloCad = Nil then
    FVeiculoModeloCad := TFVeiculoModeloCad.Create(Application);
  FVeiculoModeloCad.ShowModal();
end;

procedure TFMenuAssistencia.CadastrodeFabricante1Click(Sender: TObject);
begin
  inherited;
  if FVeiculoFabricanteCad = Nil then
    FVeiculoFabricanteCad := TFVeiculoFabricanteCad.Create(Application);
  DMTela.VerificaTela(pModulo,FVeiculoFabricanteCad.Caption,FVeiculoFabricanteCad.Name);
  FVeiculoFabricanteCad.ShowModal();
end;

end.

unit UVeiculoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus;

type
  TFVeiculoCons = class(TFTConsulta)
    Label2: TLabel;
    SBModelo: TSpeedButton;
    Label3: TLabel;
    SBProprietario: TSpeedButton;
    CBTipo: TComboBox;
    Label4: TLabel;
    RGClassificacao: TRadioGroup;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    SBMotorista: TSpeedButton;
    RGAtivo: TRadioGroup;
    MEModelo: TMaskEdit;
    MEFabricante: TMaskEdit;
    MEProprietario: TMaskEdit;
    MEMotorista: TMaskEdit;
    MeNumChassi: TMaskEdit;
    Label7: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBModeloClick(Sender: TObject);
    procedure SBProprietarioClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SBMotoristaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoCons: TFVeiculoCons;

implementation

uses UVeiculo_cl, UVeiculoModeloCons, UVeiculoModelo_cl, UCadastroCons,
  UCadastro_cl, UVeiculoFabricanteCons, UVeiculoFabricante_cl,
  UParamSistema_cl;

{$R *.DFM}

procedure TFVeiculoCons.BtProcurarClick(Sender: TObject);
var
  wPlaca: String;
begin
  inherited;
  with DMVeiculo do
  begin
    QVeiculoCons.Close;
    if (DMParamSistema.CodEmpresa = 'ALIANCA') then //or (DMParamSistema.CodEmpresa = 'PATELI') then
    begin
     if (METexto.text = '') then
         METexto.Text := '%'
    end;

    if (Trim(METexto.Text) <> '-') and (Trim(METexto.Text) <> '') then
    begin
      wPlaca := Trim(METexto.Text);
      if Length(wPlaca) <= 4 then
        wPlaca[4] := ' ';

      QVeiculoCons.SetVariable('NUM_PLACA',Trim(wPlaca)+'%');
    end
    else
      QVeiculoCons.SetVariable('NUM_PLACA',NULL);

    if Trim(MEModelo.Text) <> '' then
      QVeiculoCons.SetVariable('COD_MODELO',Trim(MEModelo.Text))
    else
      QVeiculoCons.SetVariable('COD_MODELO',NULL);
    if Trim(MEFabricante.Text) <> '' then
      QVeiculoCons.SetVariable('COD_FABRICANTE',Trim(MEFabricante.Text))
    else
      QVeiculoCons.SetVariable('COD_FABRICANTE',NULL);
    if Trim(MEProprietario.Text) <> '' then
      QVeiculoCons.SetVariable('COD_PROPRIETARIO',Trim(MEProprietario.Text))
    else
      QVeiculoCons.SetVariable('COD_PROPRIETARIO',NULL);
    if Trim(MEMotorista.Text) <> '' then
      QVeiculoCons.SetVariable('COD_MOTORISTA',Trim(MEMotorista.Text))
    else
      QVeiculoCons.SetVariable('COD_MOTORISTA',NULL);
    if Trim(CBTipo.Text) = 'TODOS' then
      QVeiculoCons.SetVariable('TIPO',NULL)
    else
      QVeiculoCons.SetVariable('TIPO',Trim(CBTipo.Text));
    if MeNumChassi.Text <> '' then
      QVeiculoCons.SetVariable('NUM_CHASSI','%' + Trim(MeNumChassi.Text) + '%')
    else
      QVeiculoCons.SetVariable('NUM_CHASSI',null);
    if RGClassificacao.ItemIndex = 0 then
      QVeiculoCons.SetVariable('CLASSIFICACAO',NULL)
    else if RGClassificacao.ItemIndex = 1 then
      QVeiculoCons.SetVariable('CLASSIFICACAO','FROTA')
    else if RGClassificacao.ItemIndex = 2 then
      QVeiculoCons.SetVariable('CLASSIFICACAO','TERCEIRO')
    else if RGClassificacao.ItemIndex = 3then
      QVeiculoCons.SetVariable('CLASSIFICACAO','OUTROS');

    if RGAtivo.ItemIndex = 0 then
       QVeiculoCons.SetVariable('IND_BAIXA',null);
    if RGAtivo.ItemIndex = 1 then
       QVeiculoCons.SetVariable('IND_BAIXA','ATIVO');
    if RGAtivo.ItemIndex = 2 then
       QVeiculoCons.SetVariable('IND_BAIXA','BAIXADO');

    QVeiculoCons.SetVariable('COD_VEICULO',NULL);

    QVeiculoCons.Open;
  end;
end;

procedure TFVeiculoCons.SBModeloClick(Sender: TObject);
begin
  inherited;
  if FVeiculoModeloCons = nil then
    FVeiculoModeloCons := TFVeiculoModeloCons.Create(Application);
  if FVeiculoModeloCons.showModal = mrOk then
    MEModelo.Text := DMVeiculoModelo.QVeiculoModeloConsCOD_MODELO.Text;
end;

procedure TFVeiculoCons.SBProprietarioClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.showModal = mrOk then
    MEProprietario.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFVeiculoCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FVeiculoFabricanteCons = nil then
    FVeiculoFabricanteCons := TFVeiculoFabricanteCons.Create(Application);
  if FVeiculoFabricanteCons.showModal = mrOk then
    MEFabricante.Text := DMVeiculoFabricante.QVeiculoFabricanteConsCOD_FABRICANTE.Text;
end;

procedure TFVeiculoCons.SBMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.showModal = mrOk then
    MEMotorista.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFVeiculoCons.FormActivate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa <> 'ALIANCA') and (DMParamSistema.CodEmpresa <> 'PATELI') and
     (DMParamSistema.CodEmpresa <> 'FURGOESMED') then
     METexto.EditMask :=  'lll\-9c99;1;_';//'lll-9C99';    //'>lll\-9C99;1;_'; 

end;

end.

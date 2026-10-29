unit UVeiculoConhecimentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, DBCtrls,
  ExtCtrls, variants, Menus;

type
  TFVeiculoConhecimentoCons = class(TFTConsulta)
    EDCodProprietario: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    EdProprietario: TEdit;
    Label3: TLabel;
    EdPlaca: TEdit;
    RGTipoPropriedade: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EDCodProprietarioChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoConhecimentoCons: TFVeiculoConhecimentoCons;

implementation

uses UVeiculoConhecimento_cl, UProprietario_cl, UProprietarioCons, UOracle_cl;

{$R *.DFM}

procedure TFVeiculoConhecimentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMVeiculoConhecimento do
  Begin
    QVeiculoCons.Close;
    if MeTexto.text = '' then
       QVeiculoCons.SetVariable('Descricao', Null)
    else
       QVeiculoCons.SetVariable('Descricao',METexto.Text);

    if EDCodProprietario.text = '' then
      QVeiculoCons.SetVariable('Cod_proprietario',Null)
    else
      QVeiculoCons.SetVariable('Cod_proprietario',EdCodProprietario.Text);
    if EdPlaca.text = '' then
      QVeiculoCons.SetVariable('Desc_Placa',Null)
    else
      QVeiculoCons.SetVariable('Desc_Placa',EdPlaca.Text);
    //Case RgTipoVeiculo.ItemIndex of
//      0 : QVeiculoCons.SetVariable('Desc_Tipo_Veiculo','CAVALO');
//      1 : QVeiculoCons.SetVariable('Desc_Tipo_Veiculo','CARRETA');
//      2 : QVeiculoCons.SetVariable('Desc_Tipo_Veiculo','OUTROS');
//      3 : QVeiculoCons.SetVariable('Desc_Tipo_Veiculo',Null);
//    End;
   {case RGTipoPropriedade.ItemIndex of
        0: QVeiculoCons.SetVariable('IND_TIPO_PROPRIEDADE','P');
        1: QVeiculoCons.SetVariable('IND_TIPO_PROPRIEDADE','T');
        2: QVeiculoCons.SetVariable('IND_TIPO_PROPRIEDADE', null);
   end;}
   QVeiculoCons.Open;
  End;
end;

procedure TFVeiculoConhecimentoCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FProprietarioCons = nil then
     FProprietarioCons:=TFProprietarioCons.create(application);
  if FProprietarioCons.showmodal = mrOk then
     edcodProprietario.text := inttostr(DMProprietario.QProprietarioConsCod_Proprietario.value);
end;

procedure TFVeiculoConhecimentoCons.EDCodProprietarioChange(Sender: TObject);
begin
  inherited;
  If EdCodProprietario.Text <> '' Then
     EdProprietario.Text := DMOracle.BuscaNome('SELECT Nome FROM TB_PROPRIETARIO','COD_PROPRIETARIO = '+EdCodProprietario.Text);

end;

end.

unit UPropriedadeCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, variants;

type
  TFPropriedadeCons = class(TFTConsulta)
    BtConsCadastro: TBitBtn;
    MECadastro: TMaskEdit;
    Label5: TLabel;
    RgPropria: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPropriedadeCons: TFPropriedadeCons;

implementation

uses UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFPropriedadeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMCadastro do
  Begin
    QPropriedadeCons.Close;
    If Trim(METexto.Text) = '' Then
       QPropriedadeCons.SetVariable('DESC_PROPRIEDADE',Null)
    else
       QPropriedadeCons.SetVariable('DESC_PROPRIEDADE',Trim(METexto.Text));
    If Trim(MECadastro.Text) <> '' Then
      QPropriedadeCons.SetVariable('COD_CADASTRO',StrToInt(Trim(MECadastro.Text)))
    Else
      QPropriedadeCons.SetVariable('COD_CADASTRO',Null);
    Case RgPropria.ItemIndex of
      0 : QPropriedadeCons.SetVariable('IND_TIPO_IMOVEL','SIM');
      1 : QPropriedadeCons.SetVariable('IND_TIPO_IMOVEL','NAO');
      2 : QPropriedadeCons.SetVariable('IND_TIPO_IMOVEL',Null);
    End;
    QPropriedadeCons.Open;
  End;
end;


procedure TFPropriedadeCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    MECadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

end.

unit UContratoJornalParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmDatas,
  UFmVendedor, UFmCadastro, UFmFilial, Mask;

type
  ITipoProvider = interface
    function getTipos: String;
  end;

  TFContratoJornalParam = class(TFTParametro)
    TSContratoJornalRel: TTabSheet;
    FM0Filial: TFmFilial;
    FM0Cadastro: TFmCadastro;
    FM0Vendedor: TFmVendedor;
    FM0DtContrato: TFmDatas;
    FM0DtVencimento: TFmDatas;
    RG0Situacao: TRadioGroup;
    Label1: TLabel;
    ME0Edicao: TMaskEdit;
    RG0SituacaoCR: TRadioGroup;
    Label2: TLabel;
    ME0ComEdicao: TMaskEdit;
    CB0Tipo: TComboBox;
    Label3: TLabel;
    procedure TSContratoJornalRelShow(Sender: TObject);
  private
    FTipoProvider: ITipoProvider;
  public
    property TipoProvider: ITipoProvider read FTipoProvider write FTipoProvider;
  end;

var
  FContratoJornalParam: TFContratoJornalParam;

implementation

{$R *.dfm}

procedure TFContratoJornalParam.TSContratoJornalRelShow(Sender: TObject);
begin
  inherited;
  if TipoProvider <> nil then
    CB0Tipo.Items.Text := TipoProvider.getTipos;
end;

end.

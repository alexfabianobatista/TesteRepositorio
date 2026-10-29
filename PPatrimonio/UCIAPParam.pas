unit UCIAPParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls, DBDirceu,
  Mask;

type
  TFCIAPParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    SBPatrimonio: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ME0CodPatrimonioItem: TMaskEdit;
    edt0Patrimonio: TEdit;
    edt0filial: TEdit;
    edt0Localizacao: TEdit;
    edt0resposavel: TEdit;
    GroupBox2: TGroupBox;
    ME0DtInicio: TMaskEdit;
    ME0DtFim: TMaskEdit;
    Label1: TLabel;
    Label11: TLabel;
    ME0ValorCredito: TMaskEdit;
    Label2: TLabel;
    procedure SBPatrimonioClick(Sender: TObject);
    procedure ME0CodPatrimonioItemExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCIAPParam: TFCIAPParam;

implementation

uses UPatrimonioItensCons, UOracle_cl, UPatrimonio_cl;

{$R *.DFM}

procedure TFCIAPParam.SBPatrimonioClick(Sender: TObject);
begin
  inherited;
  if FPatrimonioItensCons = nil then
    FPatrimonioItensCons := TFPatrimonioItensCons.create(application);

  if FPatrimonioItensCons.showmodal = mrok then
  begin
    ME0CodPatrimonioItem.Text := DMPatrimonio.QPatrimonioItemConsCOD_PATRIMONIO_ITEM.Text;
    ME0CodPatrimonioItemExit(Sender);
  end;
end;

procedure TFCIAPParam.ME0CodPatrimonioItemExit(Sender: TObject);
begin
  inherited;
  if trim(ME0CodPatrimonioItem.Text) <> '' then
  begin
    edt0Patrimonio.Text  := DMOracle.BuscaNome('SELECT TP.DESC_PRODUTO FROM TB_PATRIMONIO_ITEM TPI, TB_PRODUTO TP', 'TPI.COD_PRODUTO = TP.COD_PRODUTO AND TPI.COD_PATRIMONIO_ITEM = ' + Trim(ME0CodPatrimonioItem.Text));
    edt0filial.Text      := DMOracle.BuscaNome('SELECT TF.DESC_FILIAL FROM TB_PATRIMONIO_ITEM TPI, TB_FILIAL TF', 'TPI.COD_FILIAL = TF.COD_FILIAL AND TPI.COD_PATRIMONIO_ITEM = ' + Trim(ME0CodPatrimonioItem.Text));
    edt0Localizacao.Text := DMOracle.BuscaNome('SELECT TL.DESC_LOCALIZACAO FROM TB_PATRIMONIO_ITEM TPI, TB_LOCALIZACAO TL', 'TPI.COD_LOCALIZACAO = TL.COD_LOCALIZACAO AND TPI.COD_PATRIMONIO_ITEM = ' + Trim(ME0CodPatrimonioItem.Text));
    edt0resposavel.Text  := DMOracle.BuscaNome('SELECT TU.NOME FROM TB_PATRIMONIO_ITEM TPI, TB_USUARIO TU', 'TPI.COD_USUARIO = TU.COD_USUARIO AND TPI.COD_PATRIMONIO_ITEM = ' + Trim(ME0CodPatrimonioItem.Text));
  end
  else
  begin
    edt0Patrimonio.Text  := '';
    edt0filial.Text      := '';
    edt0Localizacao.Text := '';
    edt0resposavel.Text  := '';
  end;
end;

end.

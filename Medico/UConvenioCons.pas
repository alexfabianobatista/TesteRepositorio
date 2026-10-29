unit UConvenioCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TFConvenioCons = class(TFTConsulta)
    Bevel1: TBevel;
    MeCodigo: TMaskEdit;
    LblCodigo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConvenioCons: TFConvenioCons;

implementation

uses UConvenio_cl, Math;

{$R *.dfm}

procedure TFConvenioCons.FormCreate(Sender: TObject);
begin
  inherited;
  DSConsulta.DataSet := DMConvenio.QConvenioCons;
end;

procedure TFConvenioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  //Processamento da Consulta
  //-------------------------
  with DMConvenio do
  begin
    QConvenioCons.Close;

    //Verifica se DESCRICAO CONVENIO está Preenchido
    if Trim(METexto.Text) <> '' then
      QConvenioCons.SetVariable('CONVENIO', Trim(METexto.Text))
    else
      QConvenioCons.SetVariable('CONVENIO', null);

    //Verifica se CODIGO CONVENIO está Preenchido
    if Trim(MeCodigo.Text) <> '' then
      QConvenioCons.SetVariable('CODIGO', Trim(MeCodigo.Text))
    else
      QConvenioCons.SetVariable('CODIGO', null);

    QConvenioCons.Open;
  end;
end;

end.

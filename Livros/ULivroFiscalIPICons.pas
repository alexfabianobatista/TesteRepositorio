unit ULivroFiscalIPICons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, Grids, DBGrids, Db, variants, ExtCtrls;

type
  TFLivroFiscalIPICons = class(TForm)
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    BtProcurar: TBitBtn;
    METexto: TMaskEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DSConsulta: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    MEAno: TMaskEdit;
    MEMes: TMaskEdit;
    RgDecendio: TRadioGroup;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLivroFiscalIPICons: TFLivroFiscalIPICons;

implementation

uses ULivroFiscalIPI_cl, UUsuario_cl;

{$R *.DFM}

procedure TFLivroFiscalIPICons.DBGrid1DblClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TFLivroFiscalIPICons.FormActivate(Sender: TObject);
begin
  //DSConsulta.DataSet.Close;
  //DSConsulta.DataSet.Open;
  if (METexto.Enabled) and (METexto.Visible) then
    METexto.SetFocus;
end;

procedure TFLivroFiscalIPICons.BtProcurarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario(Trim(METexto.Text), 'LIVRO FISCAL');
  with DMLivroFiscalIPI do
  begin
    QLivroFiscalIPICons.Close;
    if Trim(METexto.Text) <> '' then
      QLivroFiscalIPICons.SetVariable('FILIAL', METexto.Text)
    else
      QLivroFiscalIPICons.SetVariable('FILIAL', Null);
    if Trim(MEAno.Text) <> '' then
      QLivroFiscalIPICons.SetVariable('ANO', MEAno.Text)
    else
      QLivroFiscalIPICons.SetVariable('ANO', Null);
    if Trim(MEMes.Text) <> '' then
      QLivroFiscalIPICons.SetVariable('MES', MEMes.Text)
    else
      QLivroFiscalIPICons.SetVariable('MES', Null);
    case RgDecendio.ItemIndex of
      0: QLivroFiscalIPICons.SetVariable('DECENDIO', 1);
      1: QLivroFiscalIPICons.SetVariable('DECENDIO', 2);
      2: QLivroFiscalIPICons.SetVariable('DECENDIO', 3);
      3: QLivroFiscalIPICons.SetVariable('DECENDIO', Null);
    end;
    QLivroFiscalIPICons.Open;
  end;
end;

end.


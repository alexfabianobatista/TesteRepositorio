unit UPecasMesCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, DBCtrls, variants,
  UFmClasse;

type
  TFPecasMesCons = class(TFTConsulta)
    MEDt_Inicial: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    MEDt_Final: TMaskEdit;
    FmClasseCons: TFmClasse;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPecasMesCons: TFPecasMesCons;

implementation

uses UPecas_cl, UProdutoCons, UProduto_cl, UPecasMesCad, UOracle_cl,
  UClasseCons, UClasse_cl;

{$R *.DFM}

procedure TFPecasMesCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPecas do
  begin
    QPecasCons.Close;

    If Trim(METexto.Text) = '' Then
      QPecasCons.SetVariable('PECAS',Null)
    Else
      QPecasCons.SetVariable('PECAS',METexto.Text);
    //Frames------------
    If Trim(FmClasseCons.MeClasse.Text) = '' Then
      QPecasCons.SetVariable('CLASSE',Null)
    Else
      QPecasCons.SetVariable('CLASSE',StrToFloat(Trim(FmClasseCons.MeClasse.Text)));
    //-----------------

      QPecasCons.SetVariable('DATA_I',StrToDate(MEDt_Inicial.Text));
      QPecasCons.SetVariable('DATA_F',StrToDate(MEDt_Final.Text));

    QPecasCons.Open;
  end;

end;

procedure TFPecasMesCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDt_Inicial.Text := DateToStr(Date);
  MEDt_Final.Text := DateToStr(Date);

end;

end.

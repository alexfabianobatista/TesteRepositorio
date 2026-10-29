unit UFinalidadeCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, variants,
  Menus, ActnList,UBiblioteca;
  //Wwdatsrc, Wwdbigrd, Wwdbgrid;

type
  TFFinalidadeCons = class(TFTConsulta)
    RgLiberadoUso: TRadioGroup;
    ActionList1: TActionList;
    Action1: TAction;
    RgPagarReceber: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure proc_consulta_finalidade();
    procedure FormActivate(Sender: TObject);
    procedure METextoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFinalidadeCons: TFFinalidadeCons;

implementation

uses UFinalidade_cl, UImpressoraFiscal;

{$R *.DFM}

procedure TFFinalidadeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  proc_consulta_finalidade();
end;

procedure TFFinalidadeCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
     DSConsulta.DataSet := DMFinalidade.QFinalidadeCons;
end;

procedure TFFinalidadeCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
     FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFFinalidadeCons.proc_consulta_finalidade;
var
  wSql: string;
begin
  with DMFinalidade do
  begin
    QFinalidadeCons.Close;
    QFinalidadeCons.SQL.Clear;

    wSql := 'SELECT F.COD_FINALIDADE, F.DESC_FINALIDADE, F.IND_FINALIDADE ' +
            'FROM TB_FINALIDADE F ' +
            'WHERE UPPER(F.DESC_FINALIDADE) LIKE ' + QuotedStr('%' + UpperCase(Trim(METexto.Text)) + '%');

    // Filtro baseado em RgLiberadoUso
    case RgLiberadoUso.ItemIndex of
      0: wSql := wSql + ' AND F.IND_LIBERADO = ' + QuotedStr('SIM');
      1: wSql := wSql + ' AND F.IND_LIBERADO = ' + QuotedStr('NAO');
      2: wSql := wSql + ' AND F.IND_LIBERADO IS NOT NULL';
    end;

    //Adicionado filtro de pagar ou receber na finalidade. Jefferson 16/11/2024
    case RgPagarReceber.ItemIndex of
      1: wSql := wSql + ' AND F.IND_FINALIDADE = ' + QuotedStr('P'); // Pagar
      2: wSql := wSql + ' AND F.IND_FINALIDADE = ' + QuotedStr('R'); // Receber
    end;

    wSql := wSql + ' ORDER BY F.DESC_FINALIDADE';

    QFinalidadeCons.SQL.Add(wSql);
    QFinalidadeCons.Open;
  end;
end;



procedure TFFinalidadeCons.FormActivate(Sender: TObject);
begin
  inherited;
//  FFinalidadeCons.METexto.Text := 'A';
end;

procedure TFFinalidadeCons.METextoChange(Sender: TObject);
begin
  inherited;
  Proc_Consulta_Finalidade;
end;

end.

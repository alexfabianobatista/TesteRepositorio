unit UFilialCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus, ActnList,
  ComCtrls, ExtCtrls;

type
  TFFilialCons = class(TFTConsulta)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    METexto1: TMaskEdit;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    //procedure Proc_Consulta_Filial();
  private
    procedure Proc_Consulta_Filial;
  public
    { Public declarations }
  end;

var
  FFilialCons: TFFilialCons;

implementation

uses UFilial_cl, UParamSistema_cl, UBiblioteca;

{$R *.DFM}

procedure TFFilialCons.BtProcurarClick(Sender: TObject);
begin
  proc_consulta_filial();
end;

procedure TFFilialCons.Proc_Consulta_Filial();
var
  wsql : string;
begin
 with DMFilial do
  begin
    if (FFilialCons.METexto.Text <> '') then
    begin
      QFilialCons.Close;
      QFilialCons.sql.Clear;
      wSql := 'SELECT COD_FILIAL, DESC_FILIAL, NUM_CGC, DESC_INSCRICAO, DESC_ENDERECO, DESC_CIDADE FROM TB_FILIAL ' +
              'WHERE  UPPER(DESC_FILIAL) LIKE ' + char(39) + '%' + UPPERCASE(Trim(FFilialCons.METexto.Text)) + '%' + chr(39);
      if (RadioGroup1.ItemIndex = 1) then
        wSql := wSql + 'AND IND_SITUACAO LIKE ''A'' ';
        wSql := wSql + 'ORDER BY COD_FILIAL ';
      QFilialCons.Sql.add(wSql);
      QFilialCons.Open;
    end;
    if (FFilialCons.METexto1.Text <> '') then
    begin
      QFilialCons.Close;
      QFilialCons.sql.Clear;
      wSql := 'SELECT COD_FILIAL, DESC_FILIAL, NUM_CGC, DESC_INSCRICAO, DESC_ENDERECO, DESC_CIDADE FROM TB_FILIAL ' +
              'WHERE NUM_CGC LIKE '   + chr(39) + '%' + Trim(FFilialCons.METexto1.Text) + '%' + char(39);
      if (RadioGroup1.ItemIndex = 1) then
        wSql := wSql + 'AND IND_SITUACAO LIKE ''A'' ';
        wSql := wSql + 'ORDER BY COD_FILIAL ';
      QFilialCons.Sql.add(wSql);
      QFilialCons.Open;
    end
    else
    begin
      QFilialCons.Close;
      QFilialCons.sql.Clear;
      wSql := 'SELECT COD_FILIAL, DESC_FILIAL, NUM_CGC, DESC_INSCRICAO, DESC_ENDERECO, DESC_CIDADE FROM TB_FILIAL ' +
              'WHERE UPPER(DESC_FILIAL) LIKE ' + char(39) + '%' + Trim(FFilialCons.METexto.Text) + '%' + chr(39);
      if (RadioGroup1.ItemIndex = 1) then
        wSql := wSql + 'AND IND_SITUACAO LIKE ''A'' ';
        wSql := wSql + 'ORDER BY COD_FILIAL ';
      QFilialCons.Sql.add(wSql);
      QFilialCons.Open;
    end;
  end;
end;

procedure TFFilialCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFFilialCons.METextoChange(Sender: TObject);
begin
  inherited;
    Proc_Consulta_Filial;
end;

end.

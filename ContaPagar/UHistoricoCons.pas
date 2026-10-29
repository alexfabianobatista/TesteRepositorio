unit UHistoricoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, variants,
  Menus;

type
  TFHistoricoCons = class(TFTConsulta)
    Label14: TLabel;
    MECodDepto: TMaskEdit;
    SpeedButton8: TSpeedButton;
    MEDepartamento: TMaskEdit;
    Rg_Situacao: TRadioGroup;
    RgTipoOperacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure MECodDeptoExit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure proc_consulta_historico;
    procedure METextoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistoricoCons: TFHistoricoCons;

implementation

uses UHistorico_cl, UOracle_cl, UDepartamentoCons, UDepartamento_cl,
  UParamSistema_cl;

{$R *.DFM}

procedure TFHistoricoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  proc_consulta_historico;

  //With DMHistorico do
//  Begin
//    QHistoricoCons.Close;
//    If Trim(METexto.Text) <> '' then
//      QHistoricoCons.SetVariable('DESC_HISTORICO', '%' + Trim(METexto.Text) + '%')
//    Else
//      QHistoricoCons.SetVariable('DESC_HISTORICO',Null);
//
//    If Trim(MECodDepto.Text) <> '' then
//      QHistoricoCons.SetVariable('COD_DEPARTAMENTO',Trim(MECodDepto.Text))
//    Else
//      QHistoricoCons.SetVariable('COD_DEPARTAMENTO',Null);
//    Case Rg_Situacao.ItemIndex of
//      0 : QHistoricoCons.SetVariable('IND_SITUACAO','SIM');
//      1 : QHistoricoCons.SetVariable('IND_SITUACAO','NAO');
//      2 : QHistoricoCons.SetVariable('IND_SITUACAO',Null);
//    End;
//    Case RgTipoOperacao.ItemIndex of
//      0 : QHistoricoCons.SetVariable('IND_OPERACAO','+');
//      1 : QHistoricoCons.SetVariable('IND_OPERACAO','-');
//      2 : QHistoricoCons.SetVariable('IND_OPERACAO',Null);
//    End;
//    DMHistorico.QHistoricoCons.Open;
//  End;
end;

procedure TFHistoricoCons.MECodDeptoExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodDepto.text) <> '' then
     MEDepartamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO ='+MECodDepto.Text)
  else
     MEDepartamento.Text := 'Todos';
end;

procedure TFHistoricoCons.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
     FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.Showmodal=mrOk then
  Begin
    MECodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    MECodDeptoExit(Self);
  End;
end;

procedure TFHistoricoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMHistorico.QHistoricoCons;
end;

procedure TFHistoricoCons.proc_consulta_historico;
  var
  wsql : string;
begin
  with DMHistorico do
  begin
    QHistoricoCons.Close;
    QHistoricoCons.sql.Clear;

    wSql := 'SELECT H.COD_HISTORICO, H.DESC_HISTORICO, H.IND_OPERACAO, H.IND_EMITE_CHEQUE, ' +
            'H.IND_CONCILIA,H.IND_CUSTOS,H.COD_HISTORICO_CONTABIL, H.COD_CONTABIL_CRED,  ' +
            'H.COD_CONTABIL_DEB, H.NUM_PLANO_CONTA_CAIXA, D.DESC_DEPARTAMENTO, H.COD_DEPARTAMENTO ' +
            'FROM TB_HISTORICO H, TB_DEPARTAMENTO D ' +
            'WHERE H.COD_DEPARTAMENTO = D.COD_DEPARTAMENTO(+) ' +
            'AND UPPER(H.DESC_HISTORICO) LIKE ' + char(39) + '%' + UPPERCASE(Trim(FHistoricoCons.METexto.Text)) + '%' + chr(39);

    case Rg_Situacao.ItemIndex of
      0: wSql := wSql + ' AND H.IND_SITUACAO = '  + QuotedStr('SIM');
      1: wSql := wSql + ' AND H.IND_SITUACAO = '  + QuotedStr('NAO');
      2: wSql := wSql + ' AND H.IND_SITUACAO <> ' + QuotedStr(' ');
    end;

    Case RgTipoOperacao.ItemIndex of
      0 : wSql := wSql + ' AND H.IND_OPERACAO = '  + QuotedStr('+');
      1 : wSql := wSql + ' AND H.IND_OPERACAO = '  + QuotedStr('-');
      2 : wSql := wSql + ' AND H.IND_OPERACAO <> ' + QuotedStr(' ');
    End;

    If Trim(MECodDepto.Text)<> '' then
      wSql := wSql + ' AND H.COD_DEPARTAMENTO = ' + UPPERCASE(Trim(FHistoricoCons.MECodDepto.Text));

    wSql := wSql + ' ORDER BY H.DESC_HISTORICO';

    QHistoricoCons.Sql.add(wSql);
    QHistoricoCons.Open;
  end;
end;

procedure TFHistoricoCons.METextoChange(Sender: TObject);
begin
  inherited;
  proc_consulta_historico;
end;

procedure TFHistoricoCons.FormActivate(Sender: TObject);
begin
  inherited;
//  FHistoricoCons.METexto.Text := 'A';
end;

end.

unit UComposicaoCustosCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, UTCADSIMPLES, DBCtrls, Grids, DBGrids,
  ComCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, ActnList, ImgList, DB, Menus, StdCtrls, Mask, ExtCtrls, Buttons,
  DBDirceu;

type
  TFComposicaoCustosCad = class(TFTCadSimples)
    PCComposicao: TPageControl;
    TabComposicaoCustos: TTabSheet;
    GridComposicaoCustos: TDBGrid;
    DBECodigo: TDBEdit;
    DBEDescComposicaoCusto: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    TabCustoContaReferencial: TTabSheet;
    Label3: TLabel;
    DBAtivo: TDBComboBox;
    DBECodPlanoContaReferencial1: TDBEdit;
    Label8: TLabel;
    BtPlanoContaReferencial1: TBitBtn;
    Label4: TLabel;
    DBECodigo1: TDBEdit;
    Label5: TLabel;
    DBEDescComposicaoCusto2: TDBEdit;
    DSComposicaoContaReferencial: TDataSource;
    DSComposicaoContaGrid: TDataSource;
    DBDNumPlanoContaReferencial1: TDBDirceu;
    DBGCustosContaReferencial: TDBGrid;
    DSGridComposicaoCustos: TDataSource;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure GridComposicaoCustosCellClick(Column: TColumn);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure BtPlanoContaReferencial1Click(Sender: TObject);
    procedure DSComposicaoContaReferencialStateChange(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure DBGCustosContaReferencialCellClick(Column: TColumn);
    procedure MELocalizaExit(Sender: TObject);
    procedure DBECodPlanoContaReferencial1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PCComposicaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComposicaoCustosCad: TFComposicaoCustosCad;

implementation

uses UComposicaoCustosCons, UPlanoContaReferencialCons, UComposicaoCustos_cl,
  UPlanoContaReferencial_cl;

{$R *.dfm}

procedure TFComposicaoCustosCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DsInsert,DsEdit] then
   Begin
    if DSPrimario.State in [DsInsert] then
      DBECodigo.Enabled := true;
    DBAtivo.Enabled := true;
    DBEDescComposicaoCusto.Enabled := true;
   End
  Else
   Begin
     DBECodigo.Enabled := false;
     DBEDescComposicaoCusto.Enabled := false;
     DBAtivo.Enabled := false;
     GridComposicaoCustos.Refresh;
   End;
end;

procedure TFComposicaoCustosCad.FormActivate(Sender: TObject);
begin
  inherited;
  DBECodigo.Enabled := false;
  DBEDescComposicaoCusto.Enabled := false;
  DBAtivo.Enabled := false;
  PCComposicao.ActivePageIndex := 0;

  with DMComposicaoCustos do
  begin
    QComposicaoCustos.Open;
    QComposicaoCustosGrid.Open;
  end;

end;

procedure TFComposicaoCustosCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FComposicaoCustosCons = nil then
    FComposicaoCustosCons := TFComposicaoCustosCons.Create(Application);

  if FComposicaoCustosCons.ShowModal = mrOK then
  begin
    with DMComposicaoCustos do
    begin
      QComposicaoCustos.Close;
      QComposicaoCustos.SetVariable('PK', QComposicaoCustosConsCOD_COMPOSICAO_CUSTOS.Value);
      QComposicaoCustos.Open;
    end;
  end;                       
end;

procedure TFComposicaoCustosCad.SBConfirmarClick(Sender: TObject);
begin
  Self.ActiveControl := Panel1;
  case AnsiIndexStr(PCComposicao.ActivePage.Name, ['TabComposicaoCustos', 'TabCustoContaReferencial']) of
  0:
    begin
      inherited;
    end;
  1:
    begin
      with DMComposicaoCustos do
      begin
        DSComposicaoContaReferencial.DataSet.Post;
      end;
    end;
  end;
  GridComposicaoCustos.DataSource.DataSet.Refresh;
  DBGCustosContaReferencial.DataSource.DataSet.Refresh;
end;

procedure TFComposicaoCustosCad.GridComposicaoCustosCellClick(
  Column: TColumn);
begin
  inherited;

  with DMComposicaoCustos do
  begin
    QComposicaoCustos.Close;
    QComposicaoCustos.SetVariable('PK', StrToInt(GridComposicaoCustos.Columns.Items[0].field.Text));
    QComposicaoCustos.Open;
    QCustosContaReferencialGrid.Close;
    QCustosContaReferencialGrid.SetVariable('PK', QComposicaoCustosCOD_COMPOSICAO_CUSTOS.Value);
    QCustosContaReferencialGrid.Open;
  end;

end;

procedure TFComposicaoCustosCad.SBIncluirClick(Sender: TObject);
begin

  case AnsiIndexStr(PCComposicao.ActivePage.Name, ['TabComposicaoCustos', 'TabCustoContaReferencial']) of
  0:
    begin
      inherited;
    end;
  1:
    begin
      with DMComposicaoCustos do
      begin
        DSCustosContaReferencial.DataSet.Open;
        DSCustosContaReferencial.DataSet.Insert;
      end;
    end;
  end;

end;

procedure TFComposicaoCustosCad.SBAlterarClick(Sender: TObject);
begin

  inherited;
  case AnsiIndexStr(PCComposicao.ActivePage.Name, ['TabComposicaoCustos', 'TabCustoContaReferencial']) of
  0:
    begin
      inherited;
    end;
  1:
    begin
      with DMComposicaoCustos do
      begin
        if DBECodPlanoContaReferencial1.Text <> '' then
        begin
          QCustosContaReferencial.Close;
          QCustosContaReferencial.SetVariable('PK', QCustosContaReferencialGridCOD_COMPOSICAO_CUSTOS.Value);
          QCustosContaReferencial.Open;
          if QCustosContaReferencial.Locate('COD_PLANO_CONTA_REFERENCIAL', QCustosContaReferencialGridCOD_PLANO_CONTA_REFERENCIAL.Value, []) then
          begin
            QCustosContaReferencial.RefreshRecord;
            QCustosContaReferencial.Edit;
          end;
        end;
      end;
    end;
  end;

end;

procedure TFComposicaoCustosCad.BtPlanoContaReferencial1Click(
  Sender: TObject);
begin

  inherited;
  if FPlanoContaReferencialCons = nil then
    FPlanoContaReferencialCons := TFPlanoContaReferencialCons.Create(Application);

  if FPlanoContaReferencialCons.ShowModal = mrOk then
  begin
    with DmPlanoContaReferencial, DMComposicaoCustos do
    begin
      QCustosContaReferencialCOD_COMPOSICAO_CUSTOS.Value := QComposicaoCustosCOD_COMPOSICAO_CUSTOS.Value;
      QCustosContaReferencialCOD_PLANO_CONTA_REFERENCIAL.Value := QPlanoContaReferencialConsCOD_PLANO_CONTA_REFERENCIAL.Value;
    end
  end;

end;

procedure TFComposicaoCustosCad.DSComposicaoContaReferencialStateChange(
  Sender: TObject);
begin

  inherited;
  if DSComposicaoContaReferencial.State in [DsInsert,DsEdit] then
  begin
    DBECodPlanocontaReferencial1.Enabled := true;
    BtPlanoContaReferencial1.Enabled := true;
    DBDNumPlanoContaReferencial1.Enabled := true;
    SBIncluir.Enabled := False;
    SBAlterar.Enabled := False;
    SBExcluir.Enabled := False;
    SBConfirmar.Enabled := True;
    SBCancelar.Enabled := True;
    SBRefresh.Enabled := False;
    MELocaliza.Enabled := False;
    SBConsulta.Enabled := False;
    BtCopia.Enabled := False;
  end
  else
  begin
    DBECodPlanocontaReferencial1.Enabled := false;
    BtPlanoContaReferencial1.Enabled := false;
    DBDNumPlanoContaReferencial1.Enabled := false;
    DBGCustosContaReferencial.Refresh;
    SBIncluir.Enabled := True;
    SBAlterar.Enabled := True;
    SBExcluir.Enabled := True;
    SBConfirmar.Enabled := False;
    SBCancelar.Enabled := False;
    SBRefresh.Enabled := True;
    MELocaliza.Enabled := True;
    SBConsulta.Enabled := True;
    BtCopia.Enabled := True;
  end;

end;

procedure TFComposicaoCustosCad.SBExcluirClick(Sender: TObject);
begin
  Self.ActiveControl := Panel1;
  case AnsiIndexStr(PCComposicao.ActivePage.Name, ['TabComposicaoCustos', 'TabCustoContaReferencial']) of
  0:
    begin
      inherited;
    end;
  1:
    begin
      DSComposicaoContaReferencial.DataSet.Delete;
      GridComposicaoCustos.DataSource.DataSet.Refresh;
      DBGCustosContaReferencial.DataSource.DataSet.Refresh;
    end;
  end;


end;

procedure TFComposicaoCustosCad.SBCancelarClick(Sender: TObject);
begin

  case AnsiIndexStr(PCComposicao.ActivePage.Name, ['TabComposicaoCustos', 'TabCustoContaReferencial']) of
  0:
    begin
      inherited;
    end;
  1:
    begin
      DSComposicaoContaReferencial.DataSet.Cancel;
    end;
  end;

end;

procedure TFComposicaoCustosCad.SBRefreshClick(Sender: TObject);
begin

  case AnsiIndexStr(PCComposicao.ActivePage.Name, ['TabComposicaoCustos', 'TabCustoContaReferencial']) of
  0:
    begin
      inherited;
    end;
  1:
    begin
      DSComposicaoContaReferencial.DataSet.Refresh;
    end;
  end;
end;

procedure TFComposicaoCustosCad.PCComposicaoChange(Sender: TObject);
begin
  inherited;
  case AnsiIndexStr(PCComposicao.ActivePage.Name, ['TabComposicaoCustos', 'TabCustoContaReferencial']) of
  0:
    begin
      DSComposicaoContaReferencial.DataSet.Cancel;

    end;
  1:
    begin
      DSPrimario.DataSet.Cancel;
    end;
  end;

end;


procedure TFComposicaoCustosCad.DBGCustosContaReferencialCellClick(
  Column: TColumn);
begin
  inherited;
  
  with DMComposicaoCustos do
  begin
    QCustosContaReferencial.Close;
    QCustosContaReferencial.SetVariable('PK', QCustosContaReferencialGridCOD_COMPOSICAO_CUSTOS.Value);
    QCustosContaReferencial.Open;
    if QCustosContaReferencial.Locate('COD_PLANO_CONTA_REFERENCIAL', QCustosContaReferencialGridCOD_PLANO_CONTA_REFERENCIAL.Value, []) then
    begin
      DBECodPlanoContaReferencial1.Text := QCustosContaReferencialGridCOD_PLANO_CONTA_REFERENCIAL.Text;
    end;
  end;

end;

procedure TFComposicaoCustosCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  with DMComposicaoCustos do
  begin
    QCustosContaReferencialGrid.Close;
    QCustosContaReferencialGrid.SetVariable('PK', QComposicaoCustosCOD_COMPOSICAO_CUSTOS.Value);
    QCustosContaReferencialGrid.Open;
  end;
end;

procedure TFComposicaoCustosCad.DBECodPlanoContaReferencial1Exit(
  Sender: TObject);
begin
  inherited;
  with DmPlanoContaReferencial, DMComposicaoCustos do
  begin
    QPlanoContaReferencial.Close;
    QPlanoContaReferencial.SetVariable('PK', StrToInt(Trim(DBECodPlanoContaReferencial1.Text)));
    QPlanoContaReferencial.Open;
    QCustosContaReferencialCOD_COMPOSICAO_CUSTOS.Value := QComposicaoCustosCOD_COMPOSICAO_CUSTOS.Value;
    QCustosContaReferencialCOD_PLANO_CONTA_REFERENCIAL.Value := QPlanoContaReferencialCOD_PLANO_CONTA_REFERENCIAL.Value;
    QPlanoContaReferencial.Close;
  end
end;

procedure TFComposicaoCustosCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with DMComposicaoCustos do
  begin
    QComposicaoCustos.Close;
    QCustosContaReferencial.Close;
  end;
  inherited;
  
end;


end.

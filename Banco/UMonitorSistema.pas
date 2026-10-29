unit UMonitorSistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Db, DBTables, ExtCtrls, Mask, OracleData,
  OraTeste;

type
  TFMonitorSistema = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BtProcuraQuery: TBitBtn;
    PBTeste: TProgressBar;
    Label1: TLabel;
    MQueryErro: TMemo;
    Timer1: TTimer;
    Label2: TLabel;
    MQueryAtiva: TMemo;
    BtProcuraAtivas: TBitBtn;
    METotal: TMaskEdit;
    Label3: TLabel;
    MEFantasma: TMaskEdit;
    Label4: TLabel;
    TabSheet3: TTabSheet;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    SB_Verificar: TSpeedButton;
    TabSheet4: TTabSheet;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    TComp_Query: TTable;
    TComp_QueryDataModule: TStringField;
    TComp_QueryComponente: TStringField;
    TComp_QueryRequestLive: TBooleanField;
    TComp_QueryDataSource: TStringField;
    TComp_QueryAutoCalcFields: TBooleanField;
    TComp_QueryFilter: TStringField;
    TComp_QueryFiltered: TBooleanField;
    TComp_QueryParams: TMemoField;
    TComp_QuerySQL: TMemoField;
    Memo2: TMemo;
    TComp_DS: TTable;
    TComp_DSDataModule: TStringField;
    TComp_DSComponente: TStringField;
    TComp_DSDataSet: TStringField;
    BtCompDic: TBitBtn;
    DataSource1: TDataSource;
    Query1: TOracleDataSet;
    Query2: TQuery;
    procedure BtProcuraQueryClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtProcuraAtivasClick(Sender: TObject);
    procedure SB_VerificarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtCompDicClick(Sender: TObject);
  private
    { Private declarations }
    fParado : Boolean;
    Procedure GravaErro(Sender: TObject; E: Exception);
  public
    { Public declarations }
    Property pParado : Boolean Read fParado Write fParado Default true;
  end;

var
  FMonitorSistema: TFMonitorSistema;

var wQtdeForm, wQtdeQuery : Integer;


implementation

uses UOracle_cl;

{$R *.DFM}

procedure TFMonitorSistema.BtProcuraQueryClick(Sender: TObject);
begin
  inherited;
  Application.OnException := GravaErro;
  PBTeste.Max := Application.ComponentCount;
  wQtdeForm := Application.ComponentCount - 1;
  wQtdeQuery := Application.Components[wQtdeForm].ComponentCount-1;  
  Timer1.Enabled := True;
end;

Procedure TFMonitorSistema.GravaErro(Sender: TObject; E: Exception);
Begin
  MQueryErro.Lines.Add('   '+E.Message);
  Timer1.Enabled := True;
End;

procedure TFMonitorSistema.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  While wQtdeForm >= 0 do
  Begin
    PBTeste.Position := wQtdeForm;
    If Copy(Application.Components[wQtdeForm].Name,1,2) = 'DM' Then
    Begin
      While wQtdeQuery >= 0 do
      Begin
        If (Application.Components[wQtdeForm].Components[wQtdeQuery] is TQuery) then
        Try
          (Application.Components[wQtdeForm].Components[wQtdeQuery] as TQuery).Open;
          (Application.Components[wQtdeForm].Components[wQtdeQuery] as TQuery).Close;
        Except
          MQueryErro.Lines.Add( Application.Components[wQtdeForm].Name+'  => '
                         + Application.Components[wQtdeForm].Components[wQtdeQuery].Name);
          Dec(wQtdeQuery);
          Raise;
        End;
        Dec(wQtdeQuery);
      End;
    End;
    Dec(wQtdeForm);
    wQtdeQuery := Application.Components[wQtdeForm].ComponentCount-1;
  End;
  Application.OnException := DMOracle.TrataErro;
end;

procedure TFMonitorSistema.BtProcuraAtivasClick(Sender: TObject);
// Var wCont, wContFantasma : Integer;
//    wLinha : String;
begin
{
  wContFantasma := 0;
  MQueryAtiva.Lines.Clear;
  For wCont := 0 to DMOracle.DBCemapa.DataSetCount - 1 do
  Begin
    If DMOracle.DBCemapa.DataSets[wCont].Active Then
    Begin
      wLinha :=  DMOracle.DBCemapa.DataSets[wCont].Name;
      wLinha := wLinha + '    => ' + DMoracle.DBCemapa.DataSets[wCont].Owner.Name;
      MQueryAtiva.Lines.Add(wLinha);
    End;
    If Trim(DMoracle.DBCemapa.DataSets[wCont].Owner.Name) = '' Then
      Inc(wContFantasma);
  End;
  METotal.Text := FloatToStr(DMOracle.DBCemapa.DataSetCount-1);
  MEFantasma.Text := FloatToStr(wContFantasma);
}
end;

procedure TFMonitorSistema.SB_VerificarClick(Sender: TObject);
var
  MemoryStatus: TMemoryStatus;
begin
  MemoryStatus.dwLength:= sizeof(MemoryStatus);
  GlobalmemoryStatus(MemoryStatus);

  Edit1.Text := IntToStr(MemoryStatus.dwLength)+' MB Tamanho da memoria';
  Edit2.Text := IntToStr(MemoryStatus.dwMemoryLoad)+' Percentual de memoria em uso';
  Edit3.Text := IntToStr(MemoryStatus.dwTotalPhys)+' Bytes de memoria fisica';
  Edit4.Text := IntToStr(MemoryStatus.dwAvailPhys)+' Bytes livres de memoria física';
  Edit5.Text := IntToStr(MemoryStatus.dwTotalPageFile)+' Bytes de páginação de arquivo';
  Edit6.Text := IntToStr(MemoryStatus.dwAvailPageFile)+' Bytes Livres de páginação de arquivo';
  Edit7.Text := IntToStr(MemoryStatus.dwTotalVirtual)+' Bytes em uso de espaço de endereço';
  Edit8.Text := IntToStr(MemoryStatus.dwAvailVirtual)+' Bytes livres';

end;

procedure TFMonitorSistema.BitBtn1Click(Sender: TObject);
Var wCont, wcont2, wQtQuery, wTotDM : Integer;
    wDM, wComp : String;
begin
  TComp_Query.Open;
  wQtQuery := 0;
  For wcont := 0 to Application.ComponentCount - 1 do
  Begin
    wTotDM := 0;
    For wCont2 := 0 to Application.components[wCont].Componentcount-1 do
    begin
      If Application.components[wcont].components[wCont2] is Tquery then
      Begin
        wDM := UpperCase(Application.components[wcont].Name);
        wComp := UpperCase(Application.components[wcont].components[wCont2].Name);
        If not TComp_Query.FindKey( [wDM, wComp ] ) then
        Begin
          TComp_Query.Insert;
          TComp_QueryDataModule.Value := wDM;
          TComp_QueryComponente.Value := wcomp;
          TComp_QueryRequestLive.Value := TQuery(Application.components[wcont].components[wCont2]).RequestLive ;
          Try
            TComp_QueryDataSource.Value := TQuery(Application.components[wcont].components[wCont2]).Datasource.Name;
          Except
          end;
          TComp_QueryAutoCalcFields.Value := TQuery(Application.components[wcont].components[wCont2]).AutoCalcFields;
          TComp_QueryFilter.Value := TQuery(Application.components[wcont].components[wCont2]).Filter;
          TComp_QueryFiltered.Value := TQuery(Application.components[wcont].components[wCont2]).Filtered;
          Memo2.Lines.Clear;
          Memo2.Lines := TQuery(Application.components[wcont].components[wCont2]).SQL;
          TComp_QuerySQL.Value := Memo2.Text;
          // TComp_QueryParams.Value := TQuery(Application.components[wcont].components[wCont2]).Params;
          TComp_Query.Post;
        End;
        Inc(wQtQuery);
        Inc(wTotDM);
      End;
    end;
    Memo1.Lines.Add( Application.Components[wCont].Name
                     + '  '
                     + InttoStr( wTotDM ) );
  End;
  TComp_query.Close;

  TComp_DS.Open;
  // wQtQuery := 0;
  For wcont := 0 to Application.ComponentCount - 1 do
  Begin
    wTotDM := 0;
    For wCont2 := 0 to Application.components[wCont].Componentcount-1 do
    begin
      If Application.components[wcont].components[wCont2] is TDataSource then
      Begin
        wDM := UpperCase(Application.components[wcont].Name);
        wComp := UpperCase(Application.components[wcont].components[wCont2].Name);
        If not TComp_DS.FindKey( [wDM, wComp ] ) then
        Begin
          TComp_DS.Insert;
          TComp_DSDataModule.Value := wDM;
          TComp_DSComponente.Value := wcomp;
          TComp_DSDataSet.Value := TDataSource(Application.components[wcont].components[wCont2]).Dataset.Name;
          TComp_DS.Post;
        End;
        Inc(wQtQuery);
        Inc(wTotDM);
      End;
    end;
    Memo1.Lines.Add( Application.Components[wCont].Name
                     + '  '
                     + InttoStr( wTotDM ) );
  End;



  ShowMessage( InttoStr( wQtQuery ) );
end;

procedure TFMonitorSistema.BtCompDicClick(Sender: TObject);
Var wcont, wCont2 : Integer;
    wErro, wDM, wComp : String;
    wAchou : Boolean;
    wAux  : Integer;
begin
  TComp_Query.Open;
  Memo1.Lines.Clear;
  For wcont := 0 to Application.ComponentCount - 1 do
  Begin
    For wCont2 := 0 to Application.components[wCont].Componentcount-1 do
    begin
      wDM := UpperCase(Application.components[wcont].Name);
      wComp := UpperCase(Application.components[wcont].components[wCont2].Name);
      wErro := '';
      if TComp_Query.FindKey([wDM,wComp]) then
      begin
        // If  Application.components[wcont].components[wCont2] is TOracleDataSet1 then
        begin
          If TComp_QueryRequestLive.Value then
          begin
            Memo2.Lines.Clear;
            Memo2.Lines.Text := TComp_querySQL.Value;
            wAchou := False;
            For wAux := 0 to Memo2.Lines.Count-1 do
            Begin
              If Pos('ROWID',Memo2.Lines[wAux]) > 0 Then
                wAchou := True;
            End;
            If not wAchou then
              wErro := wErro + ' Request Live';
          End;
          If TComp_QueryAutoCalcFields.Value <> TQuery(Application.components[wcont].components[wCont2]).AutoCalcFields then
            wErro := wErro + ' AutoCalcFields';
          If TComp_QueryFilter.Value <> TQuery(Application.components[wcont].components[wCont2]).Filter then
            wErro := wErro + ' Filter';
          If TComp_QueryFiltered.Value <> TQuery(Application.components[wcont].components[wCont2]).Filtered then
            wErro := wErro + ' Filtered';
          If Trim(wErro) <> '' Then
            Memo1.Lines.Add(wDM+' '+wComp+wErro);
          If Trim(TComp_QueryDatasource.Value) <> '' then
          Try
            If TComp_QueryDatasource.Value <> TQuery(Application.components[wcont].components[wCont2]).Datasource.Name then
              wErro := wErro + ' Datasource';
          Except
              wErro := wErro + ' '+ wComp + 'Sem Datasource, correto é ' +TComp_QueryDatasource.Value;
          end;
        end;
      end;
    end;
  end;

  TComp_Query.Close;
  TComp_DS.Open;

  For wcont := 0 to Application.ComponentCount - 1 do
  Begin
    For wCont2 := 0 to Application.components[wCont].Componentcount-1 do
    begin
      wDM := UpperCase(Application.components[wcont].Name);
      wComp := UpperCase(Application.components[wcont].components[wCont2].Name);
      If ( Application.components[wcont].components[wCont2] is TDataSource)
         and (TComp_DS.FindKey([wDM,wComp]))  then
      Begin
        Try
          If TComp_DSDataSet.Value <> TDataSource(Application.components[wcont].components[wCont2]).Dataset.Name Then
            Memo1.Lines.Add(wDM+' => '+wComp+' => DataSet Errado');
        Except
          Memo1.Lines.Add(wDM+' '+ wComp + ' Sem Dataset, o correto é '+TComp_DSDataset.Value);
        End;
      End;
    End;
  End;
end;

end.

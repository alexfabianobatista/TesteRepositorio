unit UVerbaVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids;

type
  TFVerbaVendedor = class(TFTCadSimples)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBDirceu1: TDBDirceu;
    MeRepresentante: TMaskEdit;
    MeAno: TMaskEdit;
    MeMes: TMaskEdit;
    DsVerbaVendedor_All: TDataSource;
    DBGrid1: TDBGrid;
    MeNome: TMaskEdit;
    Label6: TLabel;
    MeValorTotal: TMaskEdit;
    RelVerbaVendedor1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeAnoExit(Sender: TObject);
    procedure MeMesExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure MeAnoChange(Sender: TObject);
    procedure MeMesChange(Sender: TObject);
    procedure RelVerbaVendedor1Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure MeRepresentanteChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVerbaVendedor: TFVerbaVendedor;

implementation

uses UVerbaRepresentante_cl, UVendedorCons, UVendedor_cl, UOracle_cl,
  UUsuario_cl, UVerbaRepresentanteParam, URVerbaVendedor,
  UVerbaVendedorCons;

{$R *.dfm}

procedure TFVerbaVendedor.FormActivate(Sender: TObject);
begin
  inherited;
  DMVerbaRepresentante.QVerbaVendedor.Open;
  MeRepresentante.Text := IntToStr(DMUsuario.CodVendedorPadrao);
//  MeNome.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+IntToStr(DMUsuario.CodVendedorPadrao));
end;

procedure TFVerbaVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMVerbaRepresentante.QVerbaVendedor.Close;
end;

procedure TFVerbaVendedor.MeAnoExit(Sender: TObject);
begin
  inherited;
  If (Trim(MeRepresentante.Text) <> '') And
     (Trim(MeAno.Text) <> '') And
     (Trim(MeMes.Text) <> '') Then
   Begin
     MeValorTotal.Text := DMOracle.BuscaNome('SELECT VAL_VERBA FROM TB_VERBA_REPRESENTANTE','COD_VENDEDOR = '+Trim(MeRepresentante.Text)+' And NUM_ANO='+Trim(MeAno.Text) + ' And NUM_MES='+Trim(Memes.Text));
     DMVerbaRepresentante.QVerbaVendedor_All.Close;
     DMVerbaRepresentante.QVerbaVendedor_All.SetVariable('COD_REPRESENTANTE',Trim(MeRepresentante.Text));
     DMVerbaRepresentante.QVerbaVendedor_All.SetVariable('NUM_ANO',Trim(MeAno.Text));
     DMVerbaRepresentante.QVerbaVendedor_All.SetVariable('NUM_MES',Trim(MeMes.Text));
     DMVerbaRepresentante.QVerbaVendedor_All.Open;
   End;
end;

procedure TFVerbaVendedor.MeMesExit(Sender: TObject);
begin
  inherited;
  MeAnoExit(Self);
end;

procedure TFVerbaVendedor.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  If DsPrimario.State in[DsEdit,DsInsert] Then
     Raise Exception.Create('Favor confirmar antes de selecionar outro');
  With DMVerbaRepresentante do
  Begin
    QVerbaVendedor.Close;
    QVerbaVendedor.SetVariable('Cod_Vendedor',QVerbaVendedor_AllCOD_VENDEDOR.Value);
    QVerbaVendedor.SetVariable('Cod_Verba_Representante',QVerbaVendedor_AllCOD_VERBA_REPRESENTANTE .Value);
    QVerbaVendedor.SetVariable('Num_Ano',Trim(MeAno.Text));
    QVerbaVendedor.SetVariable('Num_Mes',Trim(MeMes.Text));
    QVerbaVendedor.Open;
    If QVerbaVendedor.Eof Then
     Begin
       QVerbaVendedor.Insert;
       QVerbaVendedorCod_Vendedor.Value := Trunc(QVerbaVendedor_AllCOD_VENDEDOR.Value);
       QVerbaVendedorCod_Verba_Representante.Value := Trunc(QVerbaVendedor_AllCOD_VERBA_REPRESENTANTE .Value);
       QVerbaVendedorNum_Ano.Value := StrToInt(Trim(MeAno.Text));
       QVerbaVendedorNum_Mes.Value := StrToInt(Trim(MeMes.Text));
       QVerbaVendedorVal_Verba.Value := 0;
       QVerbaVendedorVal_Utilizado.Value := 0;
     End
    Else
       QVerbaVendedor.Edit;
  End;


end;

procedure TFVerbaVendedor.SBConfirmarClick(Sender: TObject);
Var wValor : String;
begin
  if DMVerbaRepresentante.QVerbaVendedorVAL_UTILIZADO.Value > DMVerbaRepresentante.QVerbaVendedorVAL_VERBA.Value Then
    Raise Exception.Create('Valor liberado menor que valor já utilizado');
  inherited;
  wValor := DMOracle.BuscaNome('SELECT SUM(VAL_VERBA) FROM TB_VERBA_VENDEDOR',
     'COD_VERBA_REPRESENTANTE = '+DMVerbaRepresentante.QVerbaVendedor_AllCod_Verba_Representante.Text+' And NUM_ANO='+Trim(MeAno.Text) + ' And NUM_MES='+Trim(Memes.Text));
  If StrToFloat(wValor) > StrToFloat(MeValorTotal.text) Then // liberou mais que podia
   Begin
     DMVerbaRepresentante.QVerbaVendedor.Edit;
     DMVerbaRepresentante.QVerbaVendedorVal_Verba.Value := DMVerbaRepresentante.QVerbaVendedorVAL_UTILIZADO.Value;
     DMVerbaRepresentante.QVerbaVendedor.Post;
     DMVerbaRepresentante.QVerbaVendedor_All.Close;
     DMVerbaRepresentante.QVerbaVendedor_All.Open;
     Raise Exception.Create('Não pode distribuir mais do que você tem no mês');
   End;
  DMVerbaRepresentante.QVerbaVendedor_All.Close;
  DMVerbaRepresentante.QVerbaVendedor_All.Open;

end;

procedure TFVerbaVendedor.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMVerbaRepresentante.QVerbaVendedor_All.Close;
  DMVerbaRepresentante.QVerbaVendedor_All.Open;

end;

procedure TFVerbaVendedor.MeAnoChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DsInsert,DsEdit] Then
     DSPrimario.DataSet.Cancel;
end;

procedure TFVerbaVendedor.MeMesChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DsInsert,DsEdit] Then
     DSPrimario.DataSet.Cancel;

end;

procedure TFVerbaVendedor.RelVerbaVendedor1Click(Sender: TObject);
begin
  inherited;
  if FVerbaRepresentanteParam = Nil then
    FVerbaRepresentanteParam := TFVerbaRepresentanteParam.Create(Application);
  FVerbaRepresentanteParam.PGRelatorio.Pages[1].Visible := true;
  if FVerbaRepresentanteParam.ShowModal = MrOk then
  begin
    with DMVerbaRepresentante do
    begin
      QRVerbaVendedor.Close;

      if Trim(FVerbaRepresentanteParam.Me2Representante.Text) <> '' then
        QrVerbaVendedor.SetVariable('REPRESENTANTE', Trim(FVerbaRepresentanteParam.Me2Representante.Text))
      else
        QrVerbaVendedor.SetVariable('REPRESENTANTE', Null);

      if Trim(FVerbaRepresentanteParam.Me2Mes.Text) <> '' then
        QrVerbaVendedor.SetVariable('MES',Trim(FVerbaRepresentanteParam.Me2Mes.Text))
      else
        QrVerbaVendedor.SetVariable('MES',Null);

      if Trim(FVerbaRepresentanteParam.Me2Ano.Text) <> '' then
        QrVerbaVendedor.SetVariable('ANO',Trim(FVerbaRepresentanteParam.Me2Ano.Text))
      else
        QrVerbaVendedor.SetVariable('ANO',Null);

      QRVerbaVendedor.Open;
      if FRVerbaVendedor = Nil then
        FRVerbaVendedor := TFRVerbaVendedor.Create(Application);
      if FVerbaRepresentanteParam.RGPreview.ItemIndex = 0 then
        FRVerbaVendedor.QRPrimario.Preview
      else
        FRVerbaVendedor.QRPrimario.Print;
      QRVerbaVendedor.Close;
    End;
  End;
end;

procedure TFVerbaVendedor.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If not(DMUsuario.Privilegiado) Then
    Raise Exception.Create('Somente usuário privilegiado tem acesso');
  if FVerbaVendedorCons = Nil then
    FVerbaVendedorCons := TFVerbaVendedorCons.Create(Application);
  if FVerbaVendedorCons.ShowModal = MrOk then
  begin
    MeRepresentante.Text := DMVerbaRepresentante.QVerbaVendedorConsCod_Supervisor.Text;
    MeAno.Text := DMVerbaRepresentante.QVerbaVendedorConsNUM_ANO.Text;
    MeMes.Text := DMVerbaRepresentante.QVerbaVendedorConsNUM_MES.Text;
    MeAnoExit(Self);
  End;  
end;

procedure TFVerbaVendedor.MeRepresentanteChange(Sender: TObject);
begin
  inherited;
  MeNome.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(MeRepresentante.Text));

end;

end.

unit UPecasMesCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFPecasMesCad = class(TFTCadSimples)
    BtnClasseCons: TBitBtn;
    PeasporMs1: TMenuItem;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    BtConsFilial: TBitBtn;
    DBEdit8: TDBEdit;
    PeasNota1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtnClasseConsClick(Sender: TObject);
    procedure PeasporMs1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure PeasNota1Click(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPecasMesCad: TFPecasMesCad;

implementation

uses UPecas_cl, UOracle_cl, UFilialCons, UProdutoCons, UOrdemServico_cl,
  UProduto_cl, UFilial_cl, UPecasMesCons, UOrdemServicoParam,
  UROrdemServico_Aberto, UPecasParam, URPecasMes, UClasse_cl, UClasseCons,
  URPecasMesNota;

{$R *.DFM}

procedure TFPecasMesCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPecas do
  Begin
    QPecasMes.Close;
    QPecasMes.SetVariable('PK',0);
    QPecasMes.Open;
  End;

end;

procedure TFPecasMesCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFPecasMesCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPecasMesCons = Nil then
    FPecasMesCons := TFPecasMesCons.Create(Application);
  If FPecasMesCons.ShowModal = mrOk then
  With DMPecas do
  Begin
    QPecasMes.Close;
    QPecasMes.SetVariable('PK',QPecasConsCod_Pecas_Mes.Value);
    QPecasMes.Open;
  End;
end;

procedure TFPecasMesCad.BtnClasseConsClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
     FClasseCons:=TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
    DMPecas.QPecasMesCOD_CLASSE.Value:=DMClasse.QClasseConsCod_Classe.Value;
end;

procedure TFPecasMesCad.PeasporMs1Click(Sender: TObject);
begin
  inherited;
  If FPecasParam = Nil Then
    FPecasParam := TFPecasParam.Create(Application);
  FPecasParam.PGRelatorio.Pages[0].TabVisible := True;
  If FPecasParam.ShowModal = mrOk Then
  With DMPecas do
  Begin
    QRPecas.Close;
    //Frames----------
    If Trim(FPecasParam.FmClasse1.MeClasse.Text) = '' Then
      QRPecas.SetVariable('CLASSE',Null)
    Else
      QRPecas.SetVariable('CLASSE',StrToFloat(Trim(FPecasParam.FmClasse1.MeClasse.Text)));

    If Trim(FPecasParam.FmFilial1.MeFilial.Text) = '' Then
      QRPecas.SetVariable('COD_FILIAL',Null)
    Else
      QRPecas.SetVariable('COD_FILIAL',StrToFloat(Trim(FPecasParam.FmFilial1.MeFilial.Text)));
    //---------------
    QRPecas.SetVariable('DATA_I',StrToDate(FPecasParam.ME0Data_I.Text));
    QRPecas.SetVariable('DATA_F',StrToDate(FPecasParam.ME0Data_F.Text));
    QRPecas.SQL[QRPecas.SQL.Count-1] := '';
    Case FPecasParam.Rg0Ordem.ItemIndex of
     0 : QRPecas.Sql.Add ('ORDER BY Cod_Classe');
     1 : QRPecas.Sql.Add ('ORDER BY Desc_Classe');
     2 : QRPecas.Sql.Add ('ORDER BY Qt_Total Desc');
     3 : QRPecas.Sql.Add ('ORDER BY TValor_Venda Desc');
    End;
    QRPecas.Open;

    If FRPecasMes = Nil Then
      FRPecasMes := TFRPecasMes.Create(Application);
    FRPecasMes.QRLTitulo.Caption := 'Relação de Peças de '+ FPecasParam.ME0Data_I.Text+' - '+FPecasParam.ME0Data_F.Text;
    If FPecasParam.RGPreview.ItemIndex = 0 then
      FRPecasMes.QRPrimario.Preview
    Else
      FRPecasMes.QRPrimario.Print;
      QRPecas.Close;
  End;

end;

procedure TFPecasMesCad.FormShow(Sender: TObject);
begin
  inherited;
  DBEdit6.Text := DateToStr(Date);
end;

procedure TFPecasMesCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  {if Trim(DBEdit2.Text) <> '' then
  begin
    EDClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE ','COD_CLASSE = '+FPecasMesCad.DBEdit2.Text);
    if EDClasse.Text = '' then
       EDClasse.Text := 'Produto não Cadastrado!';
  end;}
end;

procedure TFPecasMesCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (9);
end;

procedure TFPecasMesCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMPecas.QPecasMesCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFPecasMesCad.PeasNota1Click(Sender: TObject);  
begin
  inherited;
  If FPecasParam = Nil Then
    FPecasParam := TFPecasParam.Create(Application);
  FPecasParam.PGRelatorio.Pages[1].TabVisible := True;
  If FPecasParam.ShowModal = mrOk Then
  With DMPecas do
  Begin
    QRPecasNota.Close;
    //Frames------------
    If Trim(FPecasParam.Fm1Classe2.MeClasse.Text) <> '' Then
      QRPecasNota.SetVariable('CLASSE',StrToFloat(Trim(FPecasParam.Fm1Classe2.MeClasse.Text)))
    else
      QRPecasNota.SetVariable('CLASSE',Null);

    If Trim(FPecasParam.Fm2Classe2.MeClasse.Text) <> '' Then
      QRPecasNota.SetVariable('CLASSE1',StrToFloat(Trim(FPecasParam.Fm2Classe2.MeClasse.Text)));

    If Trim(FPecasParam.Fm3Classe2.MeClasse.Text) <> '' Then
      QRPecasNota.SetVariable('CLASSE2',StrToFloat(Trim(FPecasParam.Fm3Classe2.MeClasse.Text)));

    If Trim(FPecasParam.FmFilial2.MeFilial.Text) = '' Then
      QRPecasNota.SetVariable('COD_FILIAL',Null)
    Else
      QRPecasNota.SetVariable('COD_FILIAL',StrToFloat(Trim(FPecasParam.FmFilial2.MeFilial.Text)));

    If Trim(FPecasParam.Fm1Operacao2.MeOperacao.Text) <> '' Then
      QRPecasNota.SetVariable('COD_OPERACAO',StrToFloat(Trim(FPecasParam.Fm1Operacao2.MeOperacao.Text)))
    Else
      QRPecasNota.SetVariable('COD_OPERACAO',Null);

    If Trim(FPecasParam.Fm2Operacao2.MeOperacao.Text) <> '' Then
      QRPecasNota.SetVariable('COD_OPERACAO1',StrToFloat(Trim(FPecasParam.Fm2Operacao2.MeOperacao.Text)));
    //------------------

    QRPecasNota.SetVariable('DT_INICIAL',StrToDate(FPecasParam.ME1DtInicial.Text));
    QRPecasNota.SetVariable('DT_FINAL',StrToDate(FPecasParam.ME1DtFinal.Text));
   QRPecasNota.SQL[QRPecasNota.SQL.Count-1] := '';
    Case FPecasParam.Rg1Ordem.ItemIndex of
     0 : QRPecasNota.Sql.Add ('ORDER BY Cod_Classe');
     1 : QRPecasNota.Sql.Add ('ORDER BY Desc_Classe');
     2 : QRPecasNota.Sql.Add ('ORDER BY Qt_Total Desc');
     3 : QRPecasNota.Sql.Add ('ORDER BY TValor_Venda Desc');
    End;
    QRPecasNota.Open;
    If FRPecasMesNota = Nil Then
      FRPecasMesNota := TFRPecasMesNota.Create(Application);
    FRPecasMesNota.QRLTitulo.Caption := 'Relação de Peças de '+ FPecasParam.ME1DtInicial.Text+' - '+FPecasParam.ME1DtFinal.Text;
    //--------------------------
    FRPecasMesNota.QRLOperacao.Caption := 'Operação: ' + FpecasParam.Fm1Operacao2.MeOperacao.Text + ' '+ FpecasParam.Fm1Operacao2.EdOperacao.Text   +
                                          ' Operação2: ' + FpecasParam.Fm2Operacao2.MeOperacao.Text + ' '+ FpecasParam.Fm2Operacao2.EdOperacao.Text +
                                          ' Classe: ' + FpecasParam.Fm1Classe2.MeClasse.Text + ' ' + FpecasParam.Fm1Classe2.EdClasse.Text;
    //--------------------------
    If FPecasParam.RGPreview.ItemIndex = 0 then
      FRPecasMesNota.QRPrimario.Preview
    Else
      FRPecasMesNota.QRPrimario.Print;
    QRPecasNota.Close;
  End;   
end;

procedure TFPecasMesCad.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit16.Text);
end;

end.

unit UGrupoProduto_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids;

type
  TFGrupoProduto_Cad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit16: TDBEdit;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    DBNavigator1: TDBNavigator;
    BtConsClasse: TSpeedButton;
    DBGrid1: TDBGrid;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    DBEdit21: TDBEdit;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    SbSupervisor: TSpeedButton;
    DBEdit23: TDBEdit;
    RelatrioPremioMetas1: TMenuItem;
    RelGrupoProduto1: TMenuItem;
    RelatrioValoresPremio1: TMenuItem;
    DsGrupoProdutoItens: TDataSource;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Opes1: TMenuItem;
    Reaproveitamentodegrupos1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsClasseClick(Sender: TObject);
    procedure DsGrupoProdutoItensStateChange(Sender: TObject);
    procedure SbSupervisorClick(Sender: TObject);
    procedure RelatrioPremioMetas1Click(Sender: TObject);
    procedure RelGrupoProduto1Click(Sender: TObject);
    procedure RelatrioValoresPremio1Click(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure Reaproveitamentodegrupos1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Proc_Calculo;
    procedure Proc_Calcula_Global;
    procedure Proc_Calc_Classe_Grupo(wGrupo : Integer); // no grupo vai ser 1, 2 ou 3
    procedure Proc_Calc_Classe_Item(wGrupo : Integer);
    procedure Proc_Limpa_Tabela;

    { Public declarations }
  end;

  Reg_Mapa = Record
    wCod_Representante   : Real;
    wCod_Classe          : Real;
    wCod_Grupo_produto   : Real;
    wMeta_Kg             : Real;
    wRealizado_KG        : Real;
    wMeta_Preco          : Real;
    wRealizado_Preco     : Real;
    wNota_Kg             : Real;  // nota calculada atingida  por kg
    wNota_Preco          : Real;  // nota calculada atingida  por preco
    wPremio_Profissional : Real;
    wBonus_Qualidade     : Real;
    wNota_Inadimplencia  : Real;  // vai ter nota se atingiu a meta de inadimplencia
    wPerc_Ganho          : Real;  // o percentual de ganho que tera na classe conforme os calculos
    wVal_Venda           : Real;  // valor vendido no periodo
    wFaixa_Kg_De         : Real;  // faixa em que ficou no percentual Kg
    wFaixa_Kg_Ate        : Real;  // faixa em que ficou no percentual Kg
    wFaixa_Preco_De      : Real;  // faixa em que ficou no percentual Preco
    wFaixa_Preco_Ate     : Real;  // faixa em que ficou no percentual Preco
    wPerc_kg             : Real;  // serve apenas para guardar o percentual atingido da meta kg
    wPerc_Preco          : Real;  // serve apenas para guardar o percentual atingido da meta Preco
    wNome                : String;
    wDesc_Classe         : String;
    wDesc_Grupo_produto  : String;
  end;

var
  FGrupoProduto_Cad: TFGrupoProduto_Cad;
  wTab_Mapa : Array[1..500] of Reg_Mapa;
  wSoma_Nota,wNota_Classe1,wNota_Classe2,wNota_Classe3: Real;
  wQb_Representante : Real;

implementation

uses UGrupoProduto_cl, UGrupoProduto_Cons, UClasseCons, UClasse_cl,
  UVendedorCons, UVendedor_cl, UGrupoProduto_Param, UrPremioMetas,
  URGrupoProduto, UOracle_cl, UrPremioCoordenador, UUsuario_cl,
  UrPremioNotas, UGrupoProduto_Imp;

{$R *.dfm}

procedure TFGrupoProduto_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMGrupoProduto.QGrupoProduto_Cad.open;
  DMGrupoProduto.QGrupoProdutoItem_Cad.Open;
end;

procedure TFGrupoProduto_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMGrupoProduto.QGrupoProduto_Cad.Close;
  DMGrupoProduto.QGrupoProdutoItem_Cad.Close;
end;

procedure TFGrupoProduto_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FGrupoProduto_Cons = Nil Then
     FGrupoProduto_Cons := TFGrupoProduto_Cons.Create(Application);
  If FGrupoProduto_Cons.ShowModal = MrOk Then
   Begin
     DMGrupoProduto.QGrupoProduto_Cad.Close;
     DMGrupoProduto.QGrupoProduto_Cad.SetVariable('pk',DMGrupoProduto.QGrupoProduto_ConsCod_Grupo_Produto.Value);
     DMGrupoProduto.QGrupoProduto_Cad.Open;
     PageControl1.ActivePageIndex := 0;
   End;
end;

procedure TFGrupoProduto_Cad.BtConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons=Nil then
    FClasseCons:=TFClasseCons.Create(Application);
  If FClasseCons.ShowModal=mrOk then
    DMGrupoProduto.QGrupoProdutoItem_CadCod_Classe.Value:=DMClasse.QClasseConsCod_Classe.Value;

end;

procedure TFGrupoProduto_Cad.DsGrupoProdutoItensStateChange(
  Sender: TObject);
begin
  inherited;
  If DSGrupoProdutoItens.State in [DsInsert,DsEdit] Then
   Begin
     BtConsClasse.Enabled := True;
     SbSupervisor.Enabled := True;
   End
  Else
   Begin
     BtConsClasse.Enabled := False;
     SbSupervisor.Enabled := False;
   End; 
end;

procedure TFGrupoProduto_Cad.SbSupervisorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons=Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal=mrOk then
    DMGrupoProduto.QGrupoProdutoItem_CadCod_Vendedor.Value:=DMVendedor.QVendedorConsCod_Vendedor.Value;

end;

procedure TFGrupoProduto_Cad.RelatrioPremioMetas1Click(Sender: TObject);
Var  Day,Month,Year:Word;
begin
  inherited;
  If FGrupoProduto_Param = Nil then
    FGrupoProduto_Param := TFGrupoProduto_Param.Create(Application);
  FGrupoProduto_Param.PGRelatorio.Pages[0].TabVisible := True;
  FGrupoProduto_Param.Rg1TipoRelatorio.Visible := False;
  FGrupoProduto_Param.ME1Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
  If Not(DMUsuario.Privilegiado) Then
   Begin
     FGrupoProduto_Param.ME1Vendedor.Enabled := False;
     FGrupoProduto_Param.Bt1Vendedor.Enabled := False;
   End
  Else
   Begin
     FGrupoProduto_Param.ME1Vendedor.Enabled := True;
     FGrupoProduto_Param.Bt1Vendedor.Enabled := True;
   end;
  If FGrupoProduto_Param.ShowModal = mrOk then
  With DMGrupoProduto do
  Begin
    QRGrupoMapa.Close;
    If Trim(FGrupoProduto_Param.ME1Filial.Text) = '' then
      QRGrupoMapa.SetVariable('FILIAL',Null)
    Else
      QRGrupoMapa.SetVariable('FILIAL',FGrupoProduto_Param.ME1Filial.Text);

    QRGrupoMapa.SetVariable('DATA_I',StrToDate(FGrupoProduto_Param.ME1DtInicial.Text));
    QRGrupoMapa.SetVariable('DATA_F',StrToDate(FGrupoProduto_Param.ME1DtFinal.Text));
    DecodeDate(StrToDate(FGrupoProduto_Param.ME1DtInicial.Text),Year,Month,Day);
    QRGrupoMapa.SetVariable('NUM_ANO',Year);
    QRGrupoMapa.SetVariable('NUM_MES',Month);
    If Trim(FGrupoProduto_Param.ME1Vendedor.Text) = '' then
      QRGrupoMapa.SetVariable('SUPERVISOR',Null)
    Else
      QRGrupoMapa.SetVariable('SUPERVISOR',FGrupoProduto_Param.ME1Vendedor.Text);

    QRGrupoMapa.Open;
    If FrPremioMetas = Nil then
      FrPremioMetas := TFrPremioMetas.Create(Application);
    FrPremioMetas.QRLPeriodo.Caption := 'De ' + FGrupoProduto_Param.ME1DtInicial.Text + ' Até '+FGrupoProduto_Param.ME1DtFinal.Text;
    If FGrupoProduto_Param.RGPreview.ItemIndex = 0 then
      FrPremioMetas.QRPrimario.Preview
    Else
      FrPremioMetas.QRPrimario.Print;
    QRGrupoMapa.Close;
  End;

end;

procedure TFGrupoProduto_Cad.RelGrupoProduto1Click(Sender: TObject);
Var  Day,Month,Year:Word;
begin
  inherited;
  if FGrupoProduto_Param = Nil then
    FGrupoProduto_Param := TFGrupoProduto_Param.Create(Application);
  FGrupoProduto_Param.PGRelatorio.Pages[1].TabVisible := true;
  FGrupoProduto_Param.Me2Supervisor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
  If Not(DMUsuario.Privilegiado) Then
   Begin
     FGrupoProduto_Param.Me2Supervisor.Enabled := False;
     FGrupoProduto_Param.Bt2Supervisor.Enabled := False;
   End
  Else
   Begin
     FGrupoProduto_Param.Me2Supervisor.Enabled := True;
     FGrupoProduto_Param.Bt2Supervisor.Enabled := True;
   end;
  DecodeDate(Date,Year,Month,Day);
  FGrupoProduto_Param.Me2Ano.Text := IntToStr(Year);
  FGrupoProduto_Param.Me2Mes.Text := IntToStr(Month);
  if FGrupoProduto_Param.ShowModal = MrOk then
  begin
    with DMGrupoProduto do
    begin
      QRGrupoProduto.Close;
      if Trim(FGrupoProduto_Param.Me2Grupo.Text) <> '' then
        QRGrupoProduto.SetVariable('GRUPO_PRODUTO',Trim(FGrupoProduto_Param.Me2Grupo.Text))
      else
        QRGrupoProduto.SetVariable('GRUPO_PRODUTO',Null);
      if Trim(FGrupoProduto_Param.Me2Supervisor.Text) <> '' then
        QRGrupoProduto.SetVariable('SUPERVISOR',Trim(FGrupoProduto_Param.Me2Supervisor.Text))
      else
        QRGrupoProduto.SetVariable('SUPERVISOR',Null);
      QRGrupoProduto.SetVariable('NUM_ANO',StrToInt(Trim(FGrupoProduto_Param.Me2Ano.Text)));
      QRGrupoProduto.SetVariable('NUM_MES',StrToInt(Trim(FGrupoProduto_Param.Me2Mes.Text)));
      QRGrupoProduto.Open;
      if FRGrupoProduto = Nil then
        FRGrupoProduto := TFRGrupoProduto.Create(Application);
      if FGrupoProduto_Param.RGPreview.ItemIndex = 0 then
        FRGrupoProduto.QRPrimario.Preview
      else
        FRGrupoProduto.QRPrimario.Print;
      QRGrupoProduto.Close;
    End;
  end;
end;

procedure TFGrupoProduto_Cad.RelatrioValoresPremio1Click(Sender: TObject);
Var wI : Integer;
    wPerc,wValor_Premio,wNotaInadimplencia,wNotaBonus : Real;
    wComando : String;
    Day,Month,Year:Word;
begin
  inherited;
  If FGrupoProduto_Param = Nil then
    FGrupoProduto_Param := TFGrupoProduto_Param.Create(Application);
  FGrupoProduto_Param.PGRelatorio.Pages[0].TabVisible := True;
  FGrupoProduto_Param.Rg1TipoRelatorio.Visible := True;
  FGrupoProduto_Param.ME1Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
  If Not(DMUsuario.Privilegiado) Then
   Begin
     FGrupoProduto_Param.ME1Vendedor.Enabled := False;
     FGrupoProduto_Param.Bt1Vendedor.Enabled := False;
   End
  Else
   Begin
     FGrupoProduto_Param.ME1Vendedor.Enabled := True;
     FGrupoProduto_Param.Bt1Vendedor.Enabled := True;
   end;
  If FGrupoProduto_Param.ShowModal = mrOk then
  With DMGrupoProduto do
  Begin
    QrValoresPremio.Close;
    If Trim(FGrupoProduto_Param.ME1Filial.Text) = '' then
      QrValoresPremio.SetVariable('FILIAL',Null)
    Else
      QrValoresPremio.SetVariable('FILIAL',FGrupoProduto_Param.ME1Filial.Text);

    QrValoresPremio.SetVariable('DATA_I',StrToDate(FGrupoProduto_Param.ME1DtInicial.Text));
    QrValoresPremio.SetVariable('DATA_F',StrToDate(FGrupoProduto_Param.ME1DtFinal.Text));
    DecodeDate(StrToDate(FGrupoProduto_Param.ME1DtInicial.Text),Year,Month,Day);
    If Trim(FGrupoProduto_Param.ME1Vendedor.Text) = '' then
      QrValoresPremio.SetVariable('SUPERVISOR',Null)
    Else
      QrValoresPremio.SetVariable('SUPERVISOR',FGrupoProduto_Param.ME1Vendedor.Text);
    QrValoresPremio.SetVariable('NUM_ANO',Year);
    QrValoresPremio.SetVariable('NUM_MES',Month);
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_PREMIO_COORDENADOR';
      If Trim(FGrupoProduto_Param.ME1Vendedor.Text) = '' then
         wComando := wComando + ' WHERE COD_COORDENADOR = '+Trim(FGrupoProduto_Param.ME1Vendedor.Text);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      if DMOracle.DBCemapa.inTransaction then
         DMOracle.DBCemapa.Commit;
    End;
    Proc_Limpa_Tabela; // procedimento para limpar a tabela
    QrValoresPremio.Open;
    wI := 0;
    wQb_Representante := 0;
    wValor_Premio := 0;
    While not(QrValoresPremio.Eof) Do
    Begin
      If wQb_Representante <> QrValoresPremioCod_Representante.Value Then
       Begin
         QRepresentante_Meta.Close;
         QRepresentante_Meta.SetVariable('COD_VENDEDOR',QrValoresPremioCod_Representante.Value);
         QRepresentante_Meta.SetVariable('NUM_ANO',Year);
         QRepresentante_Meta.SetVariable('NUM_MES',Month);
         QRepresentante_Meta.Open; //para verificar se o representante tem premio no cadastro de vendedor
         If Not (QRepresentante_Meta.Eof) Then  // somente vai gerar uma linha na tabela as outras vai ficar zero
          Begin
            If QRepresentante_MetaNum_Bonus_Qualidade.Value > 0 Then
             Begin
               Inc(wI);
               If wI > 500 Then
                  Raise exception.Create('Excedido tamanho tabela - Avisa Cemapa');
               wTab_Mapa[wI].wCod_Representante := QrValoresPremioCod_Representante.Value;
               wTab_Mapa[wI].wCod_Classe        := 998;
               wTab_Mapa[wI].wNome              := QrValoresPremioNome.Value;
               wTab_Mapa[wI].wDesc_Classe       := 'Bonus Qualidade';
               wTab_Mapa[wI].wDesc_Grupo_produto:= 'Bonus Qualidade';
               wTab_Mapa[wI].wBonus_Qualidade   := QRepresentante_MetaNum_Bonus_Qualidade.Value;
             End;
              // vai colocar o valor do premio profissional no primeiro item da tabela logo abaixo
              // somente para listar no relatorio
             If QRepresentante_MetaVal_Premio.Value > 0 Then
               wValor_Premio := QRepresentante_MetaVal_Premio.Value;
             QRInadimplencia.Close;
             QRInadimplencia.SetVariable('Cod_Supervisor',QrValoresPremioCod_Representante.Value);
             QRInadimplencia.SetVariable('DATA_I',StrToDate(FGrupoProduto_Param.ME1DtInicial.Text));
             QRInadimplencia.SetVariable('DATA_F',StrToDate(FGrupoProduto_Param.ME1DtFinal.Text));
             If Trim(FGrupoProduto_Param.Me1Filial.Text) = '' then
               QRInadimplencia.SetVariable('FILIAL',Null)
             Else
               QRInadimplencia.SetVariable('FILIAL',FGrupoProduto_Param.Me1Filial.Text);
             QRInadimplencia.Open;
             If Not(QRInadimplencia.Eof) Then
              Begin
                wPerc := QRInadimplenciasVal_Receber.Value / QRInadimplenciasVal_Venda.Value * 100;
                If wPerc <= QRepresentante_MetaPerc_Inadimplencia.Value Then
                 Begin
                   Inc(wI);
                   If wI > 500 Then
                      Raise exception.Create('Excedido tamanho tabela - Avisa Cemapa');
                   wTab_Mapa[wI].wCod_Representante := QrValoresPremioCod_Representante.Value;
                   wTab_Mapa[wI].wCod_Classe        := 997;
                   wTab_Mapa[wI].wNome              := QrValoresPremioNome.Value;
                   wTab_Mapa[wI].wDesc_Classe       := 'Inadimplencia';
                   wTab_Mapa[wI].wDesc_Grupo_produto:= 'Inadimplencia';
                   wTab_Mapa[wI].wNota_Inadimplencia := 1.2;
                 End;
              End;
          End;
       End;
      wQb_Representante := QrValoresPremioCod_Representante.Value;
      Inc(wI);
      If wI > 500 Then
         Raise exception.Create('Excedido tamanho tabela - Avisa Cemapa');
      wTab_Mapa[wI].wCod_Representante   := QrValoresPremioCod_Representante.Value;
      wTab_Mapa[wI].wCod_Classe          := QrValoresPremioCod_Classe.Value;
      wTab_Mapa[wI].wMeta_Kg             := QrValoresPremioQt_Meta_Kg.Value;
      wTab_Mapa[wI].wRealizado_KG        := QrValoresPremiosQt_Kilos.value;
      wTab_Mapa[wI].wMeta_Preco          := QrValoresPremioVal_Meta_Preco_Medio.Value;
      wTab_Mapa[wI].wRealizado_Preco     := QrValoresPremioVal_Media.Value;
      wTab_Mapa[wI].wNome                := QrValoresPremioNome.Value;
      wTab_Mapa[wI].wDesc_Classe         := QrValoresPremioDesc_Classe.Value;
      wTab_Mapa[wI].wDesc_Grupo_produto  := QrValoresPremioDesc_Grupo_Produto.Value;
      wTab_Mapa[wI].wCod_Grupo_produto   := QrValoresPremioCod_Grupo_Produto.Value;
      wTab_Mapa[wI].wPremio_Profissional := wValor_Premio;
      wTab_Mapa[wI].wVal_Venda           := QrValoresPremiosVal_Total.Value;
      wValor_Premio := 0;
      // aqui calcula a nota para a meta em kg
      wPerc := QrValoresPremioSQt_Kilos.Value / QrValoresPremioQt_Meta_Kg.Value * 100;
      wTab_Mapa[wI].wPerc_kg := wPerc;
      If (wPerc >= QrValoresPremioVal_Faixa_De1.Value) And (wPerc <= QrValoresPremioVal_Faixa_Ate1.Value) Then
       Begin
         wTab_Mapa[wI].wNota_Kg := QrValoresPremioNota_Faixa_Kg1.Value;
         wTab_Mapa[wI].wFaixa_Kg_De := QrValoresPremioVal_Faixa_De1.Value;
         wTab_Mapa[wI].wFaixa_Kg_Ate := QrValoresPremioVal_Faixa_Ate1.Value;
       End;
      If (wPerc >= QrValoresPremioVal_Faixa_De2.Value) And (wPerc <= QrValoresPremioVal_Faixa_Ate2.Value) Then
       Begin
         wTab_Mapa[wI].wNota_Kg := QrValoresPremioNota_Faixa_Kg2.Value;
         wTab_Mapa[wI].wFaixa_Kg_De := QrValoresPremioVal_Faixa_De2.Value;
         wTab_Mapa[wI].wFaixa_Kg_Ate := QrValoresPremioVal_Faixa_Ate2.Value;
       End;
      If (wPerc >= QrValoresPremioVal_Faixa_De3.Value) And (wPerc <= QrValoresPremioVal_Faixa_Ate3.Value) Then
       Begin
         wTab_Mapa[wI].wNota_Kg := QrValoresPremioNota_Faixa_Kg3.Value;
         wTab_Mapa[wI].wFaixa_Kg_De := QrValoresPremioVal_Faixa_De3.Value;
         wTab_Mapa[wI].wFaixa_Kg_Ate := QrValoresPremioVal_Faixa_Ate3.Value;
       End;
      If (wPerc >= QrValoresPremioVal_Faixa_De4.Value) Then
       Begin
         wTab_Mapa[wI].wNota_Kg := QrValoresPremioNota_Faixa_Kg4.Value;
         wTab_Mapa[wI].wFaixa_Kg_De := QrValoresPremioVal_Faixa_De4.Value;
         wTab_Mapa[wI].wFaixa_Kg_Ate := QrValoresPremioVal_Faixa_Ate4.Value;
       End;
      // aqui calcula a nota para o preco medio
      wPerc := QrValoresPremioVal_Media.Value / QrValoresPremioVal_Meta_Preco_Medio.Value * 100;
      wTab_Mapa[wI].wPerc_Preco := wPerc;
      If (wPerc >= QrValoresPremioVal_Faixa_De1.Value) And (wPerc <= QrValoresPremioVal_Faixa_Ate1.Value) Then
       Begin
         wTab_Mapa[wI].wNota_Preco := QrValoresPremioNota_Faixa_Preco1.Value;
         wTab_Mapa[wI].wFaixa_Preco_De := QrValoresPremioVal_Faixa_De1.Value;
         wTab_Mapa[wI].wFaixa_Preco_Ate := QrValoresPremioVal_Faixa_Ate1.Value;
       End;
      If (wPerc >= QrValoresPremioVal_Faixa_De2.Value) And (wPerc <= QrValoresPremioVal_Faixa_Ate2.Value) Then
       Begin
         wTab_Mapa[wI].wNota_Preco := QrValoresPremioNota_Faixa_Preco2.Value;
         wTab_Mapa[wI].wFaixa_Preco_De := QrValoresPremioVal_Faixa_De2.Value;
         wTab_Mapa[wI].wFaixa_Preco_Ate := QrValoresPremioVal_Faixa_Ate2.Value;
       End;
      If (wPerc >= QrValoresPremioVal_Faixa_De3.Value) And (wPerc <= QrValoresPremioVal_Faixa_Ate3.Value) Then
       Begin
         wTab_Mapa[wI].wNota_Preco := QrValoresPremioNota_Faixa_Preco3.Value;
         wTab_Mapa[wI].wFaixa_Preco_De := QrValoresPremioVal_Faixa_De3.Value;
         wTab_Mapa[wI].wFaixa_Preco_Ate := QrValoresPremioVal_Faixa_Ate3.Value;
       End;
      If (wPerc >= QrValoresPremioVal_Faixa_De4.Value) Then
       Begin
         wTab_Mapa[wI].wNota_Preco := QrValoresPremioNota_Faixa_Preco4.Value;
         wTab_Mapa[wI].wFaixa_Preco_De := QrValoresPremioVal_Faixa_De4.Value;
         wTab_Mapa[wI].wFaixa_Preco_Ate := QrValoresPremioVal_Faixa_Ate4.Value;
       End;
      QrValoresPremio.Next;
    End;

    // agora que esta com a tabela montada em memoria será verificado qual o indice que cada representante tem direito baseado nas notas obtidas
    wQb_Representante := wTab_Mapa[1].wCod_Representante; // INICIALIZAR
    wSoma_Nota := 0;
    wNota_Classe1 := 0;
    wNota_Classe2 := 0;
    wNota_Classe3 := 0;
    wI := 1;
    while wI <= 500 do
    Begin
      If wTab_Mapa[wI].wCod_Representante = 0 Then // este if serve para desprezar o restante da tabela nao ocupado
       Begin
         Inc(wI);
         Continue;
       End;
      If wQb_Representante <> wTab_Mapa[wI].wCod_Representante Then
       Begin
         Proc_Calculo;
         wSoma_Nota := 0;
         wNota_Classe1 := 0;
         wNota_Classe2 := 0;
         wNota_Classe3 := 0;
       End;
//       If wTab_Mapa[wI].wCod_Classe <> 999 Then // esta classe 999 é para premio profissional nao tem indice
       wSoma_Nota := wSoma_Nota + wTab_Mapa[wI].wNota_Kg +
                    wTab_Mapa[wI].wNota_Preco +
                    wTab_Mapa[wI].wNota_Inadimplencia +   // somente vai ter no item da tabela quando codigo classe for 997
                    wTab_Mapa[wI].wBonus_Qualidade;       // somente vai ter no item da tabela quando codigo classe for 998
       // estas notas abaixo serve para verificar se o supervisor atingiu as metas do grupo somente será considerando
       // quano o supervisor nao atingir as metas total(aonde ele tem um ganho maior)
       If wTab_Mapa[wI].wCod_Grupo_produto = 1 Then
         If (wTab_Mapa[wI].wNota_Kg = 0) or (wTab_Mapa[wI].wNota_Preco = 0) Then
            wNota_Classe1 := 1;  // nao atingiu a meta nesta classe
       If wTab_Mapa[wI].wCod_Grupo_produto = 2 Then
         If (wTab_Mapa[wI].wNota_Kg = 0) or (wTab_Mapa[wI].wNota_Preco = 0) Then
            wNota_Classe2 := 1;  // nao atingiu a meta nesta classe
       If wTab_Mapa[wI].wCod_Grupo_produto = 3 Then
         If (wTab_Mapa[wI].wNota_Kg = 0) or (wTab_Mapa[wI].wNota_Preco = 0) Then
            wNota_Classe3 := 1;  // nao atingiu a meta nesta classe
       Inc(wI);
    End;
    Proc_Calculo;
    QPremio_Representante.Close;
    QPremio_Representante.open;
    wNotaInadimplencia := 0;  // serve para gravar a nota inadimplencia  para o relatorio
    wNotaBonus := 0;          // e nota bonus
    wI := 1;
    While wI <= 500 do
    Begin
      If wTab_Mapa[wI].wCod_Representante = 0 Then // este if server para desprezar o restante da tabela nao ocupado
       Begin
         Inc(wI);
         Continue;
       End;
      If (wTab_Mapa[wI].wCod_Classe = 997) Then
        wNotaInadimplencia := wTab_Mapa[wI].wNota_Inadimplencia;  // no proximo registro vai gravar a nota
      If (wTab_Mapa[wI].wCod_Classe = 998) Then
        wNotaBonus := wTab_Mapa[wI].wBonus_Qualidade;
      If (wTab_Mapa[wI].wCod_Classe = 997) or (wTab_Mapa[wI].wCod_Classe = 998) Then
       Begin
        Inc(wI);
        Continue;
       End;
      QPremio_Representante.Insert;
      QPremio_RepresentanteCOD_COORDENADOR.Value := Trunc(wTab_Mapa[wI].wCod_Representante);
      QPremio_RepresentanteCOD_CLASSE.Value := Trunc(wTab_Mapa[wI].wCod_Classe);
      QPremio_RepresentanteCOD_GRUPO_PRODUTO.Value := Trunc(wTab_Mapa[wI].wCod_Grupo_produto);
      QPremio_RepresentanteQT_META_KG.Value := wTab_Mapa[wI].wMeta_Kg;
      QPremio_RepresentanteQT_REALIZADO_KG.Value := wTab_Mapa[wI].wRealizado_KG;
      QPremio_RepresentanteVL_META_PRECO.Value := wTab_Mapa[wI].wMeta_Preco;
      QPremio_RepresentanteVL_REALIZADO_PRECO.Value := wTab_Mapa[wI].wRealizado_Preco;
      QPremio_RepresentanteNUM_NOTA_KG.Value := wTab_Mapa[wI].wNota_Kg;
      QPremio_RepresentanteNUM_NOTA_PRECO.Value := wTab_Mapa[wI].wNota_Preco;
      QPremio_RepresentanteVL_PREMIO_PROFISSIONAL.Value := wTab_Mapa[wI].wPremio_Profissional;
      QPremio_RepresentanteNUM_NOTA_BONUS.Value := wNotaBonus;
      QPremio_RepresentanteNUM_NOTA_INADIMPLENCIA.Value := wNotaInadimplencia;
      QPremio_RepresentantePERC_GANHO.Value := wTab_Mapa[wI].wPerc_Ganho;
      QPremio_RepresentanteNOME.Value := wTab_Mapa[wI].wNome;
      QPremio_RepresentanteDESC_CLASSE.Value := wTab_Mapa[wI].wDesc_Classe;
      QPremio_RepresentanteDESC_GRUPO_PRODUTO.Value := wTab_Mapa[wI].wDesc_Grupo_produto;
      QPremio_RepresentanteVL_PREMIO.Value := wTab_Mapa[wI].wVal_Venda * wTab_Mapa[wI].wPerc_Ganho / 100;
      QPremio_RepresentanteNUM_FAIXA_KG_DE.Value := wTab_Mapa[wI].wFaixa_Kg_De;
      QPremio_RepresentanteNUM_FAIXA_KG_ATE.Value := wTab_Mapa[wI].wFaixa_Kg_Ate;
      QPremio_RepresentanteNUM_FAIXA_PRECO_DE.Value := wTab_Mapa[wI].wFaixa_Preco_De;
      QPremio_RepresentanteNUM_FAIXA_PRECO_ATE.Value := wTab_Mapa[wI].wFaixa_Preco_Ate;
      QPremio_Representante.Post;
      wNotaBonus := 0;
      wNotaInadimplencia := 0;
      Inc(wI);
    End;
    if DMOracle.DBCemapa.inTransaction then
       DMOracle.DBCemapa.Commit;

    QPremio_Representante.Close;
    If Trim(FGrupoProduto_Param.ME1Vendedor.Text) = '' then
      QPremio_Representante.SetVariable('COD_COORDENADOR',Null)
    Else
      QPremio_Representante.SetVariable('COD_COORDENADOR',FGrupoProduto_Param.ME1Vendedor.Text);
    QPremio_Representante.open;

    If FGrupoProduto_Param.Rg1TipoRelatorio.ItemIndex = 0 Then
     Begin
       If FrPremioCoordenador = Nil then
         FrPremioCoordenador := TFrPremioCoordenador.Create(Application);
       FrPremioCoordenador.QRLPeriodo.Caption := 'De ' + FGrupoProduto_Param.Me1DtInicial.Text + ' Até '+FGrupoProduto_Param.Me1DtFinal.Text;
       If FGrupoProduto_Param.RGPreview.ItemIndex = 0 then
         FrPremioCoordenador.QRPrimario.Preview
       Else
         FrPremioCoordenador.QRPrimario.Print;
     End
    Else
     Begin
       If FrPremioNotas = Nil then
         FrPremioNotas := TFrPremioNotas.Create(Application);
       FrPremioNotas.QRLPeriodo.Caption := 'De ' + FGrupoProduto_Param.Me1DtInicial.Text + ' Até '+FGrupoProduto_Param.Me1DtFinal.Text;
       If FGrupoProduto_Param.RGPreview.ItemIndex = 0 then
         FrPremioNotas.QRPrimario.Preview
       Else
         FrPremioNotas.QRPrimario.Print;
     End;
    QPremio_Representante.Close;
  End;

end;

procedure TFGrupoProduto_Cad.SBRefreshClick(Sender: TObject);
begin
  inherited;
  DSGrupoProdutoItens.DataSet.Close;
  DSGrupoProdutoItens.DataSet.Open;
end;
procedure TFGrupoProduto_Cad.Proc_Calculo;
Begin
  If wSoma_Nota >= 9 Then // se atingiu a nota em todos os itens (meta global)
   Begin
     DMGrupoProduto.QRepresentante_Meta.Close;
     DMGrupoProduto.QRepresentante_Meta.SetVariable('COD_VENDEDOR',wQb_Representante);
     DMGrupoProduto.QRepresentante_Meta.Open; //o ano e mes ja abriu no inicio da rotina
     If DMGrupoProduto.QRepresentante_Meta.Eof Then
       Raise exception.Create('Representante de premio cadastrado no mes/ano');
     Proc_Calcula_Global;
   End
  Else
    Begin
      If wNota_Classe1 = 0 Then // se atingiu a nota no grupo
         Proc_Calc_Classe_Grupo(1)
      Else
         Proc_Calc_Classe_Item(1);
      If wNota_Classe2 = 0 Then // se atintiu a nota no grupo
         Proc_Calc_Classe_Grupo(2)
      Else
         Proc_Calc_Classe_Item(2);
      If wNota_Classe3 = 0 Then // se atintiu a nota no grupo
         Proc_Calc_Classe_Grupo(3)
      Else
         Proc_Calc_Classe_Item(3);
    End;
End;

procedure TFGrupoProduto_Cad.Proc_Calcula_Global;
Var wCont : Integer;             // vai utilizar esta procedure para gravar o ganho quando foi atingido a meta total
    wPerc_Premio,wNota : Real;   // da vai gravar o ganho conforme a faixa que se enquadra
Begin
  wNota := wSoma_Nota * 10;  // multiplica por dez para ficar na mesma unidade de medida que foi cadastrado
  With DMGrupoProduto do
  Begin
    If (wNota >= QRepresentante_MetaNOTA_DE1.Value) And (wNota <= QRepresentante_MetaNOTA_ATE1.Value) Then
       wPerc_Premio := QRepresentante_MetaPERC_PREMIO1.Value
    Else
      If (wNota <= QRepresentante_MetaNOTA_ATE2.Value) Then
         wPerc_Premio := QRepresentante_MetaPERC_PREMIO2.Value
      Else
        If (wNota <= QRepresentante_MetaNOTA_ATE3.Value) Then
           wPerc_Premio := QRepresentante_MetaPERC_PREMIO3.Value
        Else
          If (wNota <= QRepresentante_MetaNOTA_ATE4.Value) Then
             wPerc_Premio := QRepresentante_MetaPERC_PREMIO4.Value
          Else
            If (wNota <= QRepresentante_MetaNOTA_ATE5.Value) Then
               wPerc_Premio := QRepresentante_MetaPERC_PREMIO5.Value
            Else
              If (wNota <= QRepresentante_MetaNOTA_ATE6.Value) Then
                 wPerc_Premio := QRepresentante_MetaPERC_PREMIO6.Value
              Else
                If (wNota <= QRepresentante_MetaNOTA_ATE7.Value) Then
                   wPerc_Premio := QRepresentante_MetaPERC_PREMIO7.Value
                Else
                  If (wNota <= QRepresentante_MetaNOTA_ATE8.Value) Then
                     wPerc_Premio := QRepresentante_MetaPERC_PREMIO8.Value
                  Else
                    If (wNota <= QRepresentante_MetaNOTA_ATE9.Value) Then
                       wPerc_Premio := QRepresentante_MetaPERC_PREMIO9.Value
                    Else
                      If (wNota <= QRepresentante_MetaNOTA_ATE10.Value) Then
                         wPerc_Premio := QRepresentante_MetaPERC_PREMIO10.Value
                      Else
                        If (wNota >= QRepresentante_MetaNOTA_ACIMA.Value) Then
                           wPerc_Premio := QRepresentante_MetaPERC_PREMIO_ACIMA.Value;
  End;
  For wCont := 1 to 500 do
  Begin
    If wTab_Mapa[wCont].wCod_Representante <> wQb_Representante Then
       Continue;
    wTab_Mapa[wCont].wPerc_Ganho := wPerc_Premio;
  End;
End;

procedure TFGrupoProduto_Cad.Proc_Calc_Classe_Grupo(wGrupo : Integer);
Var wCont : Integer;   // quando nao atinge a meta do global e atingiu no grupo vai utilizar esta rotina para lancar o ganho
Begin
  For wCont := 1 to 500 do
  Begin
    If (wTab_Mapa[wCont].wCod_Representante <> wQb_Representante) Or
       (wTab_Mapa[wCont].wCod_Grupo_produto <> wGrupo) Then
       Continue;
    wTab_Mapa[wCont].wPerc_Ganho := 0.20;
  End;
End;

procedure TFGrupoProduto_Cad.Proc_Calc_Classe_Item(wGrupo : Integer);
Var wCont : Integer;   // quando nao atinge a meta do global e nem o grupo vai utilizar esta rotina para verificar
Begin                  // se atingiu a meta na classe - se atingiu vai ter nota na variavel wNota_Kg e wNota_Preco
  wCont := 1;
  While wCont <= 500 do
  Begin
    If (wTab_Mapa[wCont].wCod_Representante <> wQb_Representante) Or
       (wTab_Mapa[wCont].wCod_Grupo_produto <> wGrupo) Then
     Begin
       Inc(wcont);
       Continue;
     End;
    If (wTab_Mapa[wCont].wPerc_Kg >= 100) And (wTab_Mapa[wCont].wPerc_Preco >= 100) Then  // significa que atingiu a meta neste item
      wTab_Mapa[wCont].wPerc_Ganho := 0.15;
    Inc(wCont);
  End;


End;
procedure TFGrupoProduto_Cad.Proc_Limpa_Tabela;
Var wCont : Integer;
Begin
  For wCont := 1 to 500 do
  Begin
    wTab_Mapa[wCont].wCod_Representante := 0;
    wTab_Mapa[wCont].wCod_Classe        := 0;
    wTab_Mapa[wCont].wCod_Grupo_produto := 0;
    wTab_Mapa[wCont].wMeta_Kg           := 0;
    wTab_Mapa[wCont].wRealizado_KG      := 0;
    wTab_Mapa[wCont].wMeta_Preco        := 0;
    wTab_Mapa[wCont].wRealizado_Preco   := 0;
    wTab_Mapa[wCont].wNota_Kg           := 0;
    wTab_Mapa[wCont].wNota_Preco        := 0;
    wTab_Mapa[wCont].wPremio_Profissional := 0;
    wTab_Mapa[wCont].wBonus_Qualidade     := 0;
    wTab_Mapa[wCont].wNota_Inadimplencia  := 0;
    wTab_Mapa[wCont].wPerc_Ganho          := 0;
    wTab_Mapa[wCont].wFaixa_Kg_De         := 0;
    wTab_Mapa[wCont].wFaixa_Kg_Ate        := 0;
    wTab_Mapa[wCont].wFaixa_Preco_De      := 0;
    wTab_Mapa[wCont].wFaixa_Preco_Ate     := 0;
    wTab_Mapa[wCont].wPerc_Kg             := 0;
    wTab_Mapa[wCont].wPerc_Preco          := 0;
    wTab_Mapa[wCont].wNome                := '';
    wTab_Mapa[wCont].wDesc_Classe         := '';
    wTab_Mapa[wCont].wDesc_Grupo_produto  := '';
  End;  
End;  


procedure TFGrupoProduto_Cad.PageControl1Change(Sender: TObject);
begin
  inherited;     // somente para ativar os controles do dbnavigator
  DMGrupoProduto.QGrupoProdutoItem_Cad.First;
  If Not(DMGrupoProduto.QGrupoProdutoItem_Cad.Eof) then
   Begin
    DMGrupoProduto.QGrupoProdutoItem_Cad.Edit;
    DMGrupoProduto.QGrupoProdutoItem_Cad.Cancel;
   End;

end;

procedure TFGrupoProduto_Cad.SBConfirmarClick(Sender: TObject);
begin
  inherited;  // somente para ativar os controles do dbnavigator
  DMGrupoProduto.QGrupoProdutoItem_Cad.insert;
  DMGrupoProduto.QGrupoProdutoItem_Cad.Cancel;
end;

procedure TFGrupoProduto_Cad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;

end;

procedure TFGrupoProduto_Cad.Reaproveitamentodegrupos1Click(
  Sender: TObject);
begin
  inherited;
  If FGrupoProduto_Imp = Nil Then
    FGrupoProduto_Imp := TFGrupoProduto_Imp.Create(application);
  //DMTela.VerificaTela(pModulo,FPrecoPocket1_Cad.Caption,FPrecoPocket1_Cad.Name);
  FGrupoProduto_Imp.ShowModal;
end;

procedure TFGrupoProduto_Cad.DSPrimarioStateChange(Sender: TObject);
var
  wIndState : boolean;
begin
  inherited;
  wIndState := DsPrimario.State in [DsInsert,DsEdit];

  Opes1.Enabled := not wIndState;
end;

end.

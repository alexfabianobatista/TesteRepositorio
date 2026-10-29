unit UEstoqueACons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, DBCtrls,
  ExtCtrls, variants, Menus, jpeg;

type
  TFEstoqueACons = class(TFTConsulta)
    GroupBox1: TGroupBox;
    Label6: TLabel;
    MECodFilial: TMaskEdit;
    SpeedButton6: TSpeedButton;
    MEProduto: TMaskEdit;
    SpeedButton7: TSpeedButton;
    MECodProduto: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    MECodLote: TMaskEdit;
    SpeedButton8: TSpeedButton;
    MELote: TMaskEdit;
    MEClasse: TMaskEdit;
    SpeedButton9: TSpeedButton;
    MECodClasse: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    MECodSubClasse: TMaskEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText10: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBGrid4: TDBGrid;
    DBText9: TDBText;
    DBText11: TDBText;
    Label5: TLabel;
    Label18: TLabel;
    DBText12: TDBText;
    Label17: TLabel;
    PrecoAtacado: TLabel;
    PrecoVarejo: TLabel;
    DBText13: TDBText;
    DBText14: TDBText;
    Label19: TLabel;
    DBText15: TDBText;
    Label20: TLabel;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    Label21: TLabel;
    BitBtn1: TBitBtn;
    RgEstoque: TRadioGroup;
    Label22: TLabel;
    DBText19: TDBText;
    MeCodFabricante: TMaskEdit;
    Label23: TLabel;
    ImgProduto: TImage;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure MECodLoteChange(Sender: TObject);
    procedure MECodClasseChange(Sender: TObject);
    procedure MECodSubClasseChange(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MECodProdutoExit(Sender: TObject);
    procedure MeCodFabricanteExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstoqueACons: TFEstoqueACons;
  CodProduto: Integer;

implementation

uses UEstoque_cl, UFilialCons, UFilial_cl, UProdutoCons, UProduto_cl,
  UTipoLoteCons, UTipoLote_cl, UClasseCons, UClasse_cl, UOracle_cl,
  UParamSistema_cl, UUsuario_cl, UBiblioteca;

{$R *.DFM}

procedure TFEstoqueACons.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
     MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFEstoqueACons.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal=mrOk then
  Begin
    MECodProduto.Text:=FloatToStr(DMProduto.QProdutoConsCOD_PRODUTO.Value);
    MECodProdutoExit(self);
  end;
end;

procedure TFEstoqueACons.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = Nil then
    FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal=mrOk then
     MECodLote.Text:=FloatToStr(DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value);
end;
procedure TFEstoqueACons.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil then
    FClasseCons:=TFClasseCons.Create(Application);
  if FClasseCons.ShowModal=mrOk then
    Begin
      MECodClasse.Text:=FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      MECodSubClasse.Text:=FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
    End;
end;

procedure TFEstoqueACons.MECodFilialChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodFilial.Text)<>'' then
    METexto.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  Else
    METexto.Clear;
end;

procedure TFEstoqueACons.MECodLoteChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodLote.Text)<>'' then
     MELote.Text:=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+MECodLote.Text)
  Else
    MELote.Clear;
end;

procedure TFEstoqueACons.MECodClasseChange(Sender: TObject);
begin
  inherited;
  If (Trim(MECodSubClasse.Text)<>'') and (Trim(MECodClasse.Text)<>'') then
    MEClasse.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','(NUM_CLASSE = '+MECodClasse.Text+') AND (NUM_SUBCLASSE = '+MECodSubClasse.Text+')')
  Else
    MEClasse.Clear;
end;

procedure TFEstoqueACons.MECodSubClasseChange(Sender: TObject);
begin
  inherited;
  If (Trim(MECodSubClasse.Text)<>'') and (Trim(MECodClasse.Text)<>'') then
    MEClasse.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','(NUM_CLASSE = '+MECodClasse.Text+') AND (NUM_SUBCLASSE = '+MECodSubClasse.Text+')')
  Else
    MEClasse.Clear;
end;

procedure TFEstoqueACons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'ESTOQUE');
  With DmEstoque do
    Begin
      pEstoque_Cons := 0;  // serve para nao executar o calcfields  da consulta QEstoqueACons
      QEstoqueACons.Close;
      QNotaACons.Close;
      QPedidoACons.Close;
      QOrdemCACOns.Close;
      QPedidoACons.Close;
      QSomaPedido.Close;
      QSomaNota.Close;
      QSomaOrdemC.Close;
      if Trim(MECodFilial.Text)<>'' then
        QEstoqueACons.SetVariable('FILIAL',MECodFilial.Text)
      else
         QEstoqueACons.SetVariable('FILIAL',Null);
      if Trim(MECodProduto.Text)<>'' then
         QEstoqueACons.SetVariable('PRODUTO',CodProduto)
      else
         QEstoqueACons.SetVariable('PRODUTO',Null);
      If Trim(MECodLote.Text)<>'' then
         QEstoqueACons.SetVariable('LOTE',MECodLote.Text)
      Else
        QEstoqueACons.SetVariable('LOTE',Null);
      If Trim(MECodClasse.Text)<>'' then
        QEstoqueACons.SetVariable('CLASSE',MECodClasse.Text)
      Else
        QEstoqueACons.SetVariable('CLASSE',Null);
      If Trim(MECodSubClasse.Text)<>'' then
        QEstoqueACons.SetVariable('SUBCLASSE',MECodSubClasse.Text)
      Else
        QEstoqueACons.SetVariable('SUBCLASSE',Null);
      If RgEstoque.ItemIndex = 1 Then
         QEstoqueACons.Sql.Add(' AND Tb_estoque.QT_QUANTIDADE <> 0');
      QEstoqueACons.Open;
      If RgEstoque.ItemIndex = 1 Then
         QEstoqueACons.SQL[QEstoqueACons.SQL.Count-1]:='';  // elimina a última Linha da SQL
    End;
end;

procedure TFEstoqueACons.FormCreate(Sender: TObject);
begin
  inherited;
  PrecoAtacado.Caption:='Preço '+DMParamSistema.QParamSistemaInd_Preco.value+' :';
  PrecoVarejo.Caption:='Preço '+DMParamSistema.QParamSistemaInd_Preco2.value+' :';
  CodProduto := 0; 
end;

procedure TFEstoqueACons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'ESTOQUE');
  With DmEstoque do
    Begin
      pEstoque_Cons := 1;  // serve para executar o calcfields  da consulta QEstoqueACons 0=nao executa 1=executa calcfields
      QNotaACons.Close;    // deixar setado esta opção para o calcfields e scrool da query qestoqueacons
      QPedidoACons.Close;
      QOrdemCACOns.Close;
      QSomaPedido.Close;
      QSomaNota.Close;
      QSomaOrdemC.Close;
      if Trim(MECodFilial.Text)<>'' then
       Begin
        QNotaACons.SetVariable('COD_FILIAL',MECodFilial.Text);
        QSomaNota.SetVariable('COD_FILIAL',MECodFilial.Text);
        QPedidoACons.SetVariable('COD_FILIAL',MECodFilial.Text);
        QSomaPedido.SetVariable('COD_FILIAL',MECodFilial.Text);
        QOrdemCACons.SetVariable('COD_FILIAL',MECodFilial.Text);
        QSomaOrdemC.SetVariable('COD_FILIAL',MECodFilial.Text);
       End
      else
       Begin
        QNotaACons.SetVariable('COD_FILIAL',Null);
        QSomaNota.SetVariable('COD_FILIAL',Null);
        QPedidoACons.SetVariable('COD_FILIAL',Null);
        QSomaPedido.SetVariable('COD_FILIAL',Null);
        QOrdemCACons.SetVariable('COD_FILIAL',Null);
        QSomaOrdemC.SetVariable('COD_FILIAL',Null);
       End;
      If CodProduto > 0 then
       Begin
         QNotaACons.SetVariable('COD_PRODUTO',CodProduto);
         QSomaNota.SetVariable('COD_PRODUTO',CodProduto);
         QPedidoACons.SetVariable('COD_PRODUTO',CodProduto);
         QSomaPedido.SetVariable('COD_PRODUTO',CodProduto);
         QOrdemCACons.SetVariable('COD_PRODUTO',CodProduto);
         QSomaOrdemC.SetVariable('COD_PRODUTO',CodProduto);
       End
      else
       Begin
         QNotaACons.SetVariable('COD_PRODUTO',Null);
         QSomaNota.SetVariable('COD_PRODUTO',Null);
         QPedidoACons.SetVariable('COD_PRODUTO',Null);
         QSomaPedido.SetVariable('COD_PRODUTO',Null);
         QOrdemCACons.SetVariable('COD_PRODUTO',Null);
         QSomaOrdemC.SetVariable('COD_PRODUTO',Null);
       End;
      If Trim(MECodLote.Text)<>'' then
       Begin
         QNotaACons.SetVariable('COD_LOTE_TIPO',MECodLote.Text);
         QSomaNota.SetVariable('COD_LOTE_TIPO',MECodLote.Text);
       End
      Else
       Begin
         QNotaACons.SetVariable('COD_LOTE_TIPO',Null);
         QSomaNota.SetVariable('COD_LOTE_TIPO',Null);
       End;
      QOrdemCACOns.Open;
      QSomaOrdemC.Open;
      If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ENCOPEL' Then
       Begin
         QNotaACons.Open;
         QPedidoACons.Open;
         QSomaPedido.Open;
         QSomaNota.Open;
       End;
    End;
end;

procedure TFEstoqueACons.MECodProdutoExit(Sender: TObject);
Var
  b: TStream;
  Jpg: TJpegImage;
begin
  inherited;
  if Trim(MECodProduto.Text) <> '' then
  Begin
    CodProduto := StrToInt(MECodProduto.Text);
    MEProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + MECodProduto.Text);

    Jpg := nil;

    DMProduto.QImagem_Consulta.Close;
    DMProduto.QImagem_Consulta.SetVariable('Cod_Produto',Trim(MECodProduto.Text));
    DMProduto.QImagem_Consulta.Open;

    // transferindo a fotografia para o objeto TStream
    b := DMProduto.QImagem_Consulta.CreateBlobStream(DMProduto.QImagem_ConsultaIMG_IMAGEM, bmRead);

    // se o registro não possui fotografia então apagaremos a imagem
    // atual dentro do TImage, senão vai parecer que a fotografia seguinte
    // será igual a anterior
    if b.Size > 0 then
    begin
      // aqui ta o problema, como recuperar o jpeg do banco
      // perceba que a variavel 'Jpg' é do tipo TJpegImage que por sua vez é uma classe TGraphic
      // e que portanto poderá ser assinalada a propriedade Image1.Picure[.Graphic]
      try
        Jpg := TJpegImage.Create;
        Jpg.LoadFromStream(b);
        imgProduto.Picture.Assign(Jpg);
  //      IImagemFull.Picture.Assign(Jpg);
        imgProduto.visible := true;
      except
      end;
    end
    else
    begin
      // Essa seria a maneira natural de eliminar um desenho dentro do
      // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
      // sugerem alguns exemplos na internet, provocariamos um 'access violation',
      // pois um nulo não pode ser tratado como bitmap ou jpeg.
      imgProduto.Picture.Assign(nil);
  //    IImagemFull.Picture.Assign(nil);
      imgProduto.Visible := false;
    end;

    // Vamos liberar um pouco de memória
    jpg.Free;
    b.Destroy;    
  end
  Else
    MEProduto.Clear;

end;

procedure TFEstoqueACons.MeCodFabricanteExit(Sender: TObject);
begin
  inherited;
  If Trim(MeCodFabricante.Text) <> '' Then
   Begin
     MeCodProduto.Text:=DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+Chr(39) + Trim(MeCodFabricante.Text)+Chr(39));
     MECodProdutoExit(Self);
   End;
end;

procedure TFEstoqueACons.FormActivate(Sender: TObject);
begin
//  inherited;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR' then
     MECodFilial.Text := IntToStr(DMUsuario.CodFilialUsuario);
  If DMParamSistema.QParamSistemaIND_MOSTRA_ESTOQUE_ZERADO.Value = 'S' Then
     RgEstoque.ItemIndex := 0
  Else
     RgEstoque.ItemIndex := 1;
  MECodFilial.SetFocus;
end;

procedure TFEstoqueACons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DmEstoque do
   Begin
     QEstoqueACons.Close;
     QNotaACons.Close;
     QPedidoACons.Close;
     QOrdemCACOns.Close;
     QPedidoACons.Close;
     QSomaPedido.Close;
     QSomaNota.Close;
     QSomaOrdemC.Close;
   End;
end;

end.

unit UPrecoPocket1_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, DB, Menus, ComCtrls,
  Mask, Buttons, ExtCtrls, DBDirceu, Grids, DBGrids;

type
  TFPrecoPocket1_Cad = class(TFTCadSimples)        
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    BtConsProduto: TSpeedButton;
    DBDirceu1: TDBDirceu;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DsPrecoPocket_Item: TDataSource;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    abeladePreos1: TMenuItem;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Opes1: TMenuItem;
    Recalcularlistadepreos1: TMenuItem;
    GB_RelPrecos: TGroupBox;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    BtConsPrecoPocket: TSpeedButton;
    DBDirceu2: TDBDirceu;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBRG_Operacao: TDBRadioGroup;
    Importarlistadepreos1: TMenuItem;
    Atualizarlistadepreos1: TMenuItem;
    procedure BtConsProdutoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure DsPrecoPocket_ItemStateChange(Sender: TObject);
    procedure abeladePreos1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure BtConsPrecoPocketClick(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure Importarlistadepreos1Click(Sender: TObject);
    procedure Recalcularlistadepreos1Click(Sender: TObject);
    procedure Atualizarlistadepreos1Click(Sender: TObject);
  private
    { Private declarations }
    procedure pAtualizaLista;
    procedure pCriaLista;
    procedure pDeletalista;
    procedure pNovaLista;
    function  fIsPai(wCod_Tabela_Pocket : string) : boolean;
    function  fObrigatorios : boolean;
  public
    { Public declarations }
  end;

var
  FPrecoPocket1_Cad: TFPrecoPocket1_Cad;

implementation

uses UPrecoPocket1_cl, UProdutoCons, UProduto_cl, UPrecoPocket1_Cons,
  UGrupoProduto_Param, UrTabelaPocket, UOracle_cl, UPrecoPocketPai_Cons,
  OracleData, UAtualizaListaPreco, UBiblioteca;

{$R *.dfm}

procedure TFPrecoPocket1_Cad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil Then
     FProdutoCons := TFProdutoCons.Create(application);
  If FProdutoCons.ShowModal = MrOk Then
  begin
     DMPrecoPocket1.QPrecoPocket_ItemCod_Produto.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);
     DBEdit7.SetFocus;
  end;
end;

procedure TFPrecoPocket1_Cad.DSPrimarioStateChange(Sender: TObject);
var
  wIndState : boolean;
begin
  inherited;
  wIndState := DsPrimario.State in [DsInsert,DsEdit];

  BtConsProduto.Enabled :=     wIndState;
  BtConsPrecoPocket.Enabled := wIndState;
  Opes1.Enabled :=             not wIndState;

end;

procedure TFPrecoPocket1_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPrecoPocket1.QPrecoPocket_Cad.open;
  DMPrecoPocket1.QPrecoPocket_Item.Open;
end;

procedure TFPrecoPocket1_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPrecoPocket1.QPrecoPocket_Cad.Close;
  DMPrecoPocket1.QPrecoPocket_Item.Close;
end;

procedure TFPrecoPocket1_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPrecoPocket1_Cons = Nil then
     FPrecoPocket1_Cons := TFPrecoPocket1_Cons.Create(application);
  If FPrecoPocket1_Cons.ShowModal = MrOk Then
   Begin
     DMPrecoPocket1.QPrecoPocket_Cad.Close;
     DMPrecoPocket1.QPrecoPocket_Cad.SetVariable('PK',DMPrecoPocket1.QPrecoPocket_ConsCod_Tabela_Pocket.Value);
     DMPrecoPocket1.QPrecoPocket_Cad.Open;
     PageControl1.ActivePageIndex := 0;
   End;
end;

procedure TFPrecoPocket1_Cad.DsPrecoPocket_ItemStateChange(
  Sender: TObject);
begin
  inherited;
  If DSPrecoPocket_Item.State in [DsInsert,DsEdit] Then
    BtConsProduto.Enabled := True
  Else
    BtConsProduto.Enabled := False;  
end;

procedure TFPrecoPocket1_Cad.abeladePreos1Click(Sender: TObject);
begin
  inherited;
  if FGrupoProduto_Param = Nil then
    FGrupoProduto_Param := TFGrupoProduto_Param.Create(Application);
  FGrupoProduto_Param.PGRelatorio.Pages[2].TabVisible := true;
  if FGrupoProduto_Param.ShowModal = MrOk then
  begin
    with DMPrecoPocket1 do
    begin
      QRPrecoPocket.Close;
      if Trim(FGrupoProduto_Param.Me3Tabela.Text) <> '' then
        QRPrecoPocket.SetVariable('COD_TABELA',StrToInt(Trim(FGrupoProduto_Param.Me3Tabela.Text)))
      else
        QRPrecoPocket.SetVariable('COD_TABELA',Null);
      Case FGrupoProduto_Param.Rg3Situacao.ItemIndex of
       0 : QRPrecoPocket.SetVariable('IND_SITUACAO','ATIVO');
       1 : QRPrecoPocket.SetVariable('IND_SITUACAO','DESATIVADO');
       2 : QRPrecoPocket.SetVariable('IND_SITUACAO',Null);
      End;
      QRPrecoPocket.Open;
      if FrTabelaPocket = Nil then
        FrTabelaPocket := TFrTabelaPocket.Create(Application);
      if FGrupoProduto_Param.RGPreview.ItemIndex = 0 then
        FrTabelaPocket.QRPrimario.Preview
      else
        FrTabelaPocket.QRPrimario.Print;
      QRPrecoPocket.Close;
     End;
  end;

end;

procedure TFPrecoPocket1_Cad.PageControl1Change(Sender: TObject);
begin
  inherited;
  DMPrecoPocket1.QPrecoPocket_Item.First;
  If Not(DMPrecoPocket1.QPrecoPocket_Item.Eof) then
   Begin
    DMPrecoPocket1.QPrecoPocket_Item.Edit;
    DMPrecoPocket1.QPrecoPocket_Item.Cancel;
   End;

end;

procedure TFPrecoPocket1_Cad.SBConfirmarClick(Sender: TObject);
Var wComando : String;
begin
  inherited;
  DMPrecoPocket1.QPrecoPocket_Item.insert;
  DMPrecoPocket1.QPrecoPocket_Item.Cancel;
  If DMPrecoPocket1.QPrecoPocket_CadInd_situacao.Value = 'DESATIVADO' Then
  Begin
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_TABELA_VENDEDOR';
      wComando := wComando + ' WHERE COD_TABELA_POCKET = '+DMPrecoPocket1.QPrecoPocket_CadCod_Tabela_Pocket.Text;
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      if DMOracle.DBCemapa.inTransaction then
         DMOracle.DBCemapa.Commit;
    End;
  End;

end;

procedure TFPrecoPocket1_Cad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;
end;

procedure TFPrecoPocket1_Cad.DBEdit7Exit(Sender: TObject);
var
  wVlraVista : real;
begin
  inherited;
  with DMPrecoPocket1 do
    if QPrecoPocket_Item.State in [dsEdit, dsInsert] then
    begin
      if QPrecoPocket_CadPERC_DESC_AVISTA.Value > 0 then
        if QPrecoPocket_ItemVAL_PRECO_APRAZO.Value > 0 then
        begin
          wVlraVista := Round((QPrecoPocket_ItemVAL_PRECO_APRAZO.Value -
                               (QPrecoPocket_ItemVAL_PRECO_APRAZO.Value *
                                QPrecoPocket_CadPERC_DESC_AVISTA.Value)/100)/0.05)*0.05;
          if (QPrecoPocket_ItemVAL_PRECO_AVISTA.Value <> 0) and
             (QPrecoPocket_ItemVAL_PRECO_AVISTA.Value <> wVlraVista)  then
            if MessageDlg('O valor a vista do produto será alterado. Confirma?',
                           mtConfirmation, [mbYes, mbNo], 0) = mrNo then
              Exit;

          QPrecoPocket_ItemVAL_PRECO_AVISTA.Value := wVlraVista;
        end;
    end;
end;

procedure TFPrecoPocket1_Cad.BtConsPrecoPocketClick(Sender: TObject);
begin
  inherited;
  If FPrecoPocketPai_Cons = Nil then
     FPrecoPocketPai_Cons := TFPrecoPocketPai_Cons.Create(application);
  If FPrecoPocketPai_Cons.ShowModal = MrOk Then
   DMPrecoPocket1.QPrecoPocket_CadNUM_COD_TBL_PAI.Value := Trunc(DMPrecoPocket1.QTabelaPocket_ConsCOD_TABELA_POCKET.Value);

end;

procedure TFPrecoPocket1_Cad.DBEdit10Change(Sender: TObject);
begin
  inherited;
  if (DMPrecoPocket1.QPrecoPocket_Cad.State = dsEdit) and
     (DMPrecoPocket1.QPrecoPocket_CadNUM_COD_TBL_PAI.AsString <> '') then
    if fIsPai(DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString) then
    begin
      ShowMessage('Tabela ''Mestre'' não pode ser dependente!');
      DMPrecoPocket1.QPrecoPocket_CadNUM_COD_TBL_PAI.AsString := '';
    end;
end;

{ function fIsPai - retorna true se a tabela indicada possuir filhas
                            false se nao houver filhas
}
function TFPrecoPocket1_Cad.fIsPai(wCod_Tabela_Pocket : string): boolean;
begin
  with DMOracle.QExecSQL do
  begin
    if Active then
      DMOracle.QExecSQL.Close;
    
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) '+
            'FROM TB_TABELA_POCKET '+
            'WHERE Num_Cod_Tbl_Pai = '+wCod_Tabela_Pocket);
    DMOracle.QExecSQL.open;
    result := Fields[0].AsInteger > 0;
    DMOracle.QExecSQL.Close;
  end;
end;

procedure TFPrecoPocket1_Cad.Importarlistadepreos1Click(Sender: TObject);
begin
  inherited;
  if fObrigatorios then
  begin
    try
      DMPrecoPocket1.QPrecoPocket_Item.Close;
      if strToInt(DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_TABELA_POCKET_ITEM',
         'Cod_Tabela_Pocket = '+DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString)) > 0 then
         pAtualizaLista
      else
         pCriaLista;
      DMPrecoPocket1.QPrecoPocket_Item.open;
      ShowMessage('Importação realizada com êxito!')
    except
      ShowMessage('Ocorreu um erro durante o processo!');
    end;
  end;
end;

function TFPrecoPocket1_Cad.fObrigatorios: boolean;
begin
  result := false;
  if DBEdit10.Text = '' then
  begin
    ShowMessage('Preencha o campo ''Tabela''!');
    DBEdit10.SetFocus;
    Exit;
  end;
  if DBEdit11.Text = '' then
  begin
    ShowMessage('Preencha o campo ''% variação''!');
    DBEdit11.SetFocus;
    Exit;
  end;
  if not DBRG_Operacao.ItemIndex in [0, 1] then
  begin                                                             
    ShowMessage('Selecione uma ''Operação''!');
    DBRG_Operacao.Buttons[0].SetFocus;
    Exit;
  end;
  result := true;
end;

procedure TFPrecoPocket1_Cad.pAtualizaLista;
begin
  pDeletaLista;
  pNovaLista;
end;

procedure TFPrecoPocket1_Cad.pCriaLista;
begin
  pNovaLista;
end;

procedure TFPrecoPocket1_Cad.pDeletalista;
begin
  with DMOracle.QExecSQL do
  begin
    if Active then
      DMOracle.QExecSQL.Close;
    SQL.Clear;
    //deleta a lista de precos atual
    SQL.Add('DELETE TB_TABELA_POCKET_ITEM '+
            'WHERE Cod_Tabela_Pocket = '+DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString);
    ExecSQL;
    if DMOracle.DBCemapa.inTransaction then
       DMOracle.DBCemapa.Commit;
  end;
end;

procedure TFPrecoPocket1_Cad.pNovaLista;
var
   wDesOperador : string;
begin
  case DBRG_Operacao.ItemIndex of
    0: wDesOperador := '+';
    1: wDesOperador := '-';
  end;
  with DMOracle.QExecSQL do     
  begin
    if Active then
      DMOracle.QExecSQL.Close;
    SQL.Clear;
    //cria uma nova lista de precos baseada na tabela pai
    SQL.Add('INSERT INTO TB_TABELA_POCKET_ITEM (Cod_Tabela_Pocket, Cod_Produto, Val_Preco_AVista, Val_Preco_APrazo) '+
            'SELECT '+ DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString+', '+
                  ' Cod_Produto, '+
                  ' Round((Val_Preco_Avista'+wDesOperador+'(Val_Preco_Avista*'+
                        bib.TrocaVirgulaPorPonto(DMPrecoPocket1.QPrecoPocket_CadPERC_VARIACAO.AsString)+
                        '/100))/0.05)*0.05, '+                  {o cálculo /0.05)*0.05 serve para arredondamento em multimplos de 5}
                  ' round((Val_Preco_APrazo'+wDesOperador+'(Val_Preco_APrazo*'+
                        bib.TrocaVirgulaPorPonto(DMPrecoPocket1.QPrecoPocket_CadPERC_VARIACAO.AsString)+
                        '/100))/0.05)*0.05 '+
            'FROM TB_TABELA_POCKET_ITEM T1 '+
            'WHERE T1.Cod_Tabela_Pocket = '+DMPrecoPocket1.QPrecoPocket_CadNUM_COD_TBL_PAI.AsString);
    ExecSQL;
    if DMOracle.DBCemapa.inTransaction then
       DMOracle.DBCemapa.Commit;
  end;
end;

procedure TFPrecoPocket1_Cad.Recalcularlistadepreos1Click(Sender: TObject);
begin
  inherited;
  If FAtualizaListapreco = Nil Then     
    FAtualizaListapreco := TFAtualizaListapreco.Create(application);
  //DMTela.VerificaTela(pModulo,FPrecoPocket1_Cad.Caption,FPrecoPocket1_Cad.Name);
  FAtualizaListapreco.ShowModal;
end;

procedure TFPrecoPocket1_Cad.Atualizarlistadepreos1Click(Sender: TObject);
begin
  inherited;
  if fIsPai(DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString) then
  begin
    try
      with DMOracle.QExecSQL do
      begin
        if Active then
          DMOracle.QExecSQL.Close;
        SQL.Clear;
        //deleta todas as listas de precos filhas
        SQL.Add('DELETE TB_TABELA_POCKET_ITEM '+
                'WHERE Cod_Tabela_Pocket IN '+
                '(SELECT Cod_Tabela_Pocket '+
                ' FROM TB_TABELA_POCKET '+
                ' WHERE Num_Cod_Tbl_Pai = '+DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString+')');
        ExecSQL;

        SQL.Clear;
        //cria listas de precos para todas as tabelas filhas
        SQL.Add('INSERT INTO TB_TABELA_POCKET_ITEM (Cod_Tabela_Pocket, Cod_Produto, Val_Preco_AVista, Val_Preco_APrazo) '+
                'SELECT TPF.Cod_Tabela_Pocket, '+
                      ' Cod_Produto, '+
                      ' DECODE(TPF.Des_Operacao, ''A'', Round((Val_Preco_Avista+(Val_Preco_Avista*'+
                                                              'TPF.Perc_variacao/100))/0.05)*0.05, '+
                                                '''D'', Round((Val_Preco_Avista-(Val_Preco_Avista*'+
                                                              'TPF.Perc_variacao/100))/0.05)*0.05), '+
                      ' DECODE(TPF.Des_Operacao, ''A'', Round((Val_Preco_APrazo+(Val_Preco_APrazo*'+
                                                              'TPF.Perc_variacao/100))/0.05)*0.05, '+
                                                '''D'', Round((Val_Preco_APrazo-(Val_Preco_APrazo*'+
                                                              'TPF.Perc_variacao/100))/0.05)*0.05) '+
                'FROM TB_TABELA_POCKET TPP, TB_TABELA_POCKET TPF, TB_TABELA_POCKET_ITEM TPI '+
                'WHERE TPP.Cod_Tabela_Pocket = TPI.Cod_Tabela_Pocket '+
                 ' AND TPP.Cod_Tabela_Pocket = TPF.Num_Cod_Tbl_Pai '+
                 ' AND TPF.Num_Cod_Tbl_Pai = '+DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString);
        ExecSQL;
        if DMOracle.DBCemapa.inTransaction then
           DMOracle.DBCemapa.Commit;
        ShowMessage('Atualização realizada com êxito!');
      end;
    except
      ShowMessage('Ocorreu um erro durante o processo!');
    end;
  end
  else
    ShowMessage('Esta não é uma tabela ''pai''!');
end;

end.

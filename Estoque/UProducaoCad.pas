unit UProducaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, Menus, variants;

type
  TFProducaoEstoqueCad = class(TForm)
    MEFilial: TMaskEdit;
    MELote: TMaskEdit;
    MEOrigem: TMaskEdit;
    MEProduto: TMaskEdit;
    MEQuantidade: TMaskEdit;
    MEControle: TMaskEdit;
    MENota: TMaskEdit;
    MEDtLancto: TMaskEdit;
    RGTurno: TRadioGroup;
    RGLinha: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BTFilialCons: TBitBtn;
    BTLoteCons: TBitBtn;
    BTOrigemCons: TBitBtn;
    BTProdutoCons: TBitBtn;
    EDFilial: TEdit;
    EDLote: TEdit;
    EDOrigem: TEdit;
    EDProduto: TEdit;
    MMCadSimples: TMainMenu;
    Relatrios1: TMenuItem;
    RelatrioEstoqueProduo1: TMenuItem;
    RelatrioProduoEstabelecida1: TMenuItem;
    ResumoProduo1: TMenuItem;
    SpeedButton1: TSpeedButton;
    ConfernciaEstoqueProduo1: TMenuItem;
    RelEstoqueProduo1: TMenuItem;
    procedure BTFilialConsClick(Sender: TObject);
    procedure BTLoteConsClick(Sender: TObject);
    procedure BTOrigemConsClick(Sender: TObject);
    procedure BTProdutoConsClick(Sender: TObject);
    procedure MEFilialChange(Sender: TObject);
    procedure MELoteChange(Sender: TObject);
    procedure MEOrigemChange(Sender: TObject);
    procedure MEProdutoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RelatrioEstoqueProduo1Click(Sender: TObject);
    procedure RelatrioProduoEstabelecida1Click(Sender: TObject);
    procedure ResumoProduo1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ConfernciaEstoqueProduo1Click(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure RelEstoqueProduo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var  FProducaoEstoqueCad: TFProducaoEstoqueCad;
  wNum_Volume, wNumControle : integer;
implementation

uses UFilialCons, UFilial_cl, UTipoLoteCons, UOrigemProducaoCons,
  UTipoLote_cl, UOrigemProducao_cl, UProdutoCons, UProduto_cl, UOracle_cl,
  UUsuario_cl, UEstoque_cl, UEstoqueParam, UREstoqueProducao, UBoletimParam,
  UBoletim_cl, URProducaoEstabelecida, UREstoqueProducao2,
  UImplantaProducaoCons, UExcluiProducao, URConf_EstoqueProducao,
  URelatorioEstoque_cl, UParamSistema_cl, USequencia_cl, UREstoqueProd,
  UProdutoRelatorio_cl;

{$R *.DFM}

procedure TFProducaoEstoqueCad.BTFilialConsClick(Sender: TObject);
begin
  if FFilialCons=Nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    FProducaoEstoqueCad.MEFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
end;

procedure TFProducaoEstoqueCad.BTLoteConsClick(Sender: TObject);
begin
  if FTipoLoteCons=Nil then
     FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal=MrOk then
    FProducaoEstoqueCad.MELote.Text:=FloatToStr(DMTipoLote.QTipoLoteConsCod_Lote_Tipo.value);
end;

procedure TFProducaoEstoqueCad.BTOrigemConsClick(Sender: TObject);
begin
  if FOrigemProducaoCons=Nil then
     FOrigemProducaoCons:=TFOrigemProducaoCons.Create(Application);
  if FOrigemProducaoCons.ShowModal=MrOk then
    FProducaoEstoqueCad.MEOrigem.Text:=FloatToStr(DMOrigemProducao.QOrigemProducaoConsCod_Origem_Producao.value);
end;

procedure TFProducaoEstoqueCad.BTProdutoConsClick(Sender: TObject);
begin
  if FProdutoCons=Nil then
     FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal=MrOk then
    FProducaoEstoqueCad.MEProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.value);
end;

procedure TFProducaoEstoqueCad.MEFilialChange(Sender: TObject);
begin
  if Trim(FProducaoEstoqueCad.MEFilial.text) <> '' then
    FProducaoEstoqueCad.EDFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
              'COD_FILIAL = '+Trim(FProducaoEstoqueCad.MEFilial.text));
end;

procedure TFProducaoEstoqueCad.MELoteChange(Sender: TObject);
begin
  if Trim(FProducaoEstoqueCad.MELote.text) <> '' then
    FProducaoEstoqueCad.EDLote.text:=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
              'TB_LOTE_TIPO.COD_LOTE_TIPO = '+Trim(FProducaoEstoqueCad.MELote.text));
end;

procedure TFProducaoEstoqueCad.MEOrigemChange(Sender: TObject);
begin
  if Trim(FProducaoEstoqueCad.MEOrigem.text) <> '' then
    FProducaoEstoqueCad.EDOrigem.text:=DMOracle.BuscaNome('SELECT DESC_ORIGEM_PRODUCAO FROM TB_ORIGEM_PRODUCAO',
              'TB_ORIGEM_PRODUCAO.COD_ORIGEM_PRODUCAO = '+Trim(FProducaoEstoqueCad.MEOrigem.text));
end;

procedure TFProducaoEstoqueCad.MEProdutoChange(Sender: TObject);
begin
  if Trim(FProducaoEstoqueCad.MEProduto.text) <> '' then
    FProducaoEstoqueCad.EDProduto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
              'TB_PRODUTO.COD_PRODUTO = '+Trim(FProducaoEstoqueCad.MEProduto.text));

end;

procedure TFProducaoEstoqueCad.FormActivate(Sender: TObject);
begin
  MEDtLancto.Text:=DateToStr(Date);
  MEFilial.Text:='1';
  MELote.Text:='1';
  MEOrigem.Text := '1';
  MeQuantidade.Text := '1';
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
  Begin
    MEQuantidade.Text :='1';
    MEOrigem.Text :='1';
    MELote.Text := '18';
    MELote.ReadOnly := True;
    MELote.TabStop := False;
    MEProduto.SetFocus;
  end;  
end;

procedure TFProducaoEstoqueCad.BitBtn1Click(Sender: TObject);
var wSeq, wCont, wEmbalagem :integer;
    wSituacao,wOperacao,wAux : String;
begin

  DmUsuario.Checar_Filial_Usuario( Trim(MEFilial.Text),'ESTOQUE');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO',
              'TB_PRODUTO.COD_PRODUTO = '+Trim(FProducaoEstoqueCad.MEProduto.text));
  If Trim(MeOrigem.Text) = '' Then
     Raise Exception.Create('Informar a Origem Produção')
  Else
     wOperacao := DMOracle.BuscaNome('SELECT IND_OPERACAO FROM TB_ORIGEM_PRODUCAO',
                                     'COD_ORIGEM_PRODUCAO = '+Trim(MeOrigem.Text));
  If Trim(wSituacao) <> 'ATIVO' Then
     Raise Exception.Create('Produto não está Ativo');

  if DMParamSistema.QParamSistemaCod_empresa.Value <> 'CGS' then
  Begin
    MeOrigem.Text := '1';
    RGLinha.ItemIndex := 0;
    RGTurno.ItemIndex := 0;
    if RGTurno.ItemIndex = -1 then
      raise exception.create('Informe o Turno');
    if RGLinha.ItemIndex = -1 then
      raise exception.create('Informe a Linha');
    Try
      DMoracle.DBCemapa.StartTransaction;
      with DMEstoque do
      begin
        if (Trim(MEQuantidade.Text) <> '') and (Trim(MEProduto.Text) <> '') and
           (Trim(MELote.Text) <> '')    and (Trim(MEFilial.Text) <> '') then
        begin
          QEstoqueProducao.Close;
          QEstoqueProducao.Open;
          QEstoqueProducao.insert;
          QEstoqueProducaoCod_Produto.Value  :=StrToInt(MEProduto.Text);
          QEstoqueProducaoCod_Origem_Producao.Value :=StrToInt(MEOrigem.Text);
          QEstoqueProducaoCod_Lote_Tipo.Value:=StrToInt(MELote.Text);
          If wOperacao = '-' Then
             QEstoqueProducaoQt_Estoque_Producao.Value :=StrToFloat(MEQuantidade.Text) * -1
          Else
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOPGLASS' then
            Begin
              Wembalagem := StrToInt(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO='+Trim(MEProduto.Text)));
              QEstoqueProducaoQt_Estoque_Producao.Value :=(StrToFloat(MEQuantidade.Text)* wEmbalagem);
            end
            else
             QEstoqueProducaoQt_Estoque_Producao.Value :=StrToFloat(MEQuantidade.Text);
          QEstoqueProducaoDt_Lancamento.Value :=StrToDate(MEDtLancto.Text);
          QEstoqueProducaoCod_Usuario.Value  :=DMUsuario.CodUsuarioCorrente;
          QEstoqueProducaoCod_Filial.Value   :=StrToInt(MEFilial.Text);
          if Trim(MENota.Text) <> '' then
            QEstoqueProducaoNum_Nota.Value   :=StrToInt(MENota.Text);
          if Trim(MEControle.Text) <> '' then
            QEstoqueProducaoNum_Controle.Value   :=StrToInt(MEControle.Text);
          case RGLinha.ItemIndex of
            0:QEstoqueProducaoNum_Linha.value:=1;
            1:QEstoqueProducaoNum_Linha.value:=2;
            2:QEstoqueProducaoNum_Linha.value:=3;
            3:QEstoqueProducaoNum_Linha.value:=4;
            4:QEstoqueProducaoNum_Linha.value:=5;
            5:QEstoqueProducaoNum_Linha.value:=6;
            6:QEstoqueProducaoNum_Linha.value:=7;
          end;
          case RGTurno.ItemIndex of
            0:QEstoqueProducaoInd_Turno.value:='M';
            1:QEstoqueProducaoInd_Turno.value:='T';
            2:QEstoqueProducaoInd_Turno.value:='N';
          end;
          QEstoqueProducao.Post;

          DMEstoque.AtualizaEstoque(-1,StrToInt(MEFilial.Text),StrToInt(MEProduto.Text),
                                  StrToInt(MELote.Text),QEstoqueProducaoQt_Estoque_Producao.Value,0,0,0);
          DMOracle.DBCemapa.Commit;
        end;
      end;
    except
      ShowMessage('Erro na Gravação do Lançamento da Produção');
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
    MEDtLancto.Text:=DateToStr(Date);
    MEFilial.Text:='1';
    MEOrigem.Text := '1';
    MELote.Text:='1';
    MEProduto.Clear;
    MENota.Clear;
    MEControle.Clear;
    MEQuantidade.Text := '1';
    RGLinha.ItemIndex:=0;
    RGTurno.ItemIndex:=0;
    MEProduto.SetFocus;
  end
  else
  Begin //AQUI COMEÇA INCLUIR PRODUÇÃO DA CGS NO ESTOQUE
    MELote.Text := '18';
    wAux := DMOracle.Buscanome('SELECT COD_PRODUTO FROM TB_ESTOQUE_PRODUCAO','NUM_CONTROLE =' + IntToStr(wNumControle));
    if wAux <> '' then
      Raise Exception.Create('Este produto já foi dada entrada em estoque!')
    else
    Begin
      Try
        DMoracle.DBCemapa.StartTransaction;
        with DMEstoque do
        begin
          if (Trim(MEQuantidade.Text) <> '') and (Trim(MEProduto.Text) <> '') and
             (Trim(MELote.Text) <> '')    and (Trim(MEFilial.Text) <> '') then
          begin
            wCont := 0;
            while wNum_Volume > wCont do
              Begin
                QEstoqueProducao.Close;
                QEstoqueProducao.Open;
                QEstoqueProducao.insert;
                QEstoqueProducaoCod_Produto.Value  :=StrToInt(MEProduto.Text);
                QEstoqueProducaoCod_Origem_Producao.Value :=StrToInt(MEOrigem.Text);
                QEstoqueProducaoCod_Lote_Tipo.Value:=18;
                QEstoqueProducaoQt_Estoque_Producao.Value :=StrToFloat(MEQuantidade.Text);
                QEstoqueProducaoDt_Lancamento.Value :=StrToDate(MEDtLancto.Text);
                QEstoqueProducaoCod_Usuario.Value  :=DMUsuario.CodUsuarioCorrente;
                QEstoqueProducaoCod_Filial.Value   :=StrToInt(MEFilial.Text);
                if wNumControle = 0 then
                  QEstoqueProducaoNUM_CONTROLE.Value := DMSequencia.Sequencia(DMEstoque.QEstoqueProducaoCOD_FILIAL.Value,'PRODUCAO-CGS')
                else
                  QEstoqueProducaoNUM_CONTROLE.Value := wNumControle;
                QEstoqueProducaoInd_Turno.value:='N'; //indica se o produto foi embarcado
                QEstoqueProducaoNum_Linha.value:= 1;  //indica se ja foi impresso a etiqueta de embarque. 2 significa q foi impresso

                QEstoqueProducao.Post;
                inc(wCont);
                wNumControle := 0;
              end;

              DMEstoque.AtualizaEstoque(-2,StrToInt(MEFilial.Text),StrToInt(MEProduto.Text),
                                      18,StrToFloat(MEQuantidade.Text),0,0,0);

              DMOracle.QExecSQL.Close;
              DMOracle.QExecSQL.SQL.Clear;
              DMOracle.QExecSQL.SQL.Add('UPDATE TB_ORDEM_PRODUCAO_ITEM SET QT_QUANTIDADE = QT_QUANTIDADE - 1');
              DMOracle.QExecSQL.SQL.Add('WHERE COD_ORDEM_PRODUCAO_ITEM IN (' );
              DMOracle.QExecSQL.SQL.Add('SELECT COD_ORDEM_PRODUCAO_ITEM FROM TB_ORDEM_PRODUCAO_CAB, TB_ORDEM_PRODUCAO_ITEM');
              DMOracle.QExecSQL.SQL.Add('WHERE TB_ORDEM_PRODUCAO_CAB.COD_ORDEM_PRODUCAO_CAB = TB_ORDEM_PRODUCAO_ITEM.COD_ORDEM_PRODUCAO_CAB ');
              DMOracle.QExecSQL.SQL.Add('AND TB_ORDEM_PRODUCAO_CAB.DESC_TIPO_ORDEM = ''PINTURA'' ');
              DMOracle.QExecSQL.SQL.Add('AND TB_ORDEM_PRODUCAO_CAB.IND_SITUACAO = 2 ');
              DMOracle.QExecSQL.SQL.Add('AND TB_ORDEM_PRODUCAO_ITEM.COD_PRODUTO = '+MEProduto.Text);
              DMOracle.QExecSQL.SQL.Add(' AND TB_ORDEM_PRODUCAO_ITEM.QT_QUANTIDADE <> 0');
              DMOracle.QExecSQL.SQL.Add(' AND ROWNUM = 1 )');
              DMOracle.QExecSQL.ExecSQL;


              QBaixaEstoqueFormula.close; //aqui começa baixar os componentes da formula
              QBaixaEstoqueFormula.SetVariable('PRODUTO',StrToInt(MEProduto.Text));
              QBaixaEstoqueFormula.open;
              QBaixaEstoqueFormula.first;

              while not QBaixaEstoqueFormula.EOF do
              Begin
                DMEstoque.AtualizaEstoque(-2,StrToInt(MEFilial.Text),QBaixaEstoqueFormulaCOD_PRODUTO.Value,
                                      310,((QBaixaEstoqueFormulaQT_ITEM.Value)* StrToFloat(MEQuantidade.Text)*-1),0,0,0);

                DMOracle.QExecSQL.Close;
                DMOracle.QExecSQL.SQL.Clear;
                DMOracle.QExecSQL.SQL.Add('UPDATE TB_ESTOQUE SET QT_COMPROMETIDO = QT_COMPROMETIDO -' + FloatToStr(((QBaixaEstoqueFormulaQT_ITEM.Value)* StrToFloat(MEQuantidade.Text))));
                DMOracle.QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + IntToStr(QBaixaEstoqueFormulaCOD_PRODUTO.Value));
                DMOracle.QExecSQL.SQL.Add('AND COD_LOTE_TIPO = 310');
                DMOracle.QExecSQL.ExecSQL;

                QBaixaEstoqueFormula.Next;
              End;
            //end;
            DMOracle.DBCemapa.Commit;
          end;
        end;
      except
        ShowMessage('Erro na Gravação do Lançamento da Produção');
        DMOracle.DBCemapa.Rollback;
        raise;
      end;
      MEDtLancto.Text:=DateToStr(Date);
      MEFilial.Text := '1';
      MEOrigem.clear;
      MELote.Text := '18';
      MEProduto.Clear;
      MENota.Clear;
      MEControle.Clear;
      MEQuantidade.Text := '1';
      MEOrigem.Text := '1';
      RGLinha.ItemIndex:=-1;
      RGTurno.ItemIndex:=-1;
      MEProduto.SetFocus;
    end;
  end;  
end;

procedure TFProducaoEstoqueCad.BitBtn2Click(Sender: TObject);
begin
  MEDtLancto.Text:=DateToStr(Date);
  MEFilial.Text:='1';
  MEOrigem.clear;
  MELote.Text:='1';
  MEProduto.Clear;
  MENota.Clear;
  MEControle.Clear;
  MEQuantidade.Clear;
  RGLinha.ItemIndex:=-1;
  RGTurno.ItemIndex:=-1;
  MEOrigem.SetFocus;
end;

procedure TFProducaoEstoqueCad.RelatrioEstoqueProduo1Click(
  Sender: TObject);
begin
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
  FEstoqueParam.PGRelatorio.Pages[12].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
   Begin
     if (FEstoqueParam.ME12Data_I.Text = '' )or (FEstoqueParam.ME12Data_F.Text = '' ) then
       raise exception.Create('Informe o período');
     DmUsuario.Checar_Filial_Usuario( Trim(FEstoqueParam.ME12Filial.Text),'ESTOQUE');
     With DMEstoque do
     Begin
       QREstoqueProducao.Close;
       If Trim(FEstoqueParam.Me12Produto.Text) <> '' Then
         QREstoqueProducao.SetVariable('COD_PRODUTO',StrToInt(Trim(FEstoqueParam.Me12Produto.Text)))
       Else
         QREstoqueProducao.SetVariable('COD_PRODUTO',Null);

       If Trim(FEstoqueParam.Me12Origem.Text) <> '' Then
         QREstoqueProducao.SetVariable('COD_ORIGEM_PRODUCAO',StrToInt(Trim(FEstoqueParam.Me12Origem.Text)))
       Else
         QREstoqueProducao.SetVariable('COD_ORIGEM_PRODUCAO',Null);

       If Trim(FEstoqueParam.Me12Filial.Text)<>'' then
         QREstoqueProducao.SetVariable('COD_FILIAL',StrToInt(FEstoqueParam.Me12Filial.Text))
       Else
         QREstoqueProducao.SetVariable('COD_FILIAL',Null);

       QREstoqueProducao.SetVariable('DATA_I',FEstoqueParam.ME12Data_I.Text);
       QREstoqueProducao.SetVariable('DATA_F',FEstoqueParam.ME12Data_F.Text);

       case FEstoqueParam.RG12Turno.ItemIndex of
         0:QREstoqueProducao.SetVariable('IND_TURNO','M');
         1:QREstoqueProducao.SetVariable('IND_TURNO','T');
         2:QREstoqueProducao.SetVariable('IND_TURNO','N');
         3:QREstoqueProducao.SetVariable('IND_TURNO',null);
       end;

       case FEstoqueParam.RG12Linha.ItemIndex of
          0:QREstoqueProducao.SetVariable('NUM_LINHA',1);
          1:QREstoqueProducao.SetVariable('NUM_LINHA',2);
          2:QREstoqueProducao.SetVariable('NUM_LINHA',3);
          3:QREstoqueProducao.SetVariable('NUM_LINHA',4);
          4:QREstoqueProducao.SetVariable('NUM_LINHA',5);
          5:QREstoqueProducao.SetVariable('NUM_LINHA',6);
          6:QREstoqueProducao.SetVariable('NUM_LINHA',7);
          7:QREstoqueProducao.SetVariable('NUM_LINHA',null);
       End;
       QREstoqueProducao.Open;
     End;
     If FREstoqueProducao = Nil then
       FREstoqueProducao:=TFREstoqueProducao.Create(Application);
     FREstoqueProducao.QRLParametros.Caption := 'Filial:'+FEstoqueParam.Ed12Filial.Text+' De '+FEstoqueParam.ME12Data_I.Text+' Até '+ FEstoqueParam.ME12Data_F.Text;
     If FEstoqueParam.RGPreview.ItemIndex=0 then
       FREstoqueProducao.QRPrimario.Preview
     Else
       FREstoqueProducao.QRPrimario.Print;
     DMEstoque.QREstoqueProducao.Close;
   End;
end;

procedure TFProducaoEstoqueCad.RelatrioProduoEstabelecida1Click(
  Sender: TObject);
begin
  if FBoletimParam = Nil then
    FBoletimParam:= TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[4].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  with DMBoletim do
  begin
    QRProducaoEstabelecida.Close;
    if Trim(FBoletimParam.ME4Filial.Text) = '' then
      QRProducaoEstabelecida.SetVariable('FILIAL',Null)
    else
      QRProducaoEstabelecida.SetVariable('FILIAL',StrToInt(Trim(FBoletimParam.ME4Filial.Text)));
    If Trim(FBoletimParam.ME4ClasseInicial.text) <> '' then
      QRProducaoEstabelecida.SetVariable('CLASSE_INICIAL',FBoletimParam.ME4ClasseInicial.text)
    Else
      QRProducaoEstabelecida.SetVariable('CLASSE_INICIAL',Null);
    if Trim(FBoletimParam.ME4Produto.Text) = '' then
      QRProducaoEstabelecida.SetVariable('PRODUTO',Null)
    else
      QRProducaoEstabelecida.SetVariable('PRODUTO',StrToInt(Trim(FBoletimParam.ME4Produto.Text)));
    if Trim(FBoletimParam.ME4Lote.Text) = '' then
      QRProducaoEstabelecida.SetVariable('LOTE',Null)
    else
      QRProducaoEstabelecida.SetVariable('LOTE',StrToInt(Trim(FBoletimParam.ME4Lote.Text)));
    QRProducaoEstabelecida.Open;
    if FRProducaoEstabelecida = Nil then
      FRProducaoEstabelecida := TFRProducaoEstabelecida.Create(Application);
    FRProducaoEstabelecida.QRLFilial.Caption := 'Filial: '+Trim(FBoletimParam.ME4Filial.Text)+' '+FBoletimParam.Ed4Filial.Text;
    if FBoletimParam.RGPreview.ItemIndex = 0 then
       FRProducaoEstabelecida.QRPrimario.Preview
    else
      FRProducaoEstabelecida.QRPrimario.Print;
    QRProducaoEstabelecida.Close;
  end;
end;

procedure TFProducaoEstoqueCad.ResumoProduo1Click(Sender: TObject);
begin
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
    FEstoqueParam.PGRelatorio.Pages[12].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
    Begin
      if (FEstoqueParam.ME12Data_I.Text = '' )or (FEstoqueParam.ME12Data_F.Text = '' ) then
        raise exception.Create('Informe o período');
      DmUsuario.Checar_Filial_Usuario( Trim(FEstoqueParam.ME12Filial.Text),'ESTOQUE');
         With DMEstoque do
         Begin
           QREstoqueProducao2.Close;
           If Trim(FEstoqueParam.Me12Produto.Text) <> '' Then
             QREstoqueProducao2.SetVariable('COD_PRODUTO',StrToInt(Trim(FEstoqueParam.Me12Produto.Text)))
           Else
             QREstoqueProducao2.SetVariable('COD_PRODUTO',Null);

           If Trim(FEstoqueParam.Me12Origem.Text) <> '' Then
             QREstoqueProducao2.SetVariable('COD_ORIGEM_PRODUCAO',StrToInt(Trim(FEstoqueParam.Me12Origem.Text)))
           Else
              QREstoqueProducao2.SetVariable('COD_ORIGEM_PRODUCAO',Null);

           If Trim(FEstoqueParam.Me12Filial.Text)<>'' then
             QREstoqueProducao2.SetVariable('COD_FILIAL',StrToInt(FEstoqueParam.Me12Filial.Text))
           Else
              QREstoqueProducao2.SetVariable('COD_FILIAL',Null);

           If Trim(FEstoqueParam.Me12Classe.Text)<>'' then
             QREstoqueProducao2.SetVariable('CLASSE',StrToInt(FEstoqueParam.Me12Classe.Text))
           Else
              QREstoqueProducao2.SetVariable('CLASSE',Null);

           QREstoqueProducao2.SetVariable('DATA_I',FEstoqueParam.ME12Data_I.Text);
           QREstoqueProducao2.SetVariable('DATA_F',FEstoqueParam.ME12Data_F.Text);

           case FEstoqueParam.RG12Turno.ItemIndex of
             0:QREstoqueProducao2.SetVariable('IND_TURNO','M');
             1:QREstoqueProducao2.SetVariable('IND_TURNO','T');
             2:QREstoqueProducao2.SetVariable('IND_TURNO','N');
             3:QREstoqueProducao2.SetVariable('IND_TURNO',null);
           end;
             
            case FEstoqueParam.RG12Linha.ItemIndex of
             0:QREstoqueProducao2.SetVariable('NUM_LINHA',1);
             1:QREstoqueProducao2.SetVariable('NUM_LINHA',2);
             2:QREstoqueProducao2.SetVariable('NUM_LINHA',3);
             3:QREstoqueProducao2.SetVariable('NUM_LINHA',4);
             4:QREstoqueProducao2.SetVariable('NUM_LINHA',5);
             5:QREstoqueProducao2.SetVariable('NUM_LINHA',6);
             6:QREstoqueProducao2.SetVariable('NUM_LINHA',7);
             7:QREstoqueProducao2.SetVariable('NUM_LINHA',null);
           end;

           QREstoqueProducao2.Open;
         End;
         If FREstoqueProducao2 = Nil then
           FREstoqueProducao2:=TFREstoqueProducao2.Create(Application);

         case FEstoqueParam.RG12Turno.ItemIndex of
           0:FREstoqueProducao2.QRLTurno.caption:='Turno: Manhã';
           1:FREstoqueProducao2.QRLTurno.caption:='Turno: Tarde';
           2:FREstoqueProducao2.QRLTurno.caption:='Turno: Noite';
           3:FREstoqueProducao2.QRLTurno.caption:='Turno: Todos';
         end;

         case FEstoqueParam.RG12Linha.ItemIndex of
           0:FREstoqueProducao2.QRLLinha.caption:='Linha: 1';
           1:FREstoqueProducao2.QRLLinha.caption:='Linha: 2';
           2:FREstoqueProducao2.QRLLinha.caption:='Linha: 3';
           3:FREstoqueProducao2.QRLLinha.caption:='Linha: 4';
           4:FREstoqueProducao2.QRLLinha.caption:='Linha: 5';
           5:FREstoqueProducao2.QRLLinha.caption:='Linha: 6';
           6:FREstoqueProducao2.QRLLinha.caption:='Linha: 7';
           7:FREstoqueProducao2.QRLLinha.caption:='Linha: Todas';
         end;
         FREstoqueProducao2.QRLParametros.Caption := 'Filial:'+FEstoqueParam.Ed12Filial.Text+' De '+FEstoqueParam.ME12Data_I.Text+' Até '+ FEstoqueParam.ME12Data_F.Text;

         If FEstoqueParam.RGPreview.ItemIndex=0 then
           FREstoqueProducao2.QRPrimario.Preview
         Else
           FREstoqueProducao2.QRPrimario.Print;
         DMEstoque.QREstoqueProducao2.Close;
    End;
end;

procedure TFProducaoEstoqueCad.SpeedButton1Click(Sender: TObject);
begin
  If FImplantaProducaoCons = Nil then
    FImplantaProducaoCons := TFImplantaProducaoCons.Create(Application);
  If FImplantaProducaoCons.ShowModal = mrOk then
  With DMEstoque do
  Begin
    QEstoqueProducao.Close;
    QEstoqueProducao.SetVariable('PK',QEstoqueProducaoConsCod_Estoque_Producao.Value);
    QEstoqueProducao.Open;
    if FExcluiProducao = nil then
      FExcluiProducao := TFExcluiProducao.create(Application);
    FExcluiProducao.MEProduto.Text:=QEstoqueProducaoCod_Produto.Text;
    FExcluiProducao.MEDescProduto.text:=QEstoqueProducaoDesc_Produto.Text;
    FExcluiProducao.MEOrigem.text:=QEstoqueProducaoCod_Origem_Producao.Text;
    FExcluiProducao.MEDescOrigem.text:=QEstoqueProducaoDesc_Origem_Producao.Text;
    FExcluiProducao.MEDtLancto.Text:=QEstoqueProducaoDt_Lancamento.Text;
    FExcluiProducao.MEQuantidade.Text:=QEstoqueProducaoQT_ESTOQUE_PRODUCAO.Text;
    FExcluiProducao.MENota.Text:=QEstoqueProducaoNum_Nota.Text;
    FExcluiProducao.MEControle.Text:=QEstoqueProducaoNum_Controle.Text;
    case QEstoqueProducaoNum_Linha.value of
      1:FExcluiProducao.RGLinhaCons.ItemIndex:=0;
      2:FExcluiProducao.RGLinhaCons.ItemIndex:=1;
      3:FExcluiProducao.RGLinhaCons.ItemIndex:=2;
      4:FExcluiProducao.RGLinhaCons.ItemIndex:=3;
      5:FExcluiProducao.RGLinhaCons.ItemIndex:=4;
      6:FExcluiProducao.RGLinhaCons.ItemIndex:=5;
      7:FExcluiProducao.RGLinhaCons.ItemIndex:=6;
    end;
    if QEstoqueProducaoInd_Turno.value = 'M' then
      FExcluiProducao.RGTurnoCons.ItemIndex:=0;
    if QEstoqueProducaoInd_Turno.value = 'T' then
      FExcluiProducao.RGTurnoCons.ItemIndex:=1;
    if QEstoqueProducaoInd_Turno.value = 'N' then
      FExcluiProducao.RGTurnoCons.ItemIndex:=2;
    FExcluiProducao.ShowModal;
  End;
end;

procedure TFProducaoEstoqueCad.ConfernciaEstoqueProduo1Click(
  Sender: TObject);
begin
   if FEstoqueParam = Nil then
    FEstoqueParam:= TFEstoqueParam.Create(Application);
  FEstoqueParam.PGRelatorio.Pages[13].TabVisible := True;
  FEstoqueParam.ME13DtInicial.text := DateToStr(date);
  FEstoqueParam.ME13DtFinal.text := DateToStr(date);
  if FEstoqueParam.ShowModal = mrOk then
  with DMRelatorio_Estoque do
  begin
    QRConfEstoqueProducao.Close;
    if (FEstoqueParam.ME13DtInicial.Text = '' )or (FEstoqueParam.ME13DtFinal.Text = '' ) then
        raise exception.Create('Informe o período')
      else
        QRConfEstoqueProducao.SetVariable('DT_INICIAL',FEstoqueParam.ME13DtInicial.Text);
        QRConfEstoqueProducao.SetVariable('DT_FINAL',FEstoqueParam.ME13DtFinal.Text);
    if Trim(FEstoqueParam.ME13Filial.Text) = '' then
      QRConfEstoqueProducao.SetVariable('COD_FILIAL',Null)
    else
      QRConfEstoqueProducao.SetVariable('COD_FILIAL',StrToInt(Trim(FEstoqueParam.ME13Filial.Text)));

    if Trim(FEstoqueParam.ME13Produto.Text) = '' then
      QRConfEstoqueProducao.SetVariable('COD_PRODUTO',Null)
    else
      QRConfEstoqueProducao.SetVariable('COD_PRODUTO',StrToInt(Trim(FEstoqueParam.ME13Produto.Text)));

    if Trim(FEstoqueParam.ME13Classe.Text) = '' then
      QRConfEstoqueProducao.SetVariable('CLASSE',Null)
    else
      QRConfEstoqueProducao.SetVariable('CLASSE',StrToInt(Trim(FEstoqueParam.ME13Classe.Text)));

    QRConfEstoqueProducao.Open;
    if FRConf_EstoqueProducao = Nil then
      FRConf_EstoqueProducao := TFRConf_EstoqueProducao.Create(Application);
    FRConf_EstoqueProducao.QRLFilial.Caption := 'Filial: '+Trim(FEstoqueParam.ME13Filial.Text)+' '+FEstoqueParam.Ed13Filial.Text;
    FRConf_EstoqueProducao.QRLProduto.Caption := 'Produto: '+Trim(FEstoqueParam.ME13Produto.Text)+' '+FEstoqueParam.Ed13Produto.Text;
    FRConf_EstoqueProducao.QrlPeriodo.Caption := 'Período de :' + FEstoqueParam.ME13DtInicial.Text + ' Até ' + FEstoqueParam.ME13DtFinal.Text;
    FRConf_EstoqueProducao.QRLClasse.Caption := 'Classe: '+Trim(FEstoqueParam.ME13Classe.Text)+' '+FEstoqueParam.Ed13Classe.Text;
    if FEstoqueParam.RGPreview.ItemIndex = 0 then
       FRConf_EstoqueProducao.QRPrimario.Preview
    else
      FRConf_EstoqueProducao.QRPrimario.Print;
    QRConfEstoqueProducao.Close;
  end;
end;

procedure TFProducaoEstoqueCad.MEProdutoExit(Sender: TObject);
var wSeq:integer;
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' then
  Begin
    If MEProduto.Text <> '' then
    Begin
      wNum_Volume :=  StrToInt(Copy(MEProduto.Text,13,1));
      wNum_Volume := wNum_Volume * StrToInt(MeQuantidade.text);
      wNumControle := StrToInt(Copy(MEProduto.Text,1,6));
      MEProduto.Text := Copy(MEProduto.Text,7,6);   
      BitBtn1.SetFocus;
    end;
  end;  
end;

procedure TFProducaoEstoqueCad.RelEstoqueProduo1Click(Sender: TObject);
begin
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
    FEstoqueParam.PGRelatorio.Pages[14].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
  Begin
    with DMProdutoRelatorio do
    Begin
      QrEstoqueSemEmbarque.Close;
      if Trim(FEstoqueParam.FMClasse1.MEClasse.Text) = '' then
        QREstoqueSemEmbarque.SetVariable('CLASSE', NULL)
      else
        QREstoqueSemEmbarque.SetVariable('CLASSE',FEstoqueParam.FMClasse1.MEClasse.Text);
      QrEstoqueSemEmbarque.Open;
    end;
  end;  
  if FREstoqueSemEmbarque = Nil then
    FREstoqueSemEmbarque := TFREstoqueSemEmbarque.Create(Application);
  FREstoqueSemEmbarque.QRPrimario.Preview;
end;

end.
